USE db_iemr;

-- adolescent_health: created_date DATE -> DATETIME (entity Timestamp)
ALTER TABLE db_iemr.adolescent_health
  MODIFY COLUMN created_date DATETIME NULL DEFAULT NULL;
