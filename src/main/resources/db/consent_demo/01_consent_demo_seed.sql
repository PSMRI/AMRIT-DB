-- DEV/DEMO ONLY — not Flyway. Re-runnable (every insert is existence-checked).
-- Demo purposes and notices for the MMU consent demo (Consent-API features 002 and 004).
-- Apply by hand to db_identity after the dbidentity Flyway migrations V33–V38 have run.
--
-- The wording is a working draft, not approved legal text. Before UAT/production it must be approved by
-- legal, and the Hindi and Assamese checked by native speakers. Real notice changes go through
-- saveDraft -> publish (a new version) from the Admin "Consent message" tab, never through this script.
-- Phone numbers and e-mail addresses are demo values: replace them with the real ones.

USE db_identity;

-- =============================================================================================
-- Text
-- =============================================================================================
-- English
SET @en_body = 'To give you care through the Mobile Medical Unit, we need your permission to collect and use your personal and health information. This notice explains what we collect, why we collect it, who can see it, how long we keep it and what your rights are. The uses marked "Required for this service" are needed to treat you; the others are your choice.';
SET @en_body_p = 'To give you care in this programme, we need your permission to collect and use your personal and health information. This notice explains what we collect, why we collect it, who can see it, how long we keep it and what your rights are. The uses marked "Required for this service" are needed to treat you; the others are your choice.';
SET @en_items = 'Your name, age, gender, phone number and address, and your health details such as symptoms, diagnoses, test results, prescriptions and visit history.';
SET @en_ret = 'We keep your health record for as long as the law requires for medical records. When you withdraw consent for an optional use, we stop using your information for that use, unless the law requires us to keep it.';
SET @en_rec = 'Only the doctors, nurses and health workers who care for you can see your record. We share it with others, such as your family or doctors at other facilities, only if you agree or when the law requires it.';
SET @en_wd = 'You can withdraw your consent for any optional use at any time, at the Mobile Medical Unit or by calling the helpline. Withdrawing does not affect the care you have already received.';
SET @en_gr = 'If you have a concern about how your information is used, contact our Grievance Officer (details below). If you are not satisfied with the reply, you can complain to the Data Protection Board of India.';
SET @en_decl = 'I have read this notice, or had it read to me, in a language I understand, and I agree to the uses I have selected.';
SET @en_rdecl = 'I am the parent, guardian or authorised representative of the patient. I have read this notice, or had it read to me, and I agree on the patient''s behalf to the uses I have selected.';

-- Hindi
SET @hi_body = 'मोबाइल मेडिकल यूनिट के माध्यम से आपका इलाज करने के लिए हमें आपकी व्यक्तिगत और स्वास्थ्य जानकारी एकत्र करने और उपयोग करने की अनुमति चाहिए। यह सूचना बताती है कि हम कौन-सी जानकारी लेते हैं, क्यों लेते हैं, उसे कौन देख सकता है, उसे कितने समय तक रखा जाता है और आपके क्या अधिकार हैं। "इस सेवा के लिए आवश्यक" चिह्नित उपयोग आपके इलाज के लिए ज़रूरी हैं; बाकी आपकी इच्छा पर हैं।';
SET @hi_body_p = 'इस कार्यक्रम में आपका इलाज करने के लिए हमें आपकी व्यक्तिगत और स्वास्थ्य जानकारी एकत्र करने और उपयोग करने की अनुमति चाहिए। यह सूचना बताती है कि हम कौन-सी जानकारी लेते हैं, क्यों लेते हैं, उसे कौन देख सकता है, उसे कितने समय तक रखा जाता है और आपके क्या अधिकार हैं। "इस सेवा के लिए आवश्यक" चिह्नित उपयोग आपके इलाज के लिए ज़रूरी हैं; बाकी आपकी इच्छा पर हैं।';
SET @hi_items = 'आपका नाम, आयु, लिंग, फ़ोन नंबर और पता, तथा आपकी स्वास्थ्य जानकारी जैसे लक्षण, निदान, जाँच के परिणाम, दवाइयाँ और पिछली विज़िट।';
SET @hi_ret = 'आपका स्वास्थ्य रिकॉर्ड उतने समय तक रखा जाता है जितना चिकित्सा रिकॉर्ड के लिए कानून में आवश्यक है। किसी वैकल्पिक उपयोग की सहमति वापस लेने पर उस उपयोग के लिए आपकी जानकारी का उपयोग बंद कर दिया जाता है, जब तक कि कानून उसे रखने की माँग न करे।';
SET @hi_rec = 'आपका रिकॉर्ड केवल वही डॉक्टर, नर्स और स्वास्थ्य कर्मी देख सकते हैं जो आपका इलाज करते हैं। आपके परिवार या अन्य अस्पतालों के डॉक्टरों के साथ इसे केवल आपकी सहमति से, या कानून द्वारा आवश्यक होने पर ही साझा किया जाता है।';
SET @hi_wd = 'आप किसी भी वैकल्पिक उपयोग के लिए अपनी सहमति कभी भी मोबाइल मेडिकल यूनिट पर या हेल्पलाइन पर कॉल करके वापस ले सकते हैं। सहमति वापस लेने से पहले मिले इलाज पर कोई असर नहीं पड़ता।';
SET @hi_gr = 'यदि आपकी जानकारी के उपयोग को लेकर कोई शिकायत है, तो हमारे शिकायत अधिकारी से संपर्क करें (विवरण नीचे दिया गया है)। उत्तर से संतुष्ट न होने पर आप भारतीय डेटा संरक्षण बोर्ड में शिकायत कर सकते हैं।';
SET @hi_decl = 'मैंने यह सूचना अपनी समझ की भाषा में पढ़ी है या मुझे पढ़कर सुनाई गई है, और मैं अपने द्वारा चुने गए उपयोगों के लिए सहमति देता/देती हूँ।';
SET @hi_rdecl = 'मैं रोगी का माता-पिता, अभिभावक या अधिकृत प्रतिनिधि हूँ। मैंने यह सूचना पढ़ी है या मुझे पढ़कर सुनाई गई है, और मैं रोगी की ओर से चुने गए उपयोगों के लिए सहमति देता/देती हूँ।';

