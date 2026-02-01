package com.db.piramalswasthya.anonymization.phase1.model;

/**
 * Classification categories for PII and sensitive data fields.
 * Used to determine anonymization strategies and risk levels.
 */
public enum PIICategory {
    PERSONAL_IDENTIFIER("Personal identifiers like names, guardian names"),
    CONTACT("Contact information: phone, email, address, PIN"),
    GOVERNMENT_ID("Government IDs: Aadhaar, PAN, Voter ID, ABHA"),
    BIOMETRIC("Biometric data: fingerprints, face embeddings, iris data"),
    HEALTH_IDENTIFIER("Health identifiers: HealthID, MRN, BeneficiaryID"),
    MEDICAL_CONDITION("Medical data: diagnosis, symptoms, prescriptions"),
    GEOLOCATION("GPS coordinates, detailed location data"),
    DEMOGRAPHIC("Demographic data: age, gender, marital status"),
    LINKING_KEY("Cross-database linking keys like BenRegID"),
    FREE_TEXT_PII_RISK("Free-text fields that may contain PII (notes, complaints)"),
    METADATA("System metadata: timestamps, IP addresses, user IDs"),
    UNKNOWN("Unknown/unclassified - requires manual review"),
    NON_PII("Non-sensitive data");

    private final String description;

    PIICategory(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
