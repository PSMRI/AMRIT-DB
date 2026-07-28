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
-- Fix: divide by NULLIF(v_totalcount,0) instead. When v_totalcount is 0 this
-- evaluates the division to NULL (dividing by NULL never triggers the
-- division-by-zero check) rather than erroring, and each procedure's existing
-- null-to-zero handling (an "update ... where ServiceProvidedRatio is null"
-- for Gender/Language/SexualOrientation, or the outer "Ifnull(Round(...),0)"
-- for AgegroupDistribution) already turns that NULL into 0.

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
declare v_totalcount int(11) default 0;

Drop Temporary table if exists Temp_Output;
Drop Temporary table if exists Temp_RawData;
Drop Temporary table if exists Temp_Agegroup;

create temporary table temp_agegroup(AgegroupID int,Agegroup varchar(100),MinAge Int,MaxAge Int,IsReq Bit Default 1);

 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(6,'All',0,150);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(1,'0 To 15',0,15);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(2,'15 To 24',15,24);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(3,'25 To 39',25,39);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(4,'40 To 59',40,59);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(5,'59 To 150',59,150);

 If v_minage is not null and v_maxage Is not null Then
 Update temp_agegroup Set Isreq = 0 Where minage <> v_minage and maxage <> v_maxage and AgegroupID <> 6;
 End If;

Set v_minage = Case When v_minage Is null then 0 Else v_minage End;
Set v_maxage = Case When v_maxage Is null then 150 Else v_maxage End;


Create temporary table Temp_RawData as
Select
  AgeGroupID,MinAge,MaxAge
From
(
Select
  AgegroupID,
  Case
    When AgegroupID = 1 Then 0
        When AgegroupID = 2 Then 15
        When AgegroupID = 3 Then 25
        When AgegroupID = 4 Then 40
        When AgegroupID = 5 Then 59
  End MinAge,
  Case
    When AgegroupID = 1 Then 15
        When AgegroupID = 2 Then 24
        When AgegroupID = 3 Then 39
        When AgegroupID = 4 Then 59
        When AgegroupID = 5 Then 150
  End MaxAge
From
(
  Select
    Case when TIMESTAMPDIFF(year,DOB, now()) < 15 then 1
      when TIMESTAMPDIFF(year,DOB, now()) between 15 and 24 then 2
      when TIMESTAMPDIFF(year,DOB, now()) between 25 and 39 then 3
      when TIMESTAMPDIFF(year,DOB, now()) between 40 and 59 then 4
      else 5
    End AgegroupID
  From db_reporting.fact_1097callsummary Cal
  inner join db_reporting.dim_1097beneficiary Ben on Cal.beneficiaryregid=Ben.beneficiaryregid
  where
    Cal.createddate between v_starttime and v_endtime
    and Ben.permstate=ifnull(v_statename,Ben.permstate)
    and Ben.permdistrict=ifnull(v_districtname,Ben.permdistrict)
    /*and Ben.Agegroup=ifnull(v_Agegroup,Ben.Agegroup)*/
    and Cal.ProviderServiceMapID=ifnull(v_psmrid,Cal.ProviderServiceMapID)
)OBJ)OBJ
Where
  MinAge >= v_minage
  And MaxAge <= v_maxage;

Select Count(1) Into v_totalcount From Temp_RawData;

Create Temporary Table Temp_Output
Select AgegroupID,MinAge,MaxAge,(Ifnull(Count(1),0) / NULLIF(v_totalcount,0)) * 100.0 ServiceProvidedRatio,Count(1) Count
From Temp_RawData
Group by
  Concat(MinAge,' To ',MaxAge);

Insert into Temp_Output
(AgegroupID,MinAge,MaxAge,ServiceProvidedRatio,Count)
Select 6 AgegroupID,0,150,(Ifnull(Count(1),0) / NULLIF(v_totalcount,0) ) * 100.0 ServiceProvidedRatio,Count(1) Count
From Temp_RawData;

Select
  Temp_Agegroup.Agegroup,
    Temp_Agegroup.MinAge minage,
    Temp_Agegroup.MaxAge maxage,
    Ifnull(Round(Temp_Output.ServiceProvidedRatio,2),0)ServiceProvidedRatio,
    ifnull(Temp_Output.Count,0) count
