CREATE TABLE t_elasticsearch_sync_job (
    job_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    job_type VARCHAR(50) NOT NULL,        -- FULL_SYNC, INCREMENTAL
    status VARCHAR(50) NOT NULL,           -- RUNNING, COMPLETED, FAILED
    total_records BIGINT NOT NULL DEFAULT 0,
    processed_records BIGINT NOT NULL DEFAULT 0,
    success_count BIGINT NOT NULL DEFAULT 0,
    failure_count BIGINT NOT NULL DEFAULT 0,
    current_offset BIGINT NOT NULL DEFAULT 0,  -- Resume position (BIGINT to avoid overflow)
    started_at DATETIME NOT NULL,
    completed_at DATETIME NULL,
    error_message TEXT,
    processing_speed DOUBLE NULL,          -- Records per second
    estimated_time_remaining BIGINT NULL,  -- Seconds

    -- Indexes for query performance
    INDEX idx_job_status (status),
    INDEX idx_started_at (started_at),
    INDEX idx_status_started_at (status, started_at)
);
