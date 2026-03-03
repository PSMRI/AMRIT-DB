USE db_iemr;

-- adolescent_health: visit_date DATE -> DATETIME (entity Timestamp)
ALTER TABLE db_iemr.adolescent_health
  MODIFY COLUMN visit_date DATETIME NULL DEFAULT NULL;
