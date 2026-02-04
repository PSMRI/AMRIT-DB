package com.db.piramalswasthya.anonymization.exception;

/**
 * Custom exception for anonymization phase 1 operations.
 * Thrown when schema analysis, PII detection, registry generation, or artifact export fails.
 */
public class AnonymizationException extends RuntimeException {
    
    public AnonymizationException(String message) {
        super(message);
    }
    
    public AnonymizationException(String message, Throwable cause) {
        super(message, cause);
    }
    
    public AnonymizationException(Throwable cause) {
        super(cause);
    }
}
