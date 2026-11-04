-- DEV/DEMO ONLY — not Flyway — TODO-LEGAL text.
-- Placeholder purposes and notices for the MMU consent demo (Consent-API feature 002).
-- Apply by hand after V30__Consent_Manager_Capture.sql. Re-runnable (existence-checked).

USE db_identity;

-- Purposes: mandatory first. validity_days and legal_basis are TODO-LEGAL placeholders.
INSERT INTO cm_purpose (purpose_code, version, name, description, legal_basis, is_mandatory,
  is_withdrawable, validity_days, is_active, CreatedBy)
SELECT p.code, 1, p.name, p.descr, 'TODO-LEGAL', p.mand, p.withd, p.days, b'1', 'consent-demo-seed'
FROM (
  SELECT 'P-REG' code, '[DEMO – TODO-LEGAL] Registration' name,
         '[DEMO – TODO-LEGAL] Create and keep your health record' descr, b'1' mand, b'0' withd, NULL days
  UNION ALL SELECT 'P-TRT', '[DEMO – TODO-LEGAL] Treatment',
         '[DEMO – TODO-LEGAL] Use your record to treat you', b'1', b'0', NULL
  UNION ALL SELECT 'P-REM', '[DEMO – TODO-LEGAL] SMS reminders',
         '[DEMO – TODO-LEGAL] Send visit and medicine reminders', b'0', b'1', 365
  UNION ALL SELECT 'P-FAM', '[DEMO – TODO-LEGAL] Share with family',
         '[DEMO – TODO-LEGAL] Share your record with your spouse or family', b'0', b'1', 365
  UNION ALL SELECT 'P-SHR', '[DEMO – TODO-LEGAL] Share with other facilities',
         '[DEMO – TODO-LEGAL] Share your record with doctors at other facilities', b'0', b'1', 365
  UNION ALL SELECT 'P-RES', '[DEMO – TODO-LEGAL] Research',
         '[DEMO – TODO-LEGAL] Use anonymised data for research', b'0', b'1', 365
) p
WHERE NOT EXISTS (SELECT 1 FROM cm_purpose x WHERE x.purpose_code = p.code AND x.version = 1);

-- Notices: one PUBLISHED notice for REGISTRATION and one for REVISIT.
INSERT INTO cm_notice (notice_code, version_no, context, is_material, status, approved_by,
  published_at, CreatedBy)
SELECT n.code, 1, n.ctx, b'0', 'PUBLISHED', 'TODO-LEGAL', UTC_TIMESTAMP(3), 'consent-demo-seed'
FROM (SELECT 'MMU-REGISTRATION' code, 'REGISTRATION' ctx
      UNION ALL SELECT 'MMU-REVISIT', 'REVISIT') n
WHERE NOT EXISTS (SELECT 1 FROM cm_notice x WHERE x.notice_code = n.code AND x.version_no = 1);

-- Purposes covered by each notice (mandatory first).
INSERT INTO cm_notice_purpose (notice_version_id, purpose_code, display_rank, CreatedBy)
SELECT n.notice_version_id, p.code, p.rnk, 'consent-demo-seed'
FROM cm_notice n
JOIN (SELECT 'P-REG' code, 1 rnk UNION ALL SELECT 'P-TRT', 2 UNION ALL SELECT 'P-REM', 3
      UNION ALL SELECT 'P-FAM', 4 UNION ALL SELECT 'P-SHR', 5 UNION ALL SELECT 'P-RES', 6) p
WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1
  AND NOT EXISTS (SELECT 1 FROM cm_notice_purpose x
                  WHERE x.notice_version_id = n.notice_version_id AND x.purpose_code = p.code);

-- Translations: en, hi, as. text_hash covers the six text sections (Consent-API compares it on save).
INSERT INTO cm_notice_translation (notice_version_id, language_code, language_name, body,
  data_items, retention, recipients, withdrawal_info, grievance_info, text_hash, audio_ref, CreatedBy)
SELECT t.notice_version_id, t.lang, t.lname, t.body, t.items, t.ret, t.rec, t.wd, t.gr,
  SHA2(CONCAT_WS('\n', t.body, t.items, t.ret, t.rec, t.wd, t.gr), 256), t.audio, 'consent-demo-seed'