from Temp_Agegroup
Left join Temp_Output on Temp_Output.AgeGroupID = Temp_Agegroup.AgeGroupID
Where
  IsReq = 1
Order by
  Temp_Agegroup.AgeGroupID;

Drop Temporary table if exists Temp_Output;
Drop Temporary table if exists Temp_RawData;
Drop Temporary table if exists Temp_Agegroup;

end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097GenderDistribution`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097GenderDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_Gender varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.Gender is not null;

 if (v_Gender is null) then
 create temporary table temp1 as
 select g.GenderName,((ifnull(count,0))*100/NULLIF(v_totalcount,0))
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_gender g left join (
 select t2.Gender,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.Gender)t on t.Gender=g.gendername
 group by g.GenderName;

 set sql_safe_updates=0;

 insert into temp1(Gendername) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where Gendername='All';

 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp1 set `count`=0 where `count` is null;

 select Gendername,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;


 drop temporary table temp1;

 end if;

 if (v_Gender is not null) then
 create temporary table temp2 as
 select g.GenderName,((ifnull(count,0))*100/NULLIF(v_totalcount,0))
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_gender g left join (
 select t2.Gender,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.Gender)t on t.Gender=g.gendername
 where g.gendername=v_gender
 group by g.GenderName;


 insert into temp2(Gendername) values ('All');

 set sql_safe_updates=0;

 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where Gendername='All';

 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp2 set `count`=0 where `count` is null;

 select Gendername,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;


 drop temporary table temp2;

 end if;

 end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097Sexualorientation`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097Sexualorientation`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_SexualOrientationType varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.SexualOrientationType is not null;

 if (v_SexualOrientationType is null) then
 create temporary table temp1 as
 select g.SexualOrientation,((ifnull(count,0))*100/NULLIF(v_totalcount,0)) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_sexualorientation g left join (
 select t2.SexualOrientationType,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.SexualOrientationType)t on t.SexualOrientationType=g.SexualOrientation
 group by g.SexualOrientation;

 set sql_safe_updates=0;

 insert into temp1(SexualOrientation) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where SexualOrientation='All';

 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp1 set `count`=0 where `count` is null;

 select SexualOrientation,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;


 drop temporary table temp1;

 end if;

 if (v_SexualOrientationType is not null) then
 create temporary table temp2 as
 select g.SexualOrientation,((ifnull(count,0))*100/NULLIF(v_totalcount,0)) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_sexualorientation g left join (
 select t2.SexualOrientationType,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.SexualOrientationType)t on t.SexualOrientationType=g.SexualOrientation
 where g.SexualOrientation=v_SexualOrientationType
 group by g.SexualOrientation;


 insert into temp2(SexualOrientation) values ('All');

 set sql_safe_updates=0;

 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where SexualOrientation='All';

 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp2 set `count`=0 where `count` is null;

 select SexualOrientation,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;


 drop temporary table temp2;

 end if;

 end ;;

DELIMITER ;

DROP PROCEDURE IF EXISTS `Pr_1097LanguageDistribution`;

DELIMITER ;;

CREATE PROCEDURE `Pr_1097LanguageDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_language varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.preferredLanguage is not null;

 if (v_Language is null) then
 create temporary table temp1 as
 select g.LanguageName,((ifnull(count,0))*100/NULLIF(v_totalcount,0))
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_language g left join (
 select t2.preferredLanguage,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.preferredLanguage)t on t.preferredLanguage=g.LanguageName
 group by g.LanguageName;

 set sql_safe_updates=0;

 insert into temp1(LanguageName) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where LanguageName='All';

 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp1 set `count`=0 where `count` is null;

 select LanguageName,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;


 drop temporary table temp1;

 end if;

 if (v_Language is not null) then
 create temporary table temp2 as
 select g.LanguageName,((ifnull(count,0))*100/NULLIF(v_totalcount,0)) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_language g left join (
 select t2.preferredLanguage,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.preferredLanguage)t on t.preferredLanguage=g.LanguageName
 where g.LanguageName=v_Language
 group by g.LanguageName;


 insert into temp2(LanguageName) values ('All');

 set sql_safe_updates=0;

 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where LanguageName='All';

 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;

 update temp2 set `count`=0 where `count` is null;

 select LanguageName,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;


 drop temporary table temp2;

 end if;

 end ;;

DELIMITER ;
