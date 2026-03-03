
CREATE TABLE IF NOT EXISTS db_iemr.campaign_ors (
    id BIGINT NOT NULL AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    user_id INT NOT NULL,
    number_of_families INT NOT NULL DEFAULT 0,
    campaign_photos JSON NULL,
    created_by VARCHAR(200) NULL,
    updated_by VARCHAR(200) NULL,
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_user_id (user_id),
    INDEX idx_start_date (start_date),
    INDEX idx_end_date (end_date),
    INDEX idx_created_date (created_date)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS db_iemr.campaign_pulse_polio (
    id BIGINT NOT NULL AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    user_id INT NOT NULL,
    number_of_children INT NOT NULL DEFAULT 0,
    campaign_photos JSON NULL,
    created_by VARCHAR(200) NULL,
    updated_by VARCHAR(200) NULL,
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_user_id (user_id),
    INDEX idx_start_date (start_date),
    INDEX idx_end_date (end_date),
    INDEX idx_created_date (created_date)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


  CREATE TABLE IF NOT EXISTS db_iemr.campaign_filariasis_mda (
      id BIGINT NOT NULL AUTO_INCREMENT,
      start_date DATE NOT NULL,
      end_date DATE NOT NULL,
      number_of_families INT NOT NULL DEFAULT 0,
      number_of_individuals INT NOT NULL DEFAULT 0,
      campaign_photos JSON NULL,
      user_id INT NOT NULL,
      created_by VARCHAR(200) NULL,
      updated_by VARCHAR(200) NULL,
      created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

      PRIMARY KEY (id),
      INDEX idx_user_id (user_id),
      INDEX idx_start_date (start_date),
      INDEX idx_end_date (end_date),
      INDEX idx_created_date (created_date)
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;
