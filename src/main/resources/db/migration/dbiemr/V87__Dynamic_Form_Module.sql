-- ============================================================
-- Dynamic Form Module - Migration Script (idempotent)
-- ============================================================

USE db_iemr;

-- 1. Root form definition
CREATE TABLE IF NOT EXISTS t_dynamic_form (
    formId               BIGINT       NOT NULL AUTO_INCREMENT,
    formUuid             VARCHAR(100) NOT NULL,
    formName             VARCHAR(255) NOT NULL,
    formType             VARCHAR(50)  NOT NULL,  -- enum: FormType
    isActive             BIT(1)       NOT NULL DEFAULT 1,
    follow_up_delay_days INT          NULL,
    created_by           VARCHAR(100) NULL,
    updated_by           VARCHAR(100) NULL,
    createdAt             DATETIME(6)  NOT NULL,
    updatedAt             DATETIME(6)  NOT NULL,
    vanID                 INT          NULL,
    parkingPlaceID        INT          NULL,
    processed             VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo           BIGINT       NULL,
    SyncedDate            DATETIME(6)  NULL,
    Syncedby              VARCHAR(50)  NULL,
    SyncFailureReason     VARCHAR(255) NULL,
    PRIMARY KEY (formId),
    UNIQUE KEY UK_formUuid (formUuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Versioned snapshot of a form's structure
CREATE TABLE IF NOT EXISTS t_form_version (
    versionId         BIGINT       NOT NULL AUTO_INCREMENT,
    formId            BIGINT       NOT NULL,
    versionNumber     INT          NOT NULL,
    isLatest          BIT(1)       NOT NULL DEFAULT 1,
    createdAt         DATETIME(6)  NOT NULL,
    createdBy         VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    notes             TEXT         NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (versionId),
    CONSTRAINT FK_form_version_form
        FOREIGN KEY (formId) REFERENCES t_dynamic_form (formId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Section within a form version
CREATE TABLE IF NOT EXISTS t_form_section (
    sectionId         BIGINT       NOT NULL AUTO_INCREMENT,
    version_id        BIGINT       NOT NULL,
    sectionUuid       VARCHAR(100) NOT NULL,
    sectionName       VARCHAR(255) NOT NULL,
    sectionName_hindi VARCHAR(255) NULL,
    sectionPhase      VARCHAR(20)  NOT NULL,  -- PRE_SUBMIT | POST_SUBMIT
    isRequired        BIT(1)       NOT NULL DEFAULT 1,
    displayOrder      INT          NOT NULL,
    hasSubmitButton   BIT(1)       NOT NULL DEFAULT 0,
    created_by        VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (sectionId),
    CONSTRAINT FK_form_section_version
        FOREIGN KEY (version_id) REFERENCES t_form_version (versionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Question within a section
CREATE TABLE IF NOT EXISTS t_section_question (
    questionId         BIGINT       NOT NULL AUTO_INCREMENT,
    sectionId          BIGINT       NOT NULL,
    questionUuid       VARCHAR(100) NOT NULL,
    questionText       LONGTEXT     NOT NULL,   -- @Lob
    questionText_hindi TEXT         NULL,
    questionType       VARCHAR(20)  NOT NULL,   -- enum: RADIO|MCQ|TEXT|DATE|DISPLAY|AUTO_FILL
    isMandatory        BIT(1)       NOT NULL DEFAULT 1,
    displayOrder       INT          NOT NULL,
    maxLength          INT          NULL,
    defaultValue       VARCHAR(500) NULL,
    containsPii        BIT(1)       NOT NULL DEFAULT 0,
    created_by         VARCHAR(100) NULL,
    updated_by         VARCHAR(100) NULL,
    vanID              INT          NULL,
    parkingPlaceID     INT          NULL,
    processed          VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo        BIGINT       NULL,
    SyncedDate         DATETIME(6)  NULL,
    Syncedby           VARCHAR(50)  NULL,
    SyncFailureReason  VARCHAR(255) NULL,
    PRIMARY KEY (questionId),
    CONSTRAINT FK_section_question_section
        FOREIGN KEY (sectionId) REFERENCES t_form_section (sectionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Selectable option for RADIO/MCQ questions
CREATE TABLE IF NOT EXISTS t_question_option (
    optionId          BIGINT       NOT NULL AUTO_INCREMENT,
    questionId        BIGINT       NOT NULL,
    optionLabel       VARCHAR(255) NOT NULL,
    optionLabel_hindi VARCHAR(100) NULL,
    optionValue       VARCHAR(100) NOT NULL,
    optionValue_hindi VARCHAR(100) NULL,
    displayOrder      INT          NOT NULL,
    created_by        VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (optionId),
    CONSTRAINT FK_question_option_question
        FOREIGN KEY (questionId) REFERENCES t_section_question (questionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. Server-side validation rule per question
CREATE TABLE IF NOT EXISTS t_question_validation (
    validationId      BIGINT       NOT NULL AUTO_INCREMENT,
    questionId        BIGINT       NOT NULL,
    validationType     VARCHAR(30)  NOT NULL,  -- enum: MAX_LENGTH|MIN_DATE|MAX_DATE|REGEX|MANDATORY_IF
    validationParam    VARCHAR(255) NULL,
    errorMessage       VARCHAR(500) NOT NULL,
    created_by         VARCHAR(100) NULL,
    updated_by         VARCHAR(100) NULL,
    vanID              INT          NULL,
    parkingPlaceID     INT          NULL,
    processed          VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo        BIGINT       NULL,
    SyncedDate         DATETIME(6)  NULL,
    Syncedby           VARCHAR(50)  NULL,
    SyncFailureReason  VARCHAR(255) NULL,
    PRIMARY KEY (validationId),
    CONSTRAINT FK_question_validation_question
        FOREIGN KEY (questionId) REFERENCES t_section_question (questionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7. Conditional action triggered on option selection
CREATE TABLE IF NOT EXISTS t_option_condition (
    conditionId       BIGINT       NOT NULL AUTO_INCREMENT,
    optionId          BIGINT       NOT NULL,
    actionType        VARCHAR(40)  NOT NULL,  -- SHOW_QUESTION|DISABLE_SECTION_VALIDATION|LOCK_FORM
    targetQuestionId  BIGINT       NULL,      -- set when actionType = SHOW_QUESTION
    targetSectionId   BIGINT       NULL,      -- set when actionType = DISABLE_SECTION_VALIDATION
    created_by        VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (conditionId),
    CONSTRAINT FK_option_condition_option
        FOREIGN KEY (optionId) REFERENCES t_question_option (optionId),
    CONSTRAINT FK_option_condition_question
        FOREIGN KEY (targetQuestionId) REFERENCES t_section_question (questionId),
    CONSTRAINT FK_option_condition_section
        FOREIGN KEY (targetSectionId) REFERENCES t_form_section (sectionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Form Response Tables

-- 8. Root beneficiary response - tracks status lifecycle DRAFT->SUBMITTED->COMPLETE
CREATE TABLE IF NOT EXISTS t_form_response (
    responseId        BIGINT       NOT NULL AUTO_INCREMENT,
    beneficiaryId     BIGINT       NOT NULL,
    formId            BIGINT       NOT NULL,  -- denormalized for fast form-level queries
    versionId         BIGINT       NOT NULL,  -- exact FormVersion at submission time
    officerId         BIGINT       NOT NULL,
    status            VARCHAR(20)  NOT NULL DEFAULT 'DRAFT',  -- DRAFT|SUBMITTED|COMPLETE
    submittedAt       DATETIME(6)  NULL,
    completedAt       DATETIME(6)  NULL,
    last_follow_up_at DATETIME(6)  NULL,
    created_by        VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    createdAt         DATETIME(6)  NOT NULL,
    updatedAt         DATETIME(6)  NOT NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (responseId),
    INDEX IDX_form_response_beneficiary_form (beneficiaryId, formId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 9. Completion state of one section within a form response
CREATE TABLE IF NOT EXISTS t_section_response (
    sectionResponseId BIGINT       NOT NULL AUTO_INCREMENT,
    responseId        BIGINT       NOT NULL,
    sectionId         BIGINT       NOT NULL,
    status            VARCHAR(20)  NOT NULL,  -- PENDING|IN_PROGRESS|DONE|SKIPPED
    savedAt           DATETIME(6)  NULL,
    created_by        VARCHAR(100) NULL,
    updated_by        VARCHAR(100) NULL,
    vanID             INT          NULL,
    parkingPlaceID    INT          NULL,
    processed         VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo       BIGINT       NULL,
    SyncedDate        DATETIME(6)  NULL,
    Syncedby          VARCHAR(50)  NULL,
    SyncFailureReason VARCHAR(255) NULL,
    PRIMARY KEY (sectionResponseId),
    CONSTRAINT FK_section_response_form_response
        FOREIGN KEY (responseId) REFERENCES t_form_response (responseId),
    CONSTRAINT FK_section_response_section
        FOREIGN KEY (sectionId) REFERENCES t_form_section (sectionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 10. One answer per question per section response
--     MCQ produces multiple rows (one per selected option) - no UNIQUE on (sectionResponseId, questionId)
CREATE TABLE IF NOT EXISTS t_question_response (
    questionResponseId BIGINT       NOT NULL AUTO_INCREMENT,
    sectionResponseId  BIGINT       NOT NULL,
    questionId         BIGINT       NOT NULL,
    optionId           BIGINT       NULL,      -- set for RADIO/MCQ
    answerText         LONGTEXT     NULL,      -- set for TEXT/DATE/AUTO_FILL (@Lob)
    created_by         VARCHAR(100) NULL,
    updated_by         VARCHAR(100) NULL,
    vanID              INT          NULL,
    parkingPlaceID     INT          NULL,
    processed          VARCHAR(255) NULL DEFAULT 'N',
    vanSerialNo        BIGINT       NULL,
    SyncedDate         DATETIME(6)  NULL,
    Syncedby           VARCHAR(50)  NULL,
    SyncFailureReason  VARCHAR(255) NULL,
    PRIMARY KEY (questionResponseId),
    CONSTRAINT FK_question_response_section_response
        FOREIGN KEY (sectionResponseId) REFERENCES t_section_response (sectionResponseId),
    CONSTRAINT FK_question_response_question
        FOREIGN KEY (questionId) REFERENCES t_section_question (questionId),
    CONSTRAINT FK_question_response_option
        FOREIGN KEY (optionId) REFERENCES t_question_option (optionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
