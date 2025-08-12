

create index inx_address_permvillageid on i_beneficiaryaddress(permvillageid);

create index inx_address_Lastmoddate on i_beneficiaryaddress(Lastmoddate);


create index inx_mapping_Lastmoddate on i_beneficiarymapping(Lastmoddate);

create index inx_contacts_Lastmoddate on i_beneficiarycontacts(Lastmoddate);