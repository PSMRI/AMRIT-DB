use db_iemr;

create index  inx_CallDateFrom on t_mctsoutboundcalls(CallDateFrom);

create index  inx_CallDateTo  on t_mctsoutboundcalls(CallDateTo);

create index  inx_preferredlanguage  on t_mothervalidrecord(preferredlanguage);

create index  inx_preferredlanguage on t_childvaliddata(preferredlanguage);


create index  inx_villageid on i_ben_flow_outreach(villageID);

create index  inx_modified_date on i_ben_flow_outreach(modified_date);




