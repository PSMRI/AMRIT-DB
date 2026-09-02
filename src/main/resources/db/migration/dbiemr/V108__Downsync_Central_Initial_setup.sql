
-- -----------------------------------------------------------------------------
-- Records already up-synced from a van have been delivered by definition -
--    mark them so, or the first down-sync sends every one of them back down.
--    VanSerialNo is only set on a row that arrived from a van.
--    LastModDate = LastModDate suppresses ON UPDATE CURRENT_TIMESTAMP.
-- -----------------------------------------------------------------------------

UPDATE db_identity.i_beneficiarydetails      SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
UPDATE db_identity.i_beneficiaryaddress      SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
UPDATE db_identity.i_beneficiarycontacts     SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
UPDATE db_identity.i_beneficiaryaccount      SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
UPDATE db_identity.i_beneficiarymapping      SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
UPDATE db_identity.m_beneficiaryregidmapping SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;

-- Same treatment for the rest, generated rather than typed out. Run the SELECT,
-- then run the statements it prints.
SELECT CONCAT('UPDATE ', t.SchemaName, '.', t.TableName,
              ' SET DownSynced=''P'', DownSyncDate=NOW()',
              IF(c.COLUMN_NAME IS NULL, '', CONCAT(', ', c.COLUMN_NAME, '=', c.COLUMN_NAME)),
              ' WHERE DownSynced=''N'' AND VanSerialNo IS NOT NULL;') AS run_these
FROM db_iemr.m_downsynctabledetail t
LEFT JOIN information_schema.COLUMNS c
       ON c.TABLE_SCHEMA = t.SchemaName AND c.TABLE_NAME = t.TableName
      AND c.COLUMN_NAME IN ('LastModDate', 'last_mod_date')
WHERE t.TableType = 'TRANSACTIONAL'
  AND t.TableName NOT IN ('i_beneficiarydetails','i_beneficiaryaddress','i_beneficiarycontacts',
                          'i_beneficiaryaccount','i_beneficiarymapping','m_beneficiaryregidmapping')
ORDER BY t.SyncOrder;