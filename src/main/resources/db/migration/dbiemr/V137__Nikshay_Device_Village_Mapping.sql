USE db_iemr;

CREATE TABLE IF NOT EXISTS m_nikshay_device_village_mapping (
  id INT AUTO_INCREMENT PRIMARY KEY,
  device_detail_id INT NOT NULL COMMENT 'm_nikshay_device_configuration.id',
  state_id INT COMMENT 'm_nikshay_state.NikshayStateID',
  district_id INT COMMENT 'm_nikshay_district.NikshayDistrictID',
  tbu_id INT COMMENT 'm_nikshay_tu.NikshayTUID',
  facility_id INT COMMENT 'm_nikshay_facility.NikshayFacilityID',
  village_id INT NOT NULL COMMENT 'm_nikshay_village.NikshayVillageID',
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_by VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(50) NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  more_data JSON NULL,
  KEY idx_nikshay_dvm_village_active (village_id, is_active),
  KEY idx_nikshay_dvm_device (device_detail_id),
  CONSTRAINT fk_nikshay_dvm_device FOREIGN KEY (device_detail_id) REFERENCES m_nikshay_device_configuration(id)
);