-- Assamese
SET @as_body = 'ম’বাইল মেডিকেল ইউনিটৰ জৰিয়তে আপোনাক চিকিৎসা প্ৰদান কৰিবলৈ আপোনাৰ ব্যক্তিগত আৰু স্বাস্থ্য সম্পৰ্কীয় তথ্য সংগ্ৰহ আৰু ব্যৱহাৰ কৰিবলৈ আমাক আপোনাৰ অনুমতি লাগে। এই জাননীয়ে আমি কি তথ্য লওঁ, কিয় লওঁ, কোনে চাব পাৰে, কিমান দিন ৰখা হয় আৰু আপোনাৰ অধিকাৰসমূহ কি, সেয়া বুজায়।';
SET @as_items = 'আপোনাৰ নাম, বয়স, লিংগ, ফোন নম্বৰ আৰু ঠিকনা, লগতে আপোনাৰ স্বাস্থ্যৰ তথ্য যেনে লক্ষণ, ৰোগ নিৰ্ণয়, পৰীক্ষাৰ ফলাফল, ঔষধ আৰু পূৰ্বৰ ভিজিট।';
SET @as_ret = 'চিকিৎসা ৰেকৰ্ডৰ বাবে আইনে যিমান দিন বিচাৰে, সিমান দিনলৈ আপোনাৰ স্বাস্থ্য ৰেকৰ্ড ৰখা হয়। কোনো ঐচ্ছিক ব্যৱহাৰৰ সন্মতি ঘূৰাই ল’লে সেই ব্যৱহাৰৰ বাবে তথ্য ব্যৱহাৰ বন্ধ কৰা হয়, যদিহে আইনে ইয়াক ৰাখিবলৈ নিৰ্দেশ নিদিয়ে।';
SET @as_rec = 'আপোনাক চিকিৎসা কৰা চিকিৎসক, নাৰ্চ আৰু স্বাস্থ্য কৰ্মীয়েহে আপোনাৰ ৰেকৰ্ড চাব পাৰে। আপোনাৰ পৰিয়াল বা আন চিকিৎসালয়ৰ চিকিৎসকৰ সৈতে কেৱল আপোনাৰ সন্মতিত বা আইনে বিচাৰিলেহে ইয়াক ভাগ-বতৰা কৰা হয়।';
SET @as_wd = 'আপুনি যিকোনো সময়তে ম’বাইল মেডিকেল ইউনিটত বা হেল্পলাইনত ফোন কৰি যিকোনো ঐচ্ছিক ব্যৱহাৰৰ সন্মতি ঘূৰাই ল’ব পাৰে। সন্মতি ঘূৰাই ল’লে ইতিমধ্যে পোৱা চিকিৎসাত কোনো প্ৰভাৱ নপৰে।';
SET @as_gr = 'আপোনাৰ তথ্যৰ ব্যৱহাৰ সম্পৰ্কে কোনো অভিযোগ থাকিলে আমাৰ অভিযোগ বিষয়াৰ সৈতে যোগাযোগ কৰক (তলত বিৱৰণ দিয়া আছে)। উত্তৰত সন্তুষ্ট নহ’লে আপুনি ভাৰতৰ ডেটা সুৰক্ষা বৰ্ডত অভিযোগ কৰিব পাৰে।';
SET @as_decl = 'মই এই জাননী মই বুজি পোৱা ভাষাত পঢ়িলোঁ বা মোক পঢ়ি শুনোৱা হ’ল, আৰু মই বাছনি কৰা ব্যৱহাৰসমূহত সন্মতি দিলোঁ।';
SET @as_rdecl = 'মই ৰোগীৰ পিতৃ-মাতৃ, অভিভাৱক বা অনুমোদিত প্ৰতিনিধি। মই এই জাননী পঢ়িলোঁ বা মোক পঢ়ি শুনোৱা হ’ল, আৰু ৰোগীৰ হৈ বাছনি কৰা ব্যৱহাৰসমূহত সন্মতি দিলোঁ।';

