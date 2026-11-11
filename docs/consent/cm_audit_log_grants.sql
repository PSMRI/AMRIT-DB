-- Consent Manager: make cm_audit_log append-only for the application user.
-- Applied by DevOps (not by Flyway) after V30__Consent_Manager_Capture.sql, per environment.
-- Replace <app_user> with the Consent-API database user. Constitution IX / proposal section 5:
-- "The application DB user cannot UPDATE or DELETE the audit log."
REVOKE UPDATE, DELETE ON db_identity.cm_audit_log FROM '<app_user>'@'%';
GRANT SELECT, INSERT ON db_identity.cm_audit_log TO '<app_user>'@'%';
