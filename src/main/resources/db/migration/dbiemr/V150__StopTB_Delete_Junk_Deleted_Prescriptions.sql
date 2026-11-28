SET @vans = (SELECT COUNT(DISTINCT VanID) FROM db_iemr.t_benvisitdetail WHERE VanID IS NOT NULL);
SET @ok = (@vans BETWEEN 1 AND 3);
SET @skip = 'Skipped: deleted on this laptop before upload (STOP-855)';
SET @has_scl = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sync_change_log');

CREATE TABLE IF NOT EXISTS db_iemr.v150_state (scl_start BIGINT);
SET @s = IF(@has_scl = 1,
  'INSERT INTO db_iemr.v150_state (scl_start) SELECT IFNULL(MAX(seq), 0) FROM db_iemr.t_sync_change_log WHERE NOT EXISTS (SELECT 1 FROM db_iemr.v150_state)',
  'DO 0');
PREPARE x FROM @s; EXECUTE x; DEALLOCATE PREPARE x;
SET @scl_start = (SELECT scl_start FROM db_iemr.v150_state LIMIT 1);

DROP TABLE IF EXISTS db_iemr.v150_rx_cand;
CREATE TABLE db_iemr.v150_rx_cand (PrescriptionID BIGINT PRIMARY KEY);
INSERT INTO db_iemr.v150_rx_cand
SELECT p.PrescriptionID FROM db_iemr.t_prescription p
WHERE @ok = 1 AND p.Deleted = 1
  AND p.SyncedDate IS NULL AND p.CentralID IS NULL AND p.DownSyncDate IS NULL
  AND (IFNULL(p.Processed, 'N') <> 'P' OR p.SyncFailureReason = @skip)
  AND EXISTS (SELECT 1 FROM db_iemr.t_benvisitdetail v WHERE v.BenVisitID = p.BenVisitID AND v.VisitCategory = 'Stop TB');

DROP TABLE IF EXISTS db_iemr.v150_drug;
CREATE TABLE db_iemr.v150_drug (n INT AUTO_INCREMENT PRIMARY KEY, PrescribedDrugID BIGINT NOT NULL, UNIQUE KEY (PrescribedDrugID));
INSERT INTO db_iemr.v150_drug (PrescribedDrugID)
SELECT d.PrescribedDrugID
FROM db_iemr.t_prescribeddrug d
JOIN db_iemr.v150_rx_cand c ON c.PrescriptionID = d.PrescriptionID
WHERE d.Deleted = 1
  AND d.SyncedDate IS NULL AND d.CentralID IS NULL AND d.DownSyncDate IS NULL
  AND (IFNULL(d.Processed, 'N') <> 'P' OR d.SyncFailureReason = @skip)
ORDER BY d.PrescribedDrugID;

DROP TABLE IF EXISTS db_iemr.v150_rx;
CREATE TABLE db_iemr.v150_rx (n INT AUTO_INCREMENT PRIMARY KEY, PrescriptionID BIGINT NOT NULL, UNIQUE KEY (PrescriptionID));
INSERT INTO db_iemr.v150_rx (PrescriptionID)
SELECT c.PrescriptionID
FROM db_iemr.v150_rx_cand c
WHERE NOT EXISTS (SELECT 1 FROM db_iemr.t_prescribeddrug d WHERE d.PrescriptionID = c.PrescriptionID
                  AND d.PrescribedDrugID NOT IN (SELECT PrescribedDrugID FROM db_iemr.v150_drug))
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_lab_testorder  x WHERE x.PrescriptionID = c.PrescriptionID)
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_lab_testresult x WHERE x.PrescriptionID = c.PrescriptionID)
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_ancdiagnosis   x WHERE x.PrescriptionID = c.PrescriptionID)
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_pncdiagnosis   x WHERE x.PrescriptionID = c.PrescriptionID)
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_ncddiagnosis   x WHERE x.PrescriptionID = c.PrescriptionID)
  AND NOT EXISTS (SELECT 1 FROM db_iemr.t_patientissue   x WHERE x.PrescriptionID = c.PrescriptionID)
ORDER BY c.PrescriptionID;

CREATE TABLE IF NOT EXISTS db_iemr.bak_v150_t_prescribeddrug LIKE db_iemr.t_prescribeddrug;
INSERT IGNORE INTO db_iemr.bak_v150_t_prescribeddrug
SELECT d.* FROM db_iemr.t_prescribeddrug d JOIN db_iemr.v150_drug j ON j.PrescribedDrugID = d.PrescribedDrugID;

