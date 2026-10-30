USE db_iemr;

CREATE TABLE IF NOT EXISTS m_nikshay_transfer_out_phi_village_mapping (
  id INT AUTO_INCREMENT PRIMARY KEY,
  village_id INT NOT NULL COMMENT 'm_nikshay_village.NikshayVillageID',
  tbu_id INT NOT NULL COMMENT 'm_nikshay_tu.NikshayTUID',
  designated_phi_id VARCHAR(50) NOT NULL COMMENT 'Designated PHI ID',
  designation_hierarchy_id VARCHAR(50) NULL COMMENT 'Ni-kshay hierarchy ID of the designated PHI (optional)',
  status VARCHAR(10) NOT NULL DEFAULT 'active' COMMENT 'active / inactive',
  created_by VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(50) NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_nikshay_tophi_village_phi (village_id, designated_phi_id, status),
  KEY idx_nikshay_tophi_tbu (tbu_id)
);
