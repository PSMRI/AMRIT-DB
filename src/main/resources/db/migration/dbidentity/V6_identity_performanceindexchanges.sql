
use db_identity;

create index inx_permvillageid on i_beneficiaryaddress(permvillageid);

create index inx_Lastmoddate on i_beneficiaryaddress(Lastmoddate);


create index inx_Lastmoddate on i_beneficiarymapping(Lastmoddate);

create index inx_Lastmoddate on i_beneficiarycontacts(Lastmoddate);