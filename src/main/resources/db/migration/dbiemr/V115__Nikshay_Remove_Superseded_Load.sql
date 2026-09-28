USE db_iemr;

-- Removes rows left by an earlier, superseded Nikshay load (CreatedBy='nikshay_remap')
-- for Andhra Pradesh, Telangana, Odisha and Karnataka only, so the fixed-ID sync
-- that follows starts from the original data. On a DB that never had that load
-- (central, laptops) this finds nothing and changes nothing.
-- Rows that any user mapping or beneficiary flow row points to are kept.

DROP TABLE IF EXISTS tmp_nikshay_keep_ids;
CREATE TABLE tmp_nikshay_keep_ids (
    lvl CHAR(1) NOT NULL,
    id  INT     NOT NULL,
    PRIMARY KEY (lvl, id)
);

-- IDs referenced by any user mapping (comma lists; deleted mappings included, to be safe).
-- Each list is turned into a JSON array of strings and split with JSON_TABLE.
INSERT IGNORE INTO tmp_nikshay_keep_ids (lvl, id)
SELECT x.lvl, CAST(j.tok AS UNSIGNED)
FROM (
    SELECT 'V' AS lvl, Villageid AS ids FROM m_userservicerolemapping WHERE Villageid IS NOT NULL AND Villageid <> ''
    UNION ALL
    SELECT 'F', NikshayFacilityID FROM m_userservicerolemapping WHERE NikshayFacilityID IS NOT NULL AND NikshayFacilityID <> ''
    UNION ALL
    SELECT 'T', NikshayTUID FROM m_userservicerolemapping WHERE NikshayTUID IS NOT NULL AND NikshayTUID <> ''
) x
JOIN JSON_TABLE(
    CONCAT('["', REPLACE(REPLACE(REPLACE(REPLACE(x.ids, '\\', ''), '"', ''), ' ', ''), ',', '","'), '"]'),
    '$[*]' COLUMNS (tok VARCHAR(64) PATH '$')
) j
WHERE j.tok REGEXP '^[0-9]{1,10}$' AND CAST(j.tok AS UNSIGNED) <= 2147483647;

-- village IDs used by beneficiary flow rows (only if that table/column exists here)
SET @has_flow := (SELECT COUNT(*) FROM information_schema.columns
                  WHERE table_schema = DATABASE() AND table_name = 'i_ben_flow_outreach' AND column_name = 'villageID');
SET @sql := IF(@has_flow > 0,
    'INSERT IGNORE INTO tmp_nikshay_keep_ids (lvl, id) SELECT DISTINCT ''V'', villageID FROM i_ben_flow_outreach WHERE villageID IS NOT NULL',
    'DO 0');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- superseded rows of the four states that nobody points to
DROP TABLE IF EXISTS tmp_nikshay_del_village;
CREATE TABLE tmp_nikshay_del_village (id INT NOT NULL PRIMARY KEY)
SELECT v.NikshayVillageID AS id
FROM m_nikshay_village v
JOIN m_nikshay_facility f ON f.NikshayFacilityID = v.NikshayFacilityID
JOIN m_nikshay_tu t       ON t.NikshayTUID = f.NikshayTUID
JOIN m_nikshay_district d ON d.NikshayDistrictID = t.NikshayDistrictID
JOIN m_nikshay_state s    ON s.NikshayStateID = d.NikshayStateID
WHERE s.StateName IN ('Andhra Pradesh', 'Telangana', 'Odisha', 'Karnataka')
  AND v.CreatedBy = 'nikshay_remap'
  AND NOT EXISTS (SELECT 1 FROM tmp_nikshay_keep_ids k WHERE k.lvl = 'V' AND k.id = v.NikshayVillageID);

DROP PROCEDURE IF EXISTS pr_nikshay_remove_superseded_villages;

DELIMITER $$
CREATE PROCEDURE pr_nikshay_remove_superseded_villages()
BEGIN
    DECLARE v_from INT;
    DECLARE v_max  INT;
    SELECT MIN(id), MAX(id) INTO v_from, v_max FROM tmp_nikshay_del_village;
    WHILE v_from IS NOT NULL AND v_from <= v_max DO
        DELETE m FROM m_nikshay_village m
        JOIN tmp_nikshay_del_village x ON x.id = m.NikshayVillageID
        WHERE x.id BETWEEN v_from AND v_from + 49999;
        COMMIT;
        SET v_from = v_from + 50000;
    END WHILE;
END$$
DELIMITER ;

CALL pr_nikshay_remove_superseded_villages();
DROP PROCEDURE IF EXISTS pr_nikshay_remove_superseded_villages;

-- superseded facilities / TUs of the four states left with nothing under them and nobody pointing to them
DELETE f FROM m_nikshay_facility f
JOIN m_nikshay_tu t       ON t.NikshayTUID = f.NikshayTUID
JOIN m_nikshay_district d ON d.NikshayDistrictID = t.NikshayDistrictID
JOIN m_nikshay_state s    ON s.NikshayStateID = d.NikshayStateID
WHERE s.StateName IN ('Andhra Pradesh', 'Telangana', 'Odisha', 'Karnataka')
  AND f.CreatedBy = 'nikshay_remap'
  AND NOT EXISTS (SELECT 1 FROM tmp_nikshay_keep_ids k WHERE k.lvl = 'F' AND k.id = f.NikshayFacilityID)
  AND NOT EXISTS (SELECT 1 FROM m_nikshay_village v WHERE v.NikshayFacilityID = f.NikshayFacilityID);

DELETE t FROM m_nikshay_tu t
JOIN m_nikshay_district d ON d.NikshayDistrictID = t.NikshayDistrictID
JOIN m_nikshay_state s    ON s.NikshayStateID = d.NikshayStateID
WHERE s.StateName IN ('Andhra Pradesh', 'Telangana', 'Odisha', 'Karnataka')
  AND t.CreatedBy = 'nikshay_remap'
  AND NOT EXISTS (SELECT 1 FROM tmp_nikshay_keep_ids k WHERE k.lvl = 'T' AND k.id = t.NikshayTUID)
  AND NOT EXISTS (SELECT 1 FROM m_nikshay_facility f WHERE f.NikshayTUID = t.NikshayTUID);

DROP TABLE IF EXISTS tmp_nikshay_del_village;
DROP TABLE IF EXISTS tmp_nikshay_keep_ids;
