USE db_iemr;

-- idx_itemstockentry_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockentry'
              AND index_name = 'idx_itemstockentry_created'
        ),
        'SELECT ''idx_itemstockentry_created already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD INDEX idx_itemstockentry_created (CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_itemstockentry_item
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockentry'
              AND index_name = 'idx_itemstockentry_item'
        ),
        'SELECT ''idx_itemstockentry_item already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD INDEX idx_itemstockentry_item (ItemID, FacilityID)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_itemstockexit_entry_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockexit'
              AND index_name = 'idx_itemstockexit_entry_created'
        ),
        'SELECT ''idx_itemstockexit_entry_created already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD INDEX idx_itemstockexit_entry_created (ItemStockEntryID, CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_saitemmapping_entry_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_saitemmapping'
              AND index_name = 'idx_saitemmapping_entry_created'
        ),
        'SELECT ''idx_saitemmapping_entry_created already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD INDEX idx_saitemmapping_entry_created (ItemStockEntryID, CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_itemstockentry_vanserial_vanid
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockentry'
              AND index_name = 'idx_itemstockentry_vanserial_vanid'
        ),
        'SELECT ''idx_itemstockentry_vanserial_vanid already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD INDEX idx_itemstockentry_vanserial_vanid (VanSerialNo, VanID)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_itemstockexit_entry_vanid_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockexit'
              AND index_name = 'idx_itemstockexit_entry_vanid_created'
        ),
        'SELECT ''idx_itemstockexit_entry_vanid_created already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD INDEX idx_itemstockexit_entry_vanid_created (ItemStockEntryID, VanID, CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_saitemmapping_entry_vanid_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_saitemmapping'
              AND index_name = 'idx_saitemmapping_entry_vanid_created'
        ),
        'SELECT ''idx_saitemmapping_entry_vanid_created already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD INDEX idx_saitemmapping_entry_vanid_created (ItemStockEntryID, VanID, CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_itemstockentry_fac_created
SET @sql = (
    SELECT IF (
        EXISTS (
            SELECT 1
            FROM information_schema.statistics
            WHERE table_schema = 'db_iemr'
              AND table_name = 't_itemstockentry'
              AND index_name = 'idx_itemstockentry_fac_created'
        ),
        'SELECT ''idx_itemstockentry_fac_created already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD INDEX idx_itemstockentry_fac_created (FacilityID, CreatedDate)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;