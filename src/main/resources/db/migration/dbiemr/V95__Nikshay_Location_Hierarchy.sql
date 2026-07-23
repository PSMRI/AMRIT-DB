USE db_iemr;

-- =====================================================================
-- CREATE — independent Nikshay hierarchy tables
-- =====================================================================
CREATE TABLE m_nikshay_state (
  NikshayStateID INT AUTO_INCREMENT PRIMARY KEY,
  NikshayCode VARCHAR(20),
  StateName VARCHAR(255),
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50) NULL,
  LastModDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE m_nikshay_district (
  NikshayDistrictID INT AUTO_INCREMENT PRIMARY KEY,
  NikshayCode VARCHAR(20),
  DistrictName VARCHAR(255),
  NikshayStateID INT,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50) NULL,
  LastModDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (NikshayStateID) REFERENCES m_nikshay_state(NikshayStateID)
);

CREATE TABLE m_nikshay_tu (
  NikshayTUID INT AUTO_INCREMENT PRIMARY KEY,
  NikshayCode VARCHAR(50),
  TUName VARCHAR(255),
  NikshayDistrictID INT,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50) NULL,
  LastModDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (NikshayDistrictID) REFERENCES m_nikshay_district(NikshayDistrictID)
);

CREATE TABLE m_nikshay_facility (
  NikshayFacilityID INT AUTO_INCREMENT PRIMARY KEY,
  NikshayCode VARCHAR(50),
  FacilityName VARCHAR(255),
  FacilityCode VARCHAR(50),
  NikshayTUID INT,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50) NULL,
  LastModDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (NikshayTUID) REFERENCES m_nikshay_tu(NikshayTUID)
);

CREATE TABLE m_nikshay_village (
  NikshayVillageID INT AUTO_INCREMENT PRIMARY KEY,
  VillageName VARCHAR(255),
  NikshayFacilityID INT,
  Deleted BOOLEAN DEFAULT FALSE,
  CreatedBy VARCHAR(50),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy VARCHAR(50) NULL,
  LastModDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (NikshayFacilityID) REFERENCES m_nikshay_facility(NikshayFacilityID)
);


-- =====================================================================
-- ALTER — linking columns the application code reads/writes
-- NOTE: TEXT, not INT — these hold comma-joined lists of IDs (multi-select)
-- =====================================================================
ALTER TABLE m_userservicerolemapping
  ADD COLUMN NikshayTUID TEXT NULL,
  ADD COLUMN NikshayFacilityID TEXT NULL,
  ADD COLUMN DistrictID INT NULL;
