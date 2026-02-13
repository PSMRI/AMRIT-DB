USE dbiemr;

-- adolescent_health: visit_date DATE -> DATETIME (entity Timestamp)
ALTER TABLE dbiemr.adolescent_health
  MODIFY COLUMN visit_date DATETIME NULL DEFAULT NULL;
