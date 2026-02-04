package com.db.piramalswasthya.anonymization.executor.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AnonymizationJob {
    private Long id;
    private String jobId;
    private String sourceDatabaseName;
    private String targetDatabaseName;
    private String registryVersion;
    private String status;
    private Integer totalTables;
    private Integer processedTables;
    private Long totalRows;
    private Long processedRows;
    private Long errorRows;
    private Instant startedAt;
    private Instant completedAt;
    private String errorMessage;
    private String outputDirectory;
}
