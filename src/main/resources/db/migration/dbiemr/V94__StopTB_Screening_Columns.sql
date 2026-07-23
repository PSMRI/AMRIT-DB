USE db_iemr;

ALTER TABLE tb_screening
  ADD COLUMN key_population_risk_factor_ids TEXT DEFAULT NULL,
  ADD COLUMN key_population_risk_factors TEXT DEFAULT NULL,
  ADD COLUMN hiv_status_id INT DEFAULT NULL,
  ADD COLUMN hiv_status VARCHAR(50) DEFAULT NULL;

ALTER TABLE t_form_section
  ADD COLUMN isEditable BIT NOT NULL DEFAULT 0;
