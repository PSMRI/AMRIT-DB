

use db_identity;

-- make ALTER add operations idempotent: only add columns if they do NOT already exist
alter table i_beneficiarydetails add column if not exists ExtraFields JSON after `Others`;
 
alter table i_beneficiarydetails add column if not exists faceEmbedding longtext after `Others`;
