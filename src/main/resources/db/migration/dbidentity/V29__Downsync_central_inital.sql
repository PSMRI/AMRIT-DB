 UPDATE db_identity.m_beneficiaryregidmapping    SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiarydetails         SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryaddress         SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiarycontacts        SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryaccount         SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryconsent         SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryimage           SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiarymapping         SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryfamilymapping   SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiaryidentity        SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_beneficiarydetails_rmnch   SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 UPDATE db_identity.i_householddetails           SET DownSynced='P', DownSyncDate=NOW(), LastModDate=LastModDate WHERE DownSynced='N' AND VanSerialNo IS NOT NULL;
 
 