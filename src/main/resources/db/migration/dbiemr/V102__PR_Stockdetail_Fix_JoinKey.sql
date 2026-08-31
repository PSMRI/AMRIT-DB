use db_iemr;
drop procedure if exists pr_Stockdetail;

DELIMITER $$

CREATE PROCEDURE `pr_Stockdetail`(
  IN v_FromDate DATE,
  IN v_ToDate   DATE,
  IN v_facilityid INT
)
BEGIN
  DECLARE v_ToDateExcl DATETIME;
  SET v_ToDateExcl = DATE_ADD(v_ToDate, INTERVAL 1 DAY);

  SELECT
      ISE.ItemStockEntryID                          AS ItemStockEntryID,
      ISE.ItemID,
      ISE.FacilityID,
      ISE.BatchNo,

      IFNULL(ISE.Quantity, 0)                       AS TotalQuantityReceived,

      ISE.UnitCostPrice,
      ISE.ExpiryDate,
      ISE.EntryType,
      ISE.ProviderServiceMapID,
      ISE.CreatedDate                               AS EntryDate,

      -- Opening = receipts before FromDate - exits before FromDate + adjustments before FromDate
      (
        (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
        - IFNULL(EX.ExitBeforeFrom, 0)
        + IFNULL(ADJ.AdjBeforeFrom, 0)
      )                                             AS OpeningStock,

      -- Dispensed (exits) during the period
      IFNULL(EX.ExitInPeriod, 0)                    AS QuantityDispensed,

      ITM.ItemName,
      FAC.FacilityName,
      ITMC.ItemCategoryName,

      -- Adjustments during the period
      IFNULL(ADJ.AdjInPeriodSigned, 0)              AS AdjustedQuantity_ToDate,
      IFNULL(ADJ.AdjInPeriodReceipt, 0)             AS AdjustedQuantity_ToDate_Receipt,
      IFNULL(ADJ.AdjInPeriodIssue, 0)               AS AdjustedQuantity_ToDate_Issue,

      -- Closing = live running balance the app itself already trusts
      -- (t_itemstockentry.QuantityInHand, same source v_drugforprescription
      -- uses for real-time availability), not reconstructed from
      -- t_itemstockexit/t_SAItemMapping history. Reconstructing from just
      -- those two tables missed other stock-reducing movements (transfers,
      -- wastage, write-offs, corrections) that already update
      -- QuantityInHand directly, so it could show phantom leftover stock
      -- for batches the app itself reports as fully depleted.
      GREATEST(IFNULL(ISE.QuantityInHand, 0), 0)   AS ClosingStock

  FROM db_iemr.t_itemstockentry ISE

  -- Fixed: t_itemstockexit.ItemStockEntryID is a real FK to
  -- t_itemstockentry.ItemStockEntryID (the PK). It must not be matched
  -- against VanSerialNo, which is a separate MMU/van-sync field that is
  -- NULL for ordinary facility stock entries - that mismatch silently
  -- dropped every real exit, so dispensed/removed stock kept showing as
  -- still available. The VanID equality was removed for the same reason
  -- (NULL = NULL never matches in SQL, so it broke the join further for
  -- entries with no van).
  LEFT JOIN (
      SELECT
          x.ItemStockEntryID,
          SUM(CASE WHEN x.CreatedDate < v_FromDate
                   THEN IFNULL(x.Quantity,0) ELSE 0 END)                       AS ExitBeforeFrom,
          SUM(CASE WHEN x.CreatedDate >= v_FromDate AND x.CreatedDate < v_ToDateExcl
                   THEN IFNULL(x.Quantity,0) ELSE 0 END)                       AS ExitInPeriod
      FROM db_iemr.t_itemstockexit x
      WHERE x.CreatedDate < v_ToDateExcl
        AND IFNULL(x.Deleted, 0) = 0
      GROUP BY x.ItemStockEntryID
  ) EX  ON EX.ItemStockEntryID = ISE.ItemStockEntryID

  -- Fixed: same issue as above - t_SAItemMapping.ItemStockEntryID is a real
  -- FK to t_itemstockentry.ItemStockEntryID, not to VanSerialNo.
  LEFT JOIN (
      SELECT
          s.ItemStockEntryID,
          SUM(CASE WHEN s.CreatedDate < v_FromDate THEN
                     CASE WHEN s.IsAdded = 1 THEN IFNULL(s.AdjustedQuantity,0)
                          ELSE -IFNULL(s.AdjustedQuantity,0) END
                   ELSE 0 END)                                                 AS AdjBeforeFrom,
          SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl THEN
                     CASE WHEN s.IsAdded = 1 THEN IFNULL(s.AdjustedQuantity,0)
                          ELSE -IFNULL(s.AdjustedQuantity,0) END
                   ELSE 0 END)                                                 AS AdjInPeriodSigned,
          SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 1
                   THEN IFNULL(s.AdjustedQuantity,0) ELSE 0 END)               AS AdjInPeriodReceipt,
          SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 0
                   THEN IFNULL(s.AdjustedQuantity,0) ELSE 0 END)               AS AdjInPeriodIssue
      FROM db_iemr.t_SAItemMapping s
      WHERE s.CreatedDate < v_ToDateExcl
        AND IFNULL(s.Deleted, 0) = 0
      GROUP BY s.ItemStockEntryID
  ) ADJ ON ADJ.ItemStockEntryID = ISE.ItemStockEntryID

  INNER JOIN db_iemr.m_Item         ITM  ON ISE.ItemID         = ITM.ItemID
  INNER JOIN db_iemr.m_Facility     FAC  ON ISE.FacilityID     = FAC.FacilityID
  INNER JOIN db_iemr.m_ItemCategory ITMC ON ITM.ItemCategoryID = ITMC.ItemCategoryID

  WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
    AND ISE.CreatedDate < v_ToDateExcl
    AND IFNULL(ISE.Deleted, 0) = 0;

END$$

DELIMITER ;
