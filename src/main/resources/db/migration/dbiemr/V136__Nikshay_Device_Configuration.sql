USE db_iemr;

CREATE TABLE IF NOT EXISTS m_nikshay_device_configuration (
  id INT AUTO_INCREMENT PRIMARY KEY,
  device_serial_number VARCHAR(50) NOT NULL COMMENT 'Serial number of the camp device',
  device_name VARCHAR(10) NOT NULL COMMENT 'NAAT or XRAY',
  phi_user_id VARCHAR(100) NOT NULL COMMENT 'Ni-kshay user ID of the device PHI',
  password VARCHAR(512) NOT NULL COMMENT 'AES-GCM encrypted, Base64',
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_by VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(50) NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  more_data JSON NULL COMMENT 'Extra details, e.g. vendor reference, remarks',
  UNIQUE KEY uk_nikshay_device_serial_number (device_serial_number)
);