FROM (
  SELECT n.notice_version_id, 'en' lang, 'English' lname,
    '[DEMO – TODO-LEGAL] This notice explains how your health data is used.' body,
    '[DEMO – TODO-LEGAL] Name, age, phone, address, health details.' items,
    '[DEMO – TODO-LEGAL] Kept as long as the law requires.' ret,
    '[DEMO – TODO-LEGAL] Your health workers; others only with your consent.' rec,
    '[DEMO – TODO-LEGAL] You can withdraw at any time at the facility or helpline.' wd,
    '[DEMO – TODO-LEGAL] Complain to the DPO or the Data Protection Board.' gr,
    CONCAT('notice-', n.notice_code, '-en.mp3') audio
  FROM cm_notice n WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1
  UNION ALL
  SELECT n.notice_version_id, 'hi', 'हिन्दी',
    '[DEMO – TODO-LEGAL] यह सूचना बताती है कि आपके स्वास्थ्य डेटा का उपयोग कैसे होता है।',
    '[DEMO – TODO-LEGAL] नाम, आयु, फ़ोन, पता, स्वास्थ्य विवरण।',
    '[DEMO – TODO-LEGAL] कानून के अनुसार रखा जाएगा।',
    '[DEMO – TODO-LEGAL] आपके स्वास्थ्य कर्मी; अन्य केवल आपकी सहमति से।',
    '[DEMO – TODO-LEGAL] आप कभी भी सहमति वापस ले सकते हैं।',
    '[DEMO – TODO-LEGAL] शिकायत DPO या डेटा संरक्षण बोर्ड से करें।',
    NULL
  FROM cm_notice n WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1
  UNION ALL
  SELECT n.notice_version_id, 'as', 'অসমীয়া',
    '[DEMO – TODO-LEGAL] এই জাননীয়ে আপোনাৰ স্বাস্থ্য তথ্য কেনেকৈ ব্যৱহাৰ হয় বুজায়।',
    '[DEMO – TODO-LEGAL] নাম, বয়স, ফোন, ঠিকনা, স্বাস্থ্যৰ বিৱৰণ।',
    '[DEMO – TODO-LEGAL] আইন অনুসৰি ৰখা হ’ব।',
    '[DEMO – TODO-LEGAL] আপোনাৰ স্বাস্থ্য কৰ্মী; আন কেৱল আপোনাৰ সন্মতিত।',
    '[DEMO – TODO-LEGAL] আপুনি যিকোনো সময়ত সন্মতি ঘূৰাই ল’ব পাৰে।',
    '[DEMO – TODO-LEGAL] DPO বা ডেটা সুৰক্ষা বৰ্ডত অভিযোগ কৰক।',
    NULL
  FROM cm_notice n WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1
) t
WHERE NOT EXISTS (SELECT 1 FROM cm_notice_translation x
                  WHERE x.notice_version_id = t.notice_version_id AND x.language_code = t.lang);

-- ---------------------------------------------------------------------------------------------
-- Consent-API feature 004 (apply after V35__Consent_Capture_Review.sql). Re-runnable.
-- ---------------------------------------------------------------------------------------------

-- Grievance officer contact on the central notices (only when not set yet).
UPDATE cm_notice
SET grievance_officer_name = '[DEMO – TODO-LEGAL] Grievance Officer',
    grievance_phone = '1800-000-0000',
    grievance_email = 'grievance.demo@example.org',
    grievance_address = '[DEMO – TODO-LEGAL] Grievance cell, district health office',
    grievance_office_hours = '[DEMO – TODO-LEGAL] Mon–Fri, 10:00–17:00',
    ModifiedBy = 'consent-demo-seed'
WHERE notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND version_no = 1
  AND project_id IS NULL AND grievance_officer_name IS NULL;

-- Declarations on the central translations (only when not set yet).
UPDATE cm_notice_translation t
JOIN cm_notice n ON n.notice_version_id = t.notice_version_id
SET t.declaration = CASE t.language_code
      WHEN 'en' THEN '[DEMO – TODO-LEGAL] I have read or heard this notice and I agree to the uses I selected.'
      WHEN 'hi' THEN '[DEMO – TODO-LEGAL] मैंने यह सूचना पढ़ी या सुनी है और चुने गए उपयोगों के लिए सहमति देता/देती हूँ।'
      ELSE '[DEMO – TODO-LEGAL] মই এই জাননী পঢ়িলোঁ বা শুনিলোঁ আৰু বাছনি কৰা ব্যৱহাৰত সন্মতি দিলোঁ।' END,
    t.representative_declaration = CASE t.language_code
      WHEN 'en' THEN '[DEMO – TODO-LEGAL] As guardian / representative, I agree on behalf of the patient to the uses I selected.'
      ELSE NULL END,
    t.ModifiedBy = 'consent-demo-seed'
WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1 AND t.declaration IS NULL;