-- Approver (internal): stays "Pending legal approval" until legal signs off, then the approver's name.
SET @approver = 'Pending legal approval';

-- =============================================================================================
-- Purposes (mandatory first)
-- Legal basis is internal (not returned by any API). Draft for legal to confirm: purposes that cannot be
-- withdrawn cannot rest on consent alone (DPDP s.6), so they need a s.7 legitimate use.
-- =============================================================================================
DROP TEMPORARY TABLE IF EXISTS tmp_consent_demo_purpose;
CREATE TEMPORARY TABLE tmp_consent_demo_purpose AS
SELECT 'P-REG' code, 'Registration' name,
       'Create and keep your health record so that we can identify you at every visit' descr,
       'DPDP Act 2023 s.7 - legitimate use (health service)' basis, b'1' mand, b'0' withd, NULL days
UNION ALL SELECT 'P-TRT', 'Treatment',
       'Use your health record to examine, diagnose and treat you',
       'DPDP Act 2023 s.7 - legitimate use (health service)', b'1', b'0', NULL
UNION ALL SELECT 'P-REM', 'SMS reminders',
       'Send you SMS reminders about visits, medicines and follow-ups',
       'DPDP Act 2023 s.6 - consent', b'0', b'1', 365
UNION ALL SELECT 'P-FAM', 'Share with family',
       'Share your health information with your spouse or the family members you name',
       'DPDP Act 2023 s.6 - consent', b'0', b'1', 365
UNION ALL SELECT 'P-SHR', 'Share with other facilities',
       'Share your health record with doctors at other hospitals or clinics who treat you',
       'DPDP Act 2023 s.6 - consent', b'0', b'1', 365
UNION ALL SELECT 'P-RES', 'Research',
       'Use your information, with your name and identity removed, for health research and programme improvement',
       'DPDP Act 2023 s.6 - consent', b'0', b'1', 365;

INSERT INTO cm_purpose (purpose_code, version, name, description, legal_basis, is_mandatory,
  is_withdrawable, validity_days, is_active, CreatedBy)
SELECT p.code, 1, p.name, p.descr, p.basis, p.mand, p.withd, p.days, b'1', 'consent-demo-seed'
FROM tmp_consent_demo_purpose p
WHERE NOT EXISTS (SELECT 1 FROM cm_purpose x WHERE x.purpose_code = p.code AND x.version = 1);

-- =============================================================================================
-- Notices: central REGISTRATION and REVISIT, and project 3's own REGISTRATION notice
-- =============================================================================================
INSERT INTO cm_notice (notice_code, version_no, context, is_material, status, approved_by, published_at,
  project_id, grievance_officer_name, grievance_phone, grievance_email, grievance_address, grievance_office_hours,
  CreatedBy)
SELECT n.code, 1, n.ctx, b'0', 'PUBLISHED', @approver, UTC_TIMESTAMP(3),
  n.project_id, 'Grievance Officer', n.phone, n.email, n.addr, n.hours, 'consent-demo-seed'
FROM (
  SELECT 'MMU-REGISTRATION' code, 'REGISTRATION' ctx, NULL project_id, '1800-000-0000' phone,
         'grievance.demo@example.org' email, 'Grievance Cell, District Health Office' addr,
         'Monday to Friday, 10:00 am – 5:00 pm' hours
  UNION ALL SELECT 'MMU-REVISIT', 'REVISIT', NULL, '1800-000-0000',
         'grievance.demo@example.org', 'Grievance Cell, District Health Office',
         'Monday to Friday, 10:00 am – 5:00 pm'
  UNION ALL SELECT 'MMU-REGISTRATION-P3', 'REGISTRATION', 3, '1800-000-0003',
         'grievance.p3.demo@example.org', 'Grievance Cell, Programme Office',
         'Monday to Saturday, 9:00 am – 5:00 pm'
) n
WHERE NOT EXISTS (SELECT 1 FROM cm_notice x WHERE x.notice_code = n.code AND x.version_no = 1);

