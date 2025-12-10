ALTER TABLE db_iemr.t_itemstockentry 
  ADD INDEX idx_itemstockentry_created (CreatedDate),
  ADD INDEX idx_itemstockentry_item (ItemID, FacilityID);

ALTER TABLE db_iemr.t_itemstockexit 
  ADD INDEX idx_itemstockexit_entry_created (ItemStockEntryID, CreatedDate);

ALTER TABLE db_iemr.t_saitemmapping 
  ADD INDEX idx_saitemmapping_entry_created (ItemStockEntryID, CreatedDate);

ALTER TABLE db_iemr.t_itemstockentry 
  ADD INDEX idx_itemstockentry_vanserial_vanid (VanSerialNo, VanID);

ALTER TABLE db_iemr.t_itemstockexit 
  ADD INDEX idx_itemstockexit_entry_vanid_created (ItemStockEntryID, VanID, CreatedDate);

ALTER TABLE db_iemr.t_saitemmapping 
  ADD INDEX idx_saitemmapping_entry_vanid_created (ItemStockEntryID, VanID, CreatedDate);

ALTER TABLE db_iemr.t_itemstockentry 
  ADD INDEX idx_itemstockentry_fac_created (FacilityID, CreatedDate);