-- Project 3's own REGISTRATION notice (project_id = 3).
INSERT INTO cm_notice (notice_code, version_no, context, is_material, status, approved_by, published_at,
  project_id, grievance_officer_name, grievance_phone, grievance_email, grievance_address, grievance_office_hours,
  CreatedBy)
SELECT 'MMU-REGISTRATION-P3', 1, 'REGISTRATION', b'0', 'PUBLISHED', 'TODO-LEGAL', UTC_TIMESTAMP(3),
  3, '[DEMO – TODO-LEGAL] Project 3 Grievance Officer', '1800-000-0003', 'grievance.p3.demo@example.org',
  '[DEMO – TODO-LEGAL] Project 3 office', '[DEMO – TODO-LEGAL] Mon–Sat, 09:00–17:00', 'consent-demo-seed'
WHERE NOT EXISTS (SELECT 1 FROM cm_notice x WHERE x.notice_code = 'MMU-REGISTRATION-P3' AND x.version_no = 1);

INSERT INTO cm_notice_purpose (notice_version_id, purpose_code, display_rank, CreatedBy)
SELECT n.notice_version_id, p.code, p.rnk, 'consent-demo-seed'
FROM cm_notice n
JOIN (SELECT 'P-REG' code, 1 rnk UNION ALL SELECT 'P-TRT', 2 UNION ALL SELECT 'P-REM', 3) p
WHERE n.notice_code = 'MMU-REGISTRATION-P3' AND n.version_no = 1
  AND NOT EXISTS (SELECT 1 FROM cm_notice_purpose x
                  WHERE x.notice_version_id = n.notice_version_id AND x.purpose_code = p.code);

INSERT INTO cm_notice_translation (notice_version_id, language_code, language_name, body,
  data_items, retention, recipients, withdrawal_info, grievance_info, text_hash, audio_ref,
  declaration, representative_declaration, CreatedBy)
SELECT t.notice_version_id, t.lang, t.lname, t.body, t.items, t.ret, t.rec, t.wd, t.gr,
  SHA2(CONCAT_WS('\n', t.body, t.items, t.ret, t.rec, t.wd, t.gr), 256), NULL, t.decl, t.rdecl,
  'consent-demo-seed'
FROM (
  SELECT n.notice_version_id, 'en' lang, 'English' lname,
    '[DEMO – TODO-LEGAL] Project 3 notice: how your health data is used in this programme.' body,
    '[DEMO – TODO-LEGAL] Name, age, phone, address, health details.' items,
    '[DEMO – TODO-LEGAL] Kept as long as the law requires.' ret,
    '[DEMO – TODO-LEGAL] Project 3 health workers; others only with your consent.' rec,
    '[DEMO – TODO-LEGAL] You can withdraw at any time at the facility or helpline.' wd,
    '[DEMO – TODO-LEGAL] Complain to the project grievance officer or the Data Protection Board.' gr,
    '[DEMO – TODO-LEGAL] I have read or heard the project 3 notice and I agree to the uses I selected.' decl,
    '[DEMO – TODO-LEGAL] As guardian / representative, I agree on behalf of the patient (project 3).' rdecl
  FROM cm_notice n WHERE n.notice_code = 'MMU-REGISTRATION-P3' AND n.version_no = 1
  UNION ALL
  SELECT n.notice_version_id, 'hi', 'हिन्दी',
    '[DEMO – TODO-LEGAL] परियोजना 3 सूचना: इस कार्यक्रम में आपके स्वास्थ्य डेटा का उपयोग।',
    '[DEMO – TODO-LEGAL] नाम, आयु, फ़ोन, पता, स्वास्थ्य विवरण।',
    '[DEMO – TODO-LEGAL] कानून के अनुसार रखा जाएगा।',
    '[DEMO – TODO-LEGAL] परियोजना 3 के स्वास्थ्य कर्मी; अन्य केवल आपकी सहमति से।',
    '[DEMO – TODO-LEGAL] आप कभी भी सहमति वापस ले सकते हैं।',
    '[DEMO – TODO-LEGAL] शिकायत परियोजना शिकायत अधिकारी या डेटा संरक्षण बोर्ड से करें।',
    '[DEMO – TODO-LEGAL] मैंने परियोजना 3 की सूचना पढ़ी या सुनी है और चुने गए उपयोगों के लिए सहमति देता/देती हूँ।',
    NULL
  FROM cm_notice n WHERE n.notice_code = 'MMU-REGISTRATION-P3' AND n.version_no = 1
) t
WHERE NOT EXISTS (SELECT 1 FROM cm_notice_translation x
                  WHERE x.notice_version_id = t.notice_version_id AND x.language_code = t.lang);
