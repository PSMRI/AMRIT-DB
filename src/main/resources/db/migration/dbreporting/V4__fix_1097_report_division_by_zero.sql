-- Fix: 1097 Age Group, Gender, Language and Sexual Orientation distribution
--   reports fail with "Data truncation: Division by 0" when no beneficiary
--   records match the requested filters (date range / state / district /
--   providerServiceMapID).
--
-- Root cause: all four procedures compute v_totalcount as the count of
-- matching rows, then divide by it directly (`... / v_totalcount`) to derive
-- ServiceProvidedRatio. When v_totalcount is 0, MySQL's strict sql_mode
-- (ERROR_FOR_DIVISION_BY_ZERO) raises a division-by-zero error instead of a
-- warning, which the JDBC driver surfaces as a SQLException and aborts the
-- whole report request.
--
-- Fix: divide by NULLIF(v_totalcount,0) instead, so a zero total yields NULL
-- (no error) which is then coalesced back to 0 via IFNULL.
--
-- Also rewritten to drop temporary tables entirely (CTEs + UNION ALL for the
-- "All" rollup row instead of INSERT/UPDATE against a temp table), which
-- removes the DROP/CREATE TEMPORARY TABLE overhead and the sql_safe_updates
-- workaround the temp-table version needed.

DROP PROCEDURE IF EXISTS `Pr_1097AgegroupDistribution`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097AgegroupDistribution`(
v_starttime datetime,
v_endtime datetime,
v_statename varchar(100),
v_districtname varchar(100),
v_minage int(11),
v_maxage int(11),
v_psmrid int(11)
)
Begin
declare v_minage_eff int(11) default case when v_minage is null then 0 else v_minage end;
declare v_maxage_eff int(11) default case when v_maxage is null then 150 else v_maxage end;

with raw_data as (
  select AgegroupID, MinAge, MaxAge
  from (
    select
      AgegroupID,
      Case AgegroupID When 1 then 0 When 2 then 15 When 3 then 25 When 4 then 40 When 5 then 59 End MinAge,
      Case AgegroupID When 1 then 15 When 2 then 24 When 3 then 39 When 4 then 59 When 5 then 150 End MaxAge
    from (
      select
        Case when TIMESTAMPDIFF(year,DOB, now()) < 15 then 1
             when TIMESTAMPDIFF(year,DOB, now()) between 15 and 24 then 2
             when TIMESTAMPDIFF(year,DOB, now()) between 25 and 39 then 3
             when TIMESTAMPDIFF(year,DOB, now()) between 40 and 59 then 4
             else 5
        End AgegroupID
      from db_reporting.fact_1097callsummary Cal
      inner join db_reporting.dim_1097beneficiary Ben on Cal.beneficiaryregid=Ben.beneficiaryregid
      where Cal.createddate between v_starttime and v_endtime
        and Ben.permstate=ifnull(v_statename,Ben.permstate)
        and Ben.permdistrict=ifnull(v_districtname,Ben.permdistrict)
        and Cal.ProviderServiceMapID=ifnull(v_psmrid,Cal.ProviderServiceMapID)
    ) base
  ) bucketed
  where MinAge >= v_minage_eff and MaxAge <= v_maxage_eff
),
agegroup_master as (
  select 6 AgegroupID, 'All' Agegroup, 0 MinAge, 150 MaxAge
  union all select 1,'0 To 15',0,15
  union all select 2,'15 To 24',15,24
  union all select 3,'25 To 39',25,39
  union all select 4,'40 To 59',40,59
  union all select 5,'59 To 150',59,150
),
bucket_output as (
  select AgegroupID, count(1) cnt from raw_data group by AgegroupID
  union all
  select 6, count(1) from raw_data
)
select
  m.Agegroup,
  m.MinAge minage,
  m.MaxAge maxage,
  ifnull(round((o.cnt / NULLIF((select count(1) from raw_data),0)) * 100.0, 2), 0) ServiceProvidedRatio,
  ifnull(o.cnt, 0) count
from agegroup_master m
left join bucket_output o on o.AgegroupID = m.AgegroupID
where m.AgegroupID = 6
   or not (v_minage is not null and v_maxage is not null and m.MinAge <> v_minage and m.MaxAge <> v_maxage)
order by m.AgegroupID;

end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097GenderDistribution`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097GenderDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_Gender varchar(100),v_psmrid int(11))
begin
 with matched as (
   select t2.Gender
   from db_reporting.fact_1097callsummary t1
   inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
   where t1.createddate between v_starttime and v_endtime
     and t2.permstate=ifnull(v_statename,t2.permstate)
     and t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
     and t2.Gender=ifnull(v_Gender,t2.Gender)
     and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
     and t2.Gender is not null
 ),
 per_gender as (
   select g.GenderName, count(m.Gender) cnt
   from db_iemr.m_gender g
   left join matched m on m.Gender = g.gendername
   where v_Gender is null or g.gendername = v_Gender
   group by g.GenderName
 )
 select GenderName,
        cast(ifnull(cnt*100/NULLIF((select count(1) from matched),0),0) as unsigned) ServiceProvidedRatio,
        cast(cnt as unsigned) count
 from per_gender

 union all

 select 'All',
        cast(ifnull(sum(cnt)*100/NULLIF((select count(1) from matched),0),0) as unsigned),
        cast(ifnull(sum(cnt),0) as unsigned)
 from per_gender;

