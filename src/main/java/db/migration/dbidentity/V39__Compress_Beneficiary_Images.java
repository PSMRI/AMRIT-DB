/*
* AMRIT – Accessible Medical Records via Integrated Technology
* Integrated EHR (Electronic Health Records) Solution
*
* Copyright (C) "Piramal Swasthya Management and Research Institute"
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/
package db.migration.dbidentity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.flywaydb.core.api.migration.BaseJavaMigration;
import org.flywaydb.core.api.migration.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Shrinks every beneficiary photo in db_identity.i_beneficiaryimage to at most 400px wide, 90% JPEG. The photos are
 * stored as base64 text exactly as the camera or the mobile app sent them, which made the table very large.
 *
 * SQL cannot resize an image, so this migration is Java. It sits in the same Flyway location as the SQL files
 * (classpath:db/migration/dbidentity), so Flyway picks it up as version 39 and runs it
 * once per database (central and every laptop), recorded in flyway_schema_history like any SQL migration.
 *
 * Safeguards:
 * - LastModDate is kept as it was (SET LastModDate = LastModDate), otherwise central down-sync would resend every
 *   photo to every laptop. Processed and DownSynced are not touched, so nothing is uploaded again either.
 * - The UPDATE triggers on the table (trg_scl_ben_image_au writes to db_iemr.t_sync_change_log) are dropped for the
 *   run and recreated afterwards, even when the run fails, otherwise every tablet would re-download every
 *   beneficiary. Their definitions are saved in tmp_v39_suspended_triggers first, so a run killed half-way (laptop
 *   update timeout, power cut) still recreates them on the next start; the table is dropped once they are back.
 * - Rows are read and committed in batches, so central is never held in one huge transaction. A row changed by the
 *   application while it is being compressed is left alone (the UPDATE matches the LastModDate it was read with).
 * - Photos that are empty, unreadable or not made at least 10% smaller are left unchanged.
 *
 * The space freed inside the table file is returned to disk only by a rebuild, which is left as a manual step:
 * OPTIMIZE TABLE db_identity.i_beneficiaryimage;
 */
public class V39__Compress_Beneficiary_Images extends BaseJavaMigration {

	private static final Logger logger = LoggerFactory.getLogger(V39__Compress_Beneficiary_Images.class);

	static final String TABLE = "i_beneficiaryimage";
	static final int MAX_WIDTH = 400;
	static final float JPEG_QUALITY = 0.9f;
	static final int BATCH_SIZE = 100;
	/** base64 text shorter than this is already small; not worth decoding. */
	static final int MIN_LENGTH_TO_COMPRESS = 20 * 1024;
	/** Holds the trigger definitions while they are dropped, so a killed run can still restore them. */
	static final String SAVED_TRIGGERS = "tmp_v39_suspended_triggers";

	private final BeneficiaryImageCompressor compressor;

	public V39__Compress_Beneficiary_Images() {
		this(new BeneficiaryImageCompressor(MAX_WIDTH, JPEG_QUALITY));
	}

	V39__Compress_Beneficiary_Images(BeneficiaryImageCompressor compressor) {
		this.compressor = compressor;
	}

	/** Each batch is committed on its own; one transaction over the whole table would be far too large. */
	@Override
	public boolean canExecuteInTransaction() {
		return false;
	}

	@Override
	public void migrate(Context context) throws Exception {
		Connection connection = context.getConnection();
		if (!tableExists(connection)) {
			logger.info("{} does not exist in this database - nothing to compress", TABLE);
			return;
		}

		List<Trigger> triggers = suspendTriggers(connection);
		boolean autoCommit = connection.getAutoCommit();
		try {
			connection.setAutoCommit(false);
			compressAll(connection);
		} finally {
			if (!connection.getAutoCommit())
				connection.rollback(); // a batch left open by a failure
			connection.setAutoCommit(autoCommit);
			restoreTriggers(connection, triggers);
		}
		logger.info("Done. Run OPTIMIZE TABLE db_identity.{} to return the freed space to disk.", TABLE);
	}

	Stats compressAll(Connection connection) throws SQLException {
		Stats stats = new Stats();
		long lastID = 0;

		String select = "SELECT BenImageId, BenImage, LastModDate FROM " + TABLE
				+ " WHERE BenImageId > ? AND BenImage IS NOT NULL AND LENGTH(BenImage) >= ?"
				+ " ORDER BY BenImageId LIMIT ?";
		String update = "UPDATE " + TABLE + " SET BenImage = ?, LastModDate = LastModDate"
				+ " WHERE BenImageId = ? AND LastModDate <=> ?";

		while (true) {
			List<Row> rows = new ArrayList<>();
			try (PreparedStatement ps = connection.prepareStatement(select)) {
				ps.setLong(1, lastID);
				ps.setInt(2, MIN_LENGTH_TO_COMPRESS);
				ps.setInt(3, BATCH_SIZE);
				try (ResultSet rs = ps.executeQuery()) {
					while (rs.next())
						rows.add(new Row(rs.getLong(1), rs.getString(2), rs.getTimestamp(3)));
				}
			}
			if (rows.isEmpty())
				break;

			try (PreparedStatement ps = connection.prepareStatement(update)) {
				for (Row row : rows) {
					stats.read++;
					stats.bytesBefore += row.image.length();
					String smaller = compressor.compress(row.image);
					if (smaller == null) {
						stats.skipped++;
						stats.bytesAfter += row.image.length();
						continue;
					}
					ps.setString(1, smaller);
					ps.setLong(2, row.id);
					ps.setTimestamp(3, row.lastModDate);
					if (ps.executeUpdate() == 1) {
						stats.compressed++;
						stats.bytesAfter += smaller.length();
					} else {
						stats.changedMeanwhile++;
						stats.bytesAfter += row.image.length();
					}
				}
			}
			connection.commit();

			lastID = rows.get(rows.size() - 1).id;
			logger.info("{}: up to BenImageId {} - {}", TABLE, lastID, stats);
		}

		logger.info("{} finished - {}", TABLE, stats);
		return stats;
	}

