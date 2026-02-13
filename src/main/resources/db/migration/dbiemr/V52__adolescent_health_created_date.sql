USE dbiemr;

-- adolescent_health: created_date DATE -> DATETIME (entity Timestamp)
ALTER TABLE dbiemr.adolescent_health
  MODIFY COLUMN created_date DATETIME NULL DEFAULT NULL;