end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097Sexualorientation`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097Sexualorientation`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_SexualOrientationType varchar(100),v_psmrid int(11))
begin
 with matched as (
   select t2.SexualOrientationType
   from db_reporting.fact_1097callsummary t1
   inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
   where t1.createddate between v_starttime and v_endtime
     and t2.permstate=ifnull(v_statename,t2.permstate)
     and t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
     and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
     and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
     and t2.SexualOrientationType is not null
 ),
 per_orientation as (
   select g.SexualOrientation, count(m.SexualOrientationType) cnt
   from db_iemr.m_sexualorientation g
   left join matched m on m.SexualOrientationType = g.SexualOrientation
   where v_SexualOrientationType is null or g.SexualOrientation = v_SexualOrientationType
   group by g.SexualOrientation
 )
 select SexualOrientation,
        cast(ifnull(cnt*100/NULLIF((select count(1) from matched),0),0) as unsigned) ServiceProvidedRatio,
        cast(cnt as unsigned) count
 from per_orientation

 union all

 select 'All',
        cast(ifnull(sum(cnt)*100/NULLIF((select count(1) from matched),0),0) as unsigned),
        cast(ifnull(sum(cnt),0) as unsigned)
 from per_orientation;

end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097LanguageDistribution`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097LanguageDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_language varchar(100),v_psmrid int(11))
begin
 with matched as (
   select t2.preferredLanguage
   from db_reporting.fact_1097callsummary t1
   inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
   where t1.createddate between v_starttime and v_endtime
     and t2.permstate=ifnull(v_statename,t2.permstate)
     and t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
     and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
     and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
     and t2.preferredLanguage is not null
 ),
 per_language as (
   select g.LanguageName, count(m.preferredLanguage) cnt
   from db_iemr.m_language g
   left join matched m on m.preferredLanguage = g.LanguageName
   where v_Language is null or g.LanguageName = v_Language
   group by g.LanguageName
 )
 select LanguageName,
        cast(ifnull(cnt*100/NULLIF((select count(1) from matched),0),0) as unsigned) ServiceProvidedRatio,
        cast(cnt as unsigned) count
 from per_language

 union all

 select 'All',
        cast(ifnull(sum(cnt)*100/NULLIF((select count(1) from matched),0),0) as unsigned),
        cast(ifnull(sum(cnt),0) as unsigned)
 from per_language;

end ;;

DELIMITER ;
