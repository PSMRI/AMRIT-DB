use db_iemr;

create index IF NOT EXISTS inx_CallDateFrom on t_mctsoutboundcalls(CallDateFrom);

create index IF NOT EXISTS inx_CallDateTo  on t_mctsoutboundcalls(CallDateTo);

create index IF NOT EXISTS inx_preferredlanguage  on t_mothervalidrecord(preferredlanguage);

create index IF NOT EXISTS inx_preferredlanguage on t_childvaliddata(preferredlanguage);


create index IF NOT EXISTS inx_villageid on i_ben_flow_outreach(villageID);

create index IF NOT EXISTS inx_modified_date on i_ben_flow_outreach(modified_date);