-- Purposes covered by each notice. Central notices: all six; project 3: P-REG, P-TRT, P-REM.
INSERT INTO cm_notice_purpose (notice_version_id, purpose_code, display_rank, CreatedBy)
SELECT n.notice_version_id, p.code, p.rnk, 'consent-demo-seed'
FROM cm_notice n
JOIN (SELECT 'P-REG' code, 1 rnk UNION ALL SELECT 'P-TRT', 2 UNION ALL SELECT 'P-REM', 3
      UNION ALL SELECT 'P-FAM', 4 UNION ALL SELECT 'P-SHR', 5 UNION ALL SELECT 'P-RES', 6) p
WHERE n.version_no = 1
  AND (n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT')
       OR (n.notice_code = 'MMU-REGISTRATION-P3' AND p.code IN ('P-REG', 'P-TRT', 'P-REM')))
  AND NOT EXISTS (SELECT 1 FROM cm_notice_purpose x
                  WHERE x.notice_version_id = n.notice_version_id AND x.purpose_code = p.code);

-- =============================================================================================
-- Translations: central notices in en, hi, as; project 3 in en, hi.
-- text_hash covers the six text sections (Consent-API compares it on save).
-- =============================================================================================
INSERT INTO cm_notice_translation (notice_version_id, language_code, language_name, body,
  data_items, retention, recipients, withdrawal_info, grievance_info, text_hash, audio_ref,
  declaration, representative_declaration, CreatedBy)
SELECT t.notice_version_id, t.lang, t.lname, t.body, t.items, t.ret, t.rec, t.wd, t.gr,
  SHA2(CONCAT_WS('\n', t.body, t.items, t.ret, t.rec, t.wd, t.gr), 256), t.audio, t.decl, t.rdecl,
  'consent-demo-seed'
FROM (
  SELECT n.notice_version_id, 'en' lang, 'English' lname,
    IF(n.project_id IS NULL, @en_body, @en_body_p) body, @en_items items, @en_ret ret, @en_rec rec,
    @en_wd wd, @en_gr gr, @en_decl decl, @en_rdecl rdecl,
    IF(n.project_id IS NULL, CONCAT('notice-', n.notice_code, '-en.mp3'), NULL) audio
  FROM cm_notice n
  WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT', 'MMU-REGISTRATION-P3') AND n.version_no = 1
  UNION ALL
  SELECT n.notice_version_id, 'hi', 'हिन्दी',
    IF(n.project_id IS NULL, @hi_body, @hi_body_p), @hi_items, @hi_ret, @hi_rec,
    @hi_wd, @hi_gr, @hi_decl, @hi_rdecl, NULL
  FROM cm_notice n
  WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT', 'MMU-REGISTRATION-P3') AND n.version_no = 1
  UNION ALL
  SELECT n.notice_version_id, 'as', 'অসমীয়া',
    @as_body, @as_items, @as_ret, @as_rec, @as_wd, @as_gr, @as_decl, @as_rdecl, NULL
  FROM cm_notice n
  WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT') AND n.version_no = 1
) t
WHERE NOT EXISTS (SELECT 1 FROM cm_notice_translation x
                  WHERE x.notice_version_id = t.notice_version_id AND x.language_code = t.lang);

-- =============================================================================================
-- Databases seeded by an earlier version of this script still hold "[DEMO – TODO-LEGAL]"
-- placeholders. Replace them with the text above. Only rows this script created are touched;
-- notices published from the Admin "Consent message" tab are left alone.
-- =============================================================================================
UPDATE cm_purpose p
JOIN tmp_consent_demo_purpose x ON x.code = p.purpose_code
SET p.name = x.name, p.description = x.descr, p.legal_basis = x.basis, p.ModifiedBy = 'consent-demo-seed'
WHERE p.version = 1
  AND CONCAT_WS(' ', p.name, p.description, p.legal_basis) LIKE '%TODO-LEGAL%';

