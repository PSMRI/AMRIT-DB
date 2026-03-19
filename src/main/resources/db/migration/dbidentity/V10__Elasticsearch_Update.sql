
ALTER TABLE t_elasticsearch_sync_job
ADD COLUMN triggered_by VARCHAR(100) NULL,                 
ADD COLUMN created_date TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP,                             
ADD COLUMN last_updated TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP;                           