	private boolean tableExists(Connection connection) throws SQLException {
		try (PreparedStatement ps = connection.prepareStatement("SELECT COUNT(*) FROM information_schema.TABLES"
				+ " WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ?")) {
			ps.setString(1, TABLE);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() && rs.getInt(1) > 0;
			}
		}
	}

	/**
	 * Saves the UPDATE triggers' definitions and drops the triggers. When an earlier run was killed after dropping
	 * them, the definitions it saved are used, since the triggers themselves are gone by then.
	 */
	List<Trigger> suspendTriggers(Connection connection) throws SQLException {
		try (Statement st = connection.createStatement()) {
			st.execute("CREATE TABLE IF NOT EXISTS " + SAVED_TRIGGERS + " (TRIGGER_NAME VARCHAR(64) NOT NULL PRIMARY KEY,"
					+ " ACTION_TIMING VARCHAR(10) NOT NULL, ACTION_ORDER INT NOT NULL, ACTION_STATEMENT LONGTEXT NOT NULL)");
		}

		List<Trigger> saved = savedTriggers(connection);
		if (!saved.isEmpty()) {
			logger.warn("An earlier run was interrupted; using the {} trigger definition(s) it saved", saved.size());
		} else {
			saved = updateTriggers(connection);
			try (PreparedStatement ps = connection.prepareStatement("INSERT INTO " + SAVED_TRIGGERS
					+ " (TRIGGER_NAME, ACTION_TIMING, ACTION_ORDER, ACTION_STATEMENT) VALUES (?, ?, ?, ?)")) {
				int order = 0;
				for (Trigger trigger : saved) {
					ps.setString(1, trigger.name);
					ps.setString(2, trigger.timing);
					ps.setInt(3, ++order);
					ps.setString(4, trigger.action);
					ps.executeUpdate();
				}
			}
		}

		try (Statement st = connection.createStatement()) {
			for (Trigger trigger : saved) {
				st.execute("DROP TRIGGER IF EXISTS `" + trigger.name + "`");
				logger.info("Dropped trigger {} for the run; it is recreated afterwards", trigger.name);
			}
		}
		return saved;
	}

	private List<Trigger> savedTriggers(Connection connection) throws SQLException {
		List<Trigger> triggers = new ArrayList<>();
		try (PreparedStatement ps = connection.prepareStatement("SELECT TRIGGER_NAME, ACTION_TIMING, ACTION_STATEMENT"
				+ " FROM " + SAVED_TRIGGERS + " ORDER BY ACTION_ORDER")) {
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next())
					triggers.add(new Trigger(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		}
		return triggers;
	}

	List<Trigger> updateTriggers(Connection connection) throws SQLException {
		List<Trigger> triggers = new ArrayList<>();
		try (PreparedStatement ps = connection.prepareStatement(
				"SELECT TRIGGER_NAME, ACTION_TIMING, ACTION_STATEMENT FROM information_schema.TRIGGERS"
						+ " WHERE EVENT_OBJECT_SCHEMA = DATABASE() AND EVENT_OBJECT_TABLE = ?"
						+ " AND EVENT_MANIPULATION = 'UPDATE' ORDER BY ACTION_TIMING, ACTION_ORDER")) {
			ps.setString(1, TABLE);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next())
					triggers.add(new Trigger(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		}
		return triggers;
	}

	/** Recreates the triggers, then drops the saved definitions; on any failure the definitions are kept. */
	private void restoreTriggers(Connection connection, List<Trigger> triggers) throws SQLException {
		SQLException first = null;
		try (Statement st = connection.createStatement()) {
			for (Trigger trigger : triggers) {
				try {
					st.execute(trigger.createStatement());
					logger.info("Recreated trigger {}", trigger.name);
				} catch (SQLException e) {
					logger.error("Could not recreate trigger {} - its definition stays in {}; recreate it by hand: {}",
							trigger.name, SAVED_TRIGGERS, trigger.createStatement(), e);
					if (first == null)
						first = e;
				}
			}
			if (first == null)
				st.execute("DROP TABLE IF EXISTS " + SAVED_TRIGGERS);
		}
		if (first != null)
			throw first;
	}

	static final class Trigger {
		final String name;
		final String timing;
		final String action;

		Trigger(String name, String timing, String action) {
			this.name = name;
			this.timing = timing;
			this.action = action;
		}

		String createStatement() {
			return "CREATE TRIGGER `" + name + "` " + timing + " UPDATE ON `" + TABLE + "` FOR EACH ROW " + action;
		}
	}

	private static final class Row {
		final long id;
		final String image;
		final Timestamp lastModDate;

		Row(long id, String image, Timestamp lastModDate) {
			this.id = id;
			this.image = image;
			this.lastModDate = lastModDate;
		}
	}

	static final class Stats {
		long read;
		long compressed;
		long skipped;
		long changedMeanwhile;
		long bytesBefore;
		long bytesAfter;

		@Override
		public String toString() {
			return String.format("read %d, compressed %d, left unchanged %d, changed meanwhile %d, %d MB -> %d MB",
					read, compressed, skipped, changedMeanwhile, bytesBefore / (1024 * 1024),
					bytesAfter / (1024 * 1024));
		}
	}
}
