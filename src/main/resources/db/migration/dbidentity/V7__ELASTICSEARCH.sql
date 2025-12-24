CREATE TABLE t_elasticsearch_sync_job (
    job_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    job_type VARCHAR(50),           -- FULL_SYNC, INCREMENTAL
    status VARCHAR(50),              -- RUNNING, COMPLETED, FAILED
    total_records BIGINT,
    processed_records BIGINT,
    success_count BIGINT,
    failure_count BIGINT,
    current_offset INT,              -- Resume from here if failed
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    error_message TEXT,
    processing_speed DOUBLE,         -- Records/second
    estimated_time_remaining BIGINT  -- Seconds
);