package com.db.piramalswasthya.anonymization.model;

/**
 * Risk classification for PII fields.
 * Determines priority for anonymization enforcement.
 */
public enum RiskLevel {
    CRITICAL("Must anonymize - direct PII identifiers", 5),
    HIGH("Must anonymize - indirect identifiers", 4),
    MEDIUM("Should anonymize - health/sensitive data", 3),
    LOW("May retain for analytics", 2),
    LINKING_KEY("Special handling - must preserve relationships", 5),
    NONE("Non-sensitive", 0);

    private final String description;
    private final int priority;

    RiskLevel(String description, int priority) {
        this.description = description;
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public int getPriority() {
        return priority;
    }
}
