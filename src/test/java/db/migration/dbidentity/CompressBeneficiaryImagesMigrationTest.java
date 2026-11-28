package db.migration.dbidentity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.flywaydb.core.api.migration.Context;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;

class CompressBeneficiaryImagesMigrationTest {

	private static final String TRIGGER_ACTION = "INSERT INTO db_iemr.t_sync_change_log (entity) SELECT 'beneficiary'";
	private static final Timestamp LAST_MOD = Timestamp.valueOf("2026-10-01 10:00:00");

	private Connection connection;
	private Statement statement;
	private PreparedStatement update;
	private PreparedStatement saveTrigger;
	private PreparedStatement triggers;
	private PreparedStatement savedTriggers;
	private final List<String> preparedSql = new ArrayList<>();
	private boolean autoCommit = true;

	private BeneficiaryImageCompressor compressor;
	private V39__Compress_Beneficiary_Images migration;
	private Context context;

	@BeforeEach
	void setUp() throws Exception {
		connection = mock(Connection.class);
		statement = mock(Statement.class);
		update = mock(PreparedStatement.class);
		saveTrigger = mock(PreparedStatement.class);
		when(connection.createStatement()).thenReturn(statement);
		when(connection.getAutoCommit()).thenAnswer(i -> autoCommit);
		org.mockito.Mockito.doAnswer(i -> {
			autoCommit = i.getArgument(0);
			return null;
		}).when(connection).setAutoCommit(org.mockito.ArgumentMatchers.anyBoolean());

		PreparedStatement tableExists = statementReturning(rows(new Object[] { 1 }));
		triggers = statementReturning(rows(new Object[] { "trg_scl_ben_image_au", "AFTER", TRIGGER_ACTION }));
		savedTriggers = statementReturning(rows()); // no interrupted earlier run
		PreparedStatement select = mock(PreparedStatement.class);
		ResultSet firstBatch = rows(new Object[] { 1L, "BIG-IMAGE", LAST_MOD });
		ResultSet noMore = rows();
		when(select.executeQuery()).thenReturn(firstBatch, noMore);
		when(update.executeUpdate()).thenReturn(1);

		when(connection.prepareStatement(anyString())).thenAnswer(i -> {
			String sql = i.getArgument(0);
			preparedSql.add(sql);
			if (sql.contains("information_schema.TABLES"))
				return tableExists;
			if (sql.contains("information_schema.TRIGGERS"))
				return triggers;
			if (sql.startsWith("SELECT TRIGGER_NAME") && sql.contains("tmp_v39_suspended_triggers"))
				return savedTriggers;
			if (sql.startsWith("INSERT INTO tmp_v39_suspended_triggers"))
				return saveTrigger;
			if (sql.startsWith("SELECT BenImageId"))
				return select;
			return update;
		});

		compressor = mock(BeneficiaryImageCompressor.class);
		when(compressor.compress("BIG-IMAGE")).thenReturn("SMALL");
		migration = new V39__Compress_Beneficiary_Images(compressor);
		context = mock(Context.class);
		when(context.getConnection()).thenReturn(connection);
	}

	private static PreparedStatement statementReturning(ResultSet rs) throws SQLException {
		PreparedStatement ps = mock(PreparedStatement.class);
		when(ps.executeQuery()).thenReturn(rs);
		return ps;
	}

	/** A ResultSet over the given rows; columns are read by 1-based index. */
	private static ResultSet rows(Object[]... data) throws SQLException {
		ResultSet rs = mock(ResultSet.class);
		int[] cursor = { -1 };
		when(rs.next()).thenAnswer(i -> ++cursor[0] < data.length);
		when(rs.getInt(anyInt())).thenAnswer(i -> ((Number) data[cursor[0]][(int) i.getArgument(0) - 1]).intValue());
		when(rs.getLong(anyInt())).thenAnswer(i -> ((Number) data[cursor[0]][(int) i.getArgument(0) - 1]).longValue());
		when(rs.getString(anyInt())).thenAnswer(i -> (String) data[cursor[0]][(int) i.getArgument(0) - 1]);
		when(rs.getTimestamp(anyInt())).thenAnswer(i -> (Timestamp) data[cursor[0]][(int) i.getArgument(0) - 1]);
		return rs;
	}

