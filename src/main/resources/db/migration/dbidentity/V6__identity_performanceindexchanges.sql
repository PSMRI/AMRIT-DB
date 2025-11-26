

create index if not EXISTS inx_address_permvillageid on i_beneficiaryaddress(permvillageid);

create index if not EXISTS inx_address_Lastmoddate on i_beneficiaryaddress(Lastmoddate);


create index if not EXISTS inx_mapping_Lastmoddate on i_beneficiarymapping(Lastmoddate);

create index if not EXISTS inx_contacts_Lastmoddate on i_beneficiarycontacts(Lastmoddate);