UPDATE cm_notice
SET approved_by = @approver,
    grievance_officer_name = 'Grievance Officer',
    grievance_phone = COALESCE(grievance_phone, IF(project_id IS NULL, '1800-000-0000', '1800-000-0003')),
    grievance_email = COALESCE(grievance_email,
                               IF(project_id IS NULL, 'grievance.demo@example.org', 'grievance.p3.demo@example.org')),
    grievance_address = IF(project_id IS NULL, 'Grievance Cell, District Health Office',
                           'Grievance Cell, Programme Office'),
    grievance_office_hours = IF(project_id IS NULL, 'Monday to Friday, 10:00 am – 5:00 pm',
                                'Monday to Saturday, 9:00 am – 5:00 pm'),
    ModifiedBy = 'consent-demo-seed'
WHERE notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT', 'MMU-REGISTRATION-P3') AND version_no = 1
  AND CreatedBy = 'consent-demo-seed'
  AND (grievance_officer_name IS NULL
       OR CONCAT_WS(' ', grievance_officer_name, grievance_address, grievance_office_hours, approved_by)
          LIKE '%TODO-LEGAL%');

UPDATE cm_notice_translation t
JOIN cm_notice n ON n.notice_version_id = t.notice_version_id
SET t.body = CASE t.language_code
      WHEN 'en' THEN IF(n.project_id IS NULL, @en_body, @en_body_p)
      WHEN 'hi' THEN IF(n.project_id IS NULL, @hi_body, @hi_body_p)
      ELSE @as_body END,
    t.data_items      = CASE t.language_code WHEN 'en' THEN @en_items WHEN 'hi' THEN @hi_items ELSE @as_items END,
    t.retention       = CASE t.language_code WHEN 'en' THEN @en_ret   WHEN 'hi' THEN @hi_ret   ELSE @as_ret END,
    t.recipients      = CASE t.language_code WHEN 'en' THEN @en_rec   WHEN 'hi' THEN @hi_rec   ELSE @as_rec END,
    t.withdrawal_info = CASE t.language_code WHEN 'en' THEN @en_wd    WHEN 'hi' THEN @hi_wd    ELSE @as_wd END,
    t.grievance_info  = CASE t.language_code WHEN 'en' THEN @en_gr    WHEN 'hi' THEN @hi_gr    ELSE @as_gr END,
    t.declaration     = CASE t.language_code WHEN 'en' THEN @en_decl  WHEN 'hi' THEN @hi_decl  ELSE @as_decl END,
    t.representative_declaration =
                        CASE t.language_code WHEN 'en' THEN @en_rdecl WHEN 'hi' THEN @hi_rdecl ELSE @as_rdecl END,
    t.ModifiedBy = 'consent-demo-seed'
WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT', 'MMU-REGISTRATION-P3') AND n.version_no = 1
  AND t.CreatedBy = 'consent-demo-seed' AND t.language_code IN ('en', 'hi', 'as')
  AND (t.declaration IS NULL
       OR CONCAT_WS(' ', t.body, t.data_items, t.retention, t.recipients, t.withdrawal_info, t.grievance_info,
                    t.declaration, t.representative_declaration) LIKE '%TODO-LEGAL%');

-- Recompute text_hash exactly as Consent-API does (SHA-256 of the six sections joined by a newline).
UPDATE cm_notice_translation t
JOIN cm_notice n ON n.notice_version_id = t.notice_version_id
SET t.text_hash = SHA2(CONCAT_WS('\n', t.body, t.data_items, t.retention, t.recipients,
                                 t.withdrawal_info, t.grievance_info), 256)
WHERE n.notice_code IN ('MMU-REGISTRATION', 'MMU-REVISIT', 'MMU-REGISTRATION-P3') AND n.version_no = 1
  AND t.CreatedBy = 'consent-demo-seed';

DROP TEMPORARY TABLE IF EXISTS tmp_consent_demo_purpose;

-- Check: this should return no rows.
SELECT 'purpose' tbl, purpose_code ref, name txt FROM cm_purpose
 WHERE CONCAT_WS(' ', name, description, legal_basis) LIKE '%TODO-LEGAL%'
UNION ALL
SELECT 'translation', CONCAT(notice_version_id, '/', language_code), LEFT(body, 60) FROM cm_notice_translation
 WHERE CONCAT_WS(' ', body, data_items, retention, recipients, withdrawal_info, grievance_info, declaration,
                 representative_declaration) LIKE '%TODO-LEGAL%'
UNION ALL
SELECT 'notice', notice_code, grievance_officer_name FROM cm_notice
 WHERE CONCAT_WS(' ', grievance_officer_name, grievance_address, grievance_office_hours, approved_by) LIKE '%TODO-LEGAL%';
