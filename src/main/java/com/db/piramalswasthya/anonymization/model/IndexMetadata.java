package com.db.piramalswasthya.anonymization.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Metadata for a database index.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IndexMetadata {
    private String indexName;
    private Boolean unique;
    private Boolean primary;
    @Builder.Default
    private List<String> columns = new ArrayList<>();
    private String indexType;
}
