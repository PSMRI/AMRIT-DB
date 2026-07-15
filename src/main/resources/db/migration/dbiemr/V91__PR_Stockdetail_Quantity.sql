use db_iemr;
drop procedure if exists pr_Stockdetail;

DELIMITER $$

-- Fix for inflated quantities in the inventory stock-detail report.
-- Root cause: pr_Stockdetail LEFT JOINed two independent one-to-many child
-- tables (t_itemstockexit and t_SAItemMapping) onto t_itemstockentry and then
-- aggregated. That produces a Cartesian product per entry (#exits x #adjustments),
-- so SUM(ISE.Quantity) (TotalQuantityReceived) and the exit/adjustment sums were
-- multiplied. Fix: pre-aggregate each child table to one row per
-- (ItemStockEntryID, VanID) BEFORE joining, so every join is 1:1 and nothing is
-- double-counted. Column order/aliases are unchanged (the report reads them
-- positionally).
CREATE PROCEDURE `pr_Stockdetail`(
  IN v_FromDate DATE,
  IN v_ToDate   DATE,
  IN v_facilityid INT
)
BEGIN
  DECLARE v_ToDateExcl DATETIME;
  SET v_ToDateExcl = DATE_ADD(v_ToDate, INTERVAL 1 DAY);

  SELECT
      ISE.VanSerialNo                               AS ItemStockEntryID,
      ISE.ItemID,
      ISE.FacilityID,
      ISE.BatchNo,

      -- Received is a parent attribute -> no join can duplicate it now
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

      -- Closing = receipts up to ToDate - exits up to ToDate + adjustments during period
      (
        IFNULL(ISE.Quantity,0)
        - (IFNULL(EX.ExitBeforeFrom,0) + IFNULL(EX.ExitInPeriod,0))
        + IFNULL(ADJ.AdjInPeriodSigned,0)
      )                                             AS ClosingStock

  FROM db_iemr.t_itemstockentry ISE

  -- Pre-aggregated exits: one row per (ItemStockEntryID, VanID)
  LEFT JOIN (
      SELECT
          x.ItemStockEntryID,
          x.VanID,
          SUM(CASE WHEN x.CreatedDate < v_FromDate
                   THEN IFNULL(x.Quantity,0) ELSE 0 END)                       AS ExitBeforeFrom,
          SUM(CASE WHEN x.CreatedDate >= v_FromDate AND x.CreatedDate < v_ToDateExcl
                   THEN IFNULL(x.Quantity,0) ELSE 0 END)                       AS ExitInPeriod
      FROM db_iemr.t_itemstockexit x
      WHERE x.CreatedDate < v_ToDateExcl
        AND IFNULL(x.Deleted, 0) = 0
      GROUP BY x.ItemStockEntryID, x.VanID
  ) EX  ON EX.ItemStockEntryID = ISE.VanSerialNo
       AND EX.VanID            = ISE.VanID

  -- Pre-aggregated adjustments: one row per (ItemStockEntryID, VanID)
  LEFT JOIN (
      SELECT
          s.ItemStockEntryID,
          s.VanID,
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
      GROUP BY s.ItemStockEntryID, s.VanID
  ) ADJ ON ADJ.ItemStockEntryID = ISE.VanSerialNo
       AND ADJ.VanID            = ISE.VanID

  INNER JOIN db_iemr.m_Item         ITM  ON ISE.ItemID         = ITM.ItemID
  INNER JOIN db_iemr.m_Facility     FAC  ON ISE.FacilityID     = FAC.FacilityID
  INNER JOIN db_iemr.m_ItemCategory ITMC ON ITM.ItemCategoryID = ITMC.ItemCategoryID

  WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
    AND ISE.CreatedDate < v_ToDateExcl
    AND IFNULL(ISE.Deleted, 0) = 0;

END$$

DELIMITER ;
