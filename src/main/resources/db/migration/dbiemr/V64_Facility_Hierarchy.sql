-- ============================================================
-- AMRIT Facility Hierarchy - Migration Script (idempotent)
-- ============================================================

-- 1. m_facility_level (new table)
CREATE TABLE IF NOT EXISTS m_facility_level (
  FacilityLevelID INT AUTO_INCREMENT PRIMARY KEY,
  LevelName VARCHAR(100),
  LevelDescription VARCHAR(255),
  LevelValue INT,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50),
  LastModDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_level_value (LevelValue)
);

-- 2. m_facilitytype (add columns)
SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND COLUMN_NAME = 'RuralUrban');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD COLUMN RuralUrban VARCHAR(10) DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND COLUMN_NAME = 'FacilityLevelID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD COLUMN FacilityLevelID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND COLUMN_NAME = 'LevelValue');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD COLUMN LevelValue INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND COLUMN_NAME = 'StateID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD COLUMN StateID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

UPDATE m_facilitytype ft JOIN m_facility_level fl ON ft.FacilityLevelID = fl.FacilityLevelID SET ft.LevelValue = fl.LevelValue WHERE ft.LevelValue IS NULL AND ft.FacilityLevelID IS NOT NULL;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND CONSTRAINT_NAME = 'fk_facilitytype_levelvalue');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD CONSTRAINT fk_facilitytype_levelvalue FOREIGN KEY (LevelValue) REFERENCES m_facility_level(LevelValue)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facilitytype' AND CONSTRAINT_NAME = 'fk_facilitytype_state');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facilitytype ADD CONSTRAINT fk_facilitytype_state FOREIGN KEY (StateID) REFERENCES m_state(StateID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- 3. m_facility (add columns)
SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'StateID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN StateID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'DistrictID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN DistrictID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'BlockID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN BlockID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'MainVillageID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN MainVillageID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'RuralUrban');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN RuralUrban VARCHAR(10) DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND COLUMN_NAME = 'ParentFacilityID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD COLUMN ParentFacilityID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- FKs
SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND CONSTRAINT_NAME = 'fk_facility_state');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD CONSTRAINT fk_facility_state FOREIGN KEY (StateID) REFERENCES m_state(StateID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND CONSTRAINT_NAME = 'fk_facility_district');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD CONSTRAINT fk_facility_district FOREIGN KEY (DistrictID) REFERENCES m_district(DistrictID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND CONSTRAINT_NAME = 'fk_facility_block');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD CONSTRAINT fk_facility_block FOREIGN KEY (BlockID) REFERENCES m_districtblock(BlockID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND CONSTRAINT_NAME = 'fk_facility_type');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD CONSTRAINT fk_facility_type FOREIGN KEY (FacilityTypeID) REFERENCES m_facilitytype(FacilityTypeID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_facility' AND CONSTRAINT_NAME = 'fk_facility_mainvillage');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_facility ADD CONSTRAINT fk_facility_mainvillage FOREIGN KEY (MainVillageID) REFERENCES m_districtbranchmapping(DistrictBranchID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 4. facility_village_mapping (new table)
CREATE TABLE IF NOT EXISTS facility_village_mapping (
  FacilityVillageMappingID BIGINT AUTO_INCREMENT PRIMARY KEY,
  FacilityID INT NOT NULL,
  DistrictBranchID INT NOT NULL,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50),
  LastModDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_villagemap_facility FOREIGN KEY (FacilityID) REFERENCES m_facility(FacilityID)
);

-- 5. m_UserServiceRoleMapping (add FacilityID, StateID, DistrictID)
SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND COLUMN_NAME = 'FacilityID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD COLUMN FacilityID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND COLUMN_NAME = 'StateID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD COLUMN StateID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND COLUMN_NAME = 'DistrictID');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD COLUMN DistrictID INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- FKs
SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND CONSTRAINT_NAME = 'fk_usrm_facility');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD CONSTRAINT fk_usrm_facility FOREIGN KEY (FacilityID) REFERENCES m_facility(FacilityID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND CONSTRAINT_NAME = 'fk_usrm_state');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD CONSTRAINT fk_usrm_state FOREIGN KEY (StateID) REFERENCES m_state(StateID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists = (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_UserServiceRoleMapping' AND CONSTRAINT_NAME = 'fk_usrm_district');
SET @sql = IF(@exists = 0, 'ALTER TABLE m_UserServiceRoleMapping ADD CONSTRAINT fk_usrm_district FOREIGN KEY (DistrictID) REFERENCES m_district(DistrictID)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- 6. asha_supervisor_mapping (new table)
CREATE TABLE IF NOT EXISTS asha_supervisor_mapping (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  supervisorUserID INT,
  ashaUserID INT,
  facilityID INT,
  deleted BOOLEAN DEFAULT FALSE,
  createdBy VARCHAR(50),
  createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  modifiedBy VARCHAR(50),
  lastModDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_asm_asha FOREIGN KEY (ashaUserID) REFERENCES m_User(UserID),
  CONSTRAINT fk_asm_supervisor FOREIGN KEY (supervisorUserID) REFERENCES m_User(UserID),
  CONSTRAINT fk_asm_facility FOREIGN KEY (facilityID) REFERENCES m_facility(FacilityID)
);

