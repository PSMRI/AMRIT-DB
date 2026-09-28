use db_iemr;
SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_screening';

-- 1. ben_reg_id
SET @col_name = 'ben_reg_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 2. visitCode
SET @col_name = 'visitCode';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 3. blood_check_id
SET @col_name = 'blood_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 4. cough_check_id
SET @col_name = 'cough_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 5. family_check_id
SET @col_name = 'family_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 6. fever_check_id
SET @col_name = 'fever_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 7. history_check_id
SET @col_name = 'history_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 8. weight_check_id
SET @col_name = 'weight_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 9. sweats_check_id
SET @col_name = 'sweats_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 10. drugs_check_id
SET @col_name = 'drugs_check_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 11. loss_of_appetite_id
SET @col_name = 'loss_of_appetite_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 12. rise_of_fever_id
SET @col_name = 'rise_of_fever_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 13. recommended_for_liquid_culture
SET @col_name = 'recommended_for_liquid_culture';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(250) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 14. recommended_for_liquid_culture_id
SET @col_name = 'recommended_for_liquid_culture_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 15. recommended_for_truenat
SET @col_name = 'recommended_for_truenat';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(250) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 16. recommended_for_truenat_id
SET @col_name = 'recommended_for_truenat_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 17. referred_for_digital_chest_xray
SET @col_name = 'referred_for_digital_chest_xray';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(250) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 18. referred_for_digital_chest_xray_id
SET @col_name = 'referred_for_digital_chest_xray_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 19. referred_for_sputum_collection
SET @col_name = 'referred_for_sputum_collection';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(250) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 20. referred_for_sputum_collection_id
SET @col_name = 'referred_for_sputum_collection_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 21. sputum_sample_submitted_at
SET @col_name = 'sputum_sample_submitted_at';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(250) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 22. test_denial_reasons
SET @col_name = 'test_denial_reasons';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TEXT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 23. created_by
SET @col_name = 'created_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(50) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 24. createdDate
SET @col_name = 'createdDate';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` DATETIME DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 25. deleted
SET @col_name = 'deleted';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIT(1) DEFAULT b''0'''),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 26. last_mod_date
SET @col_name = 'last_mod_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` DATETIME DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 27. modified_by
SET @col_name = 'modified_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(50) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 28. processed
SET @col_name = 'processed';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` CHAR(4) DEFAULT ''N'''),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 29. parkingPlaceID
SET @col_name = 'parkingPlaceID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 30. provider_service_map_id
SET @col_name = 'provider_service_map_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 31. vanID
SET @col_name = 'vanID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 32. vanSerialNo
SET @col_name = 'vanSerialNo';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 33. risk_factor
SET @col_name = 'risk_factor';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TEXT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 34. hiv_status
SET @col_name = 'hiv_status';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 35. fatigue
SET @col_name = 'fatigue';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 36. chest_pain
SET @col_name = 'chest_pain';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 37. short_breath
SET @col_name = 'short_breath';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