	@Test
	void compressesPhotosWithTheChangeLogTriggerOffAndRestoresIt() throws Exception {
		migration.migrate(context);

		InOrder order = inOrder(statement, saveTrigger, update, connection);
		order.verify(saveTrigger).setString(4, TRIGGER_ACTION); // definition saved before the drop
		order.verify(saveTrigger).executeUpdate();
		order.verify(statement).execute("DROP TRIGGER IF EXISTS `trg_scl_ben_image_au`");
		order.verify(update).setString(1, "SMALL");
		order.verify(update).executeUpdate();
		order.verify(connection).commit();
		order.verify(statement).execute("CREATE TRIGGER `trg_scl_ben_image_au` AFTER UPDATE ON `i_beneficiaryimage`"
				+ " FOR EACH ROW " + TRIGGER_ACTION);
		order.verify(statement).execute("DROP TABLE IF EXISTS tmp_v39_suspended_triggers");
		assertTrue(autoCommit, "auto-commit restored");
	}

	@Test
	void updateKeepsLastModDateSoDownSyncDoesNotResendEveryPhoto() throws Exception {
		migration.migrate(context);

		String updateSql = preparedSql.stream().filter(s -> s.startsWith("UPDATE")).findFirst().orElseThrow();
		assertTrue(updateSql.contains("LastModDate = LastModDate"), updateSql);
		assertFalse(updateSql.contains("Processed"), "upload flag untouched");
		assertFalse(updateSql.contains("DownSynced"), "down-sync flag untouched");
		verify(update).setTimestamp(3, LAST_MOD); // row changed by the app meanwhile is not overwritten
	}

	@Test
	void triggerIsRecreatedEvenWhenTheRunFails() throws Exception {
		when(update.executeUpdate()).thenThrow(new SQLException("disk full"));

		assertThrows(SQLException.class, () -> migration.migrate(context));

		verify(connection).rollback();
		verify(statement).execute("CREATE TRIGGER `trg_scl_ben_image_au` AFTER UPDATE ON `i_beneficiaryimage`"
				+ " FOR EACH ROW " + TRIGGER_ACTION);
	}

	@Test
	void runKilledAfterDroppingTheTriggerRestoresItFromTheSavedDefinition() throws Exception {
		// the earlier run dropped the trigger and was killed: information_schema no longer has it
		ResultSet saved = rows(new Object[] { "trg_scl_ben_image_au", "AFTER", TRIGGER_ACTION });
		ResultSet none = rows();
		when(savedTriggers.executeQuery()).thenReturn(saved);
		when(triggers.executeQuery()).thenReturn(none);

		migration.migrate(context);

		verify(saveTrigger, never()).executeUpdate();
		verify(statement).execute("CREATE TRIGGER `trg_scl_ben_image_au` AFTER UPDATE ON `i_beneficiaryimage`"
				+ " FOR EACH ROW " + TRIGGER_ACTION);
		verify(statement).execute("DROP TABLE IF EXISTS tmp_v39_suspended_triggers");
	}

	@Test
	void savedDefinitionIsKeptWhenTheTriggerCannotBeRecreated() throws Exception {
		when(statement.execute(org.mockito.ArgumentMatchers.startsWith("CREATE TRIGGER")))
				.thenThrow(new SQLException("no privilege"));

		assertThrows(SQLException.class, () -> migration.migrate(context));

		verify(statement, never()).execute("DROP TABLE IF EXISTS tmp_v39_suspended_triggers");
	}

	@Test
	void photoThatCannotBeShrunkIsNotWritten() throws Exception {
		when(compressor.compress("BIG-IMAGE")).thenReturn(null);

		migration.migrate(context);

		verify(update, never()).executeUpdate();
	}

	@Test
	void databaseWithoutTheTableIsSkipped() throws Exception {
		PreparedStatement noTable = statementReturning(rows(new Object[] { 0 }));
		when(connection.prepareStatement(anyString())).thenReturn(noTable);

		migration.migrate(context);

		verify(statement, never()).execute(anyString());
	}

	@Test
	void runsOutsideOneBigTransaction() {
		assertFalse(migration.canExecuteInTransaction());
		assertEquals("39", migration.getVersion().getVersion());
	}
}
