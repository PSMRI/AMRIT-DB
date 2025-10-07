




alter table t_pmsma
  add column visitDate datetime null,
  add column visitNo smallint null,
  add column anyOtherHighRiskCondition varchar(100) null;