use db_1097_identity;

alter table i_beneficiarydetails add ExtraFields JSON after `Others`;
 
alter table i_beneficiarydetails add faceEmbedding longtext after Others;