CREATE TABLE IF NOT EXISTS db_iemr.bak_v150_t_prescription LIKE db_iemr.t_prescription;
INSERT IGNORE INTO db_iemr.bak_v150_t_prescription
SELECT p.* FROM db_iemr.t_prescription p JOIN db_iemr.v150_rx j ON j.PrescriptionID = p.PrescriptionID;

DROP PROCEDURE IF EXISTS db_iemr.v150_delete_junk_rx;

DELIMITER $$

CREATE PROCEDURE db_iemr.v150_delete_junk_rx()
BEGIN
  DECLARE a INT DEFAULT 0;
  DECLARE m INT;
  SELECT IFNULL(MAX(n), 0) INTO m FROM db_iemr.v150_drug;
  WHILE a < m DO
    DELETE d FROM db_iemr.t_prescribeddrug d
    JOIN db_iemr.v150_drug j ON j.PrescribedDrugID = d.PrescribedDrugID
    JOIN db_iemr.bak_v150_t_prescribeddrug b ON b.PrescribedDrugID = d.PrescribedDrugID
    WHERE j.n > a AND j.n <= a + 5000
      AND d.Deleted = 1 AND d.SyncedDate IS NULL AND d.CentralID IS NULL AND d.DownSyncDate IS NULL;
    COMMIT;
    SET a = a + 5000;
  END WHILE;
  SET a = 0;
  SELECT IFNULL(MAX(n), 0) INTO m FROM db_iemr.v150_rx;
  WHILE a < m DO
    DELETE p FROM db_iemr.t_prescription p
    JOIN db_iemr.v150_rx j ON j.PrescriptionID = p.PrescriptionID
    JOIN db_iemr.bak_v150_t_prescription b ON b.PrescriptionID = p.PrescriptionID
    WHERE j.n > a AND j.n <= a + 5000
      AND p.Deleted = 1 AND p.SyncedDate IS NULL AND p.CentralID IS NULL AND p.DownSyncDate IS NULL;
    COMMIT;
    SET a = a + 5000;
  END WHILE;
END$$

DELIMITER ;

CALL db_iemr.v150_delete_junk_rx();
DROP PROCEDURE IF EXISTS db_iemr.v150_delete_junk_rx;

DROP TABLE IF EXISTS db_iemr.v150_visit;
CREATE TABLE db_iemr.v150_visit (BenVisitID BIGINT PRIMARY KEY);
INSERT IGNORE INTO db_iemr.v150_visit
SELECT b.BenVisitID FROM db_iemr.bak_v150_t_prescription b JOIN db_iemr.v150_rx j ON j.PrescriptionID = b.PrescriptionID WHERE b.BenVisitID IS NOT NULL
UNION
SELECT b.BenVisitID FROM db_iemr.bak_v150_t_prescribeddrug b JOIN db_iemr.v150_drug j ON j.PrescribedDrugID = b.PrescribedDrugID WHERE b.BenVisitID IS NOT NULL;

SET @s = IF(@ok = 1 AND @has_scl = 1 AND @scl_start IS NOT NULL,
  'CREATE TABLE IF NOT EXISTS db_iemr.bak_v150_t_sync_change_log LIKE db_iemr.t_sync_change_log',
  'DO 0');
PREPARE x FROM @s; EXECUTE x; DEALLOCATE PREPARE x;

SET @s = IF(@ok = 1 AND @has_scl = 1 AND @scl_start IS NOT NULL,
  CONCAT('INSERT IGNORE INTO db_iemr.bak_v150_t_sync_change_log SELECT l.* FROM db_iemr.t_sync_change_log l JOIN db_iemr.v150_visit v ON v.BenVisitID = l.row_pk WHERE l.seq > ', @scl_start, ' AND l.entity = ''opd_visit'''),
  'DO 0');
PREPARE x FROM @s; EXECUTE x; DEALLOCATE PREPARE x;

SET @s = IF(@ok = 1 AND @has_scl = 1 AND @scl_start IS NOT NULL,
  CONCAT('DELETE l FROM db_iemr.t_sync_change_log l JOIN db_iemr.v150_visit v ON v.BenVisitID = l.row_pk WHERE l.seq > ', @scl_start, ' AND l.entity = ''opd_visit'''),
  'DO 0');
PREPARE x FROM @s; EXECUTE x; DEALLOCATE PREPARE x;

DROP TABLE IF EXISTS db_iemr.v150_visit;
DROP TABLE IF EXISTS db_iemr.v150_rx_cand;
DROP TABLE IF EXISTS db_iemr.v150_drug;
DROP TABLE IF EXISTS db_iemr.v150_rx;
DROP TABLE IF EXISTS db_iemr.v150_state;
