use db_iemr;
drop procedure if exists Pr_Stockdetail;

DELIMITER $$

CREATE PROCEDURE `Pr_Stockdetail`(
  IN v_FromDate DATE,
  IN v_ToDate   DATE,
  IN v_facilityid INT
)
BEGIN
  -- Use exclusive upper bound to preserve index usage and avoid DATE() on columns
  DECLARE v_ToDateExcl DATETIME;
  SET v_ToDateExcl = DATE_ADD(v_ToDate, INTERVAL 1 DAY);

  SELECT
      ISE.VanSerialNo                               AS ItemStockEntryID,
      ISE.ItemID,
      ISE.FacilityID,
      ISE.BatchNo,

      -- Total receipts up to end of period (inclusive of v_ToDate)
      SUM(CASE WHEN ISE.CreatedDate < v_ToDateExcl
               THEN IFNULL(ISE.Quantity, 0) ELSE 0 END)       AS TotalQuantityReceived,

      -- Unit/expiry are attributes of the entry; use MAX to avoid ONLY_FULL_GROUP_BY issues
      MAX(ISE.UnitCostPrice)                        AS UnitCostPrice,
      MAX(ISE.ExpiryDate)                           AS ExpiryDate,
      MAX(ISE.EntryType)                            AS EntryType,
      MAX(ISE.ProviderServiceMapID)                 AS ProviderServiceMapID,
      MIN(ISE.CreatedDate)                          AS EntryDate,

      -- Opening stock = receipts before FromDate - exits before FromDate + adjustments before FromDate
      (
        SUM(CASE WHEN ISE.CreatedDate < v_FromDate
                 THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
        -
        SUM(CASE WHEN ISEx.CreatedDate < v_FromDate
                 THEN IFNULL(ISEx.Quantity,0) ELSE 0 END)
        +
        SUM(CASE WHEN SAItm.CreatedDate < v_FromDate THEN
                   CASE WHEN SAItm.IsAdded = 1
                        THEN IFNULL(SAItm.AdjustedQuantity,0)
                        ELSE -IFNULL(SAItm.AdjustedQuantity,0)
                   END
                 ELSE 0 END)
      )                                              AS OpeningStock,

      -- Dispensed (exits) during the period
      SUM(CASE WHEN ISEx.CreatedDate >= v_FromDate
                AND ISEx.CreatedDate <  v_ToDateExcl
               THEN IFNULL(ISEx.Quantity,0) ELSE 0 END)       AS QuantityDispensed,

      ITM.ItemName,
      FAC.FacilityName,
      ITMC.ItemCategoryName,

      -- Adjustments during the period
      SUM(CASE WHEN SAItm.CreatedDate >= v_FromDate
                AND SAItm.CreatedDate <  v_ToDateExcl THEN
               CASE WHEN SAItm.IsAdded = 1
                    THEN IFNULL(SAItm.AdjustedQuantity,0)
                    ELSE -IFNULL(SAItm.AdjustedQuantity,0)
               END
               ELSE 0 END)                                     AS AdjustedQuantity_ToDate,

      SUM(CASE WHEN SAItm.CreatedDate >= v_FromDate
                AND SAItm.CreatedDate <  v_ToDateExcl
                AND SAItm.IsAdded = 1
               THEN IFNULL(SAItm.AdjustedQuantity,0) ELSE 0 END) AS AdjustedQuantity_ToDate_Receipt,

      SUM(CASE WHEN SAItm.CreatedDate >= v_FromDate
                AND SAItm.CreatedDate <  v_ToDateExcl
                AND SAItm.IsAdded = 0
               THEN IFNULL(SAItm.AdjustedQuantity,0) ELSE 0 END) AS AdjustedQuantity_ToDate_Issue,

      -- Closing stock at end of period: receipts up to ToDate - exits up to ToDate + adjustments during period
      (
        SUM(CASE WHEN ISE.CreatedDate < v_ToDateExcl
                 THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
        -
        SUM(CASE WHEN ISEx.CreatedDate < v_ToDateExcl
                 THEN IFNULL(ISEx.Quantity,0) ELSE 0 END)
        +
        SUM(CASE WHEN SAItm.CreatedDate >= v_FromDate
                  AND SAItm.CreatedDate <  v_ToDateExcl THEN
               CASE WHEN SAItm.IsAdded = 1
                    THEN IFNULL(SAItm.AdjustedQuantity,0)
                    ELSE -IFNULL(SAItm.AdjustedQuantity,0)
               END
               ELSE 0 END)
      )                                              AS ClosingStock

  FROM db_iemr.t_itemstockentry ISE
  -- Restrict joined rows by date to shrink join domain while keeping predicates sargable
  LEFT JOIN db_iemr.t_itemstockexit ISEx
         ON ISEx.ItemStockEntryID = ISE.VanSerialNo
        AND ISEx.VanID            = ISE.VanID
        AND ISEx.CreatedDate      < v_ToDateExcl
  LEFT JOIN db_iemr.t_saitemmapping SAItm
         ON SAItm.ItemStockEntryID = ISE.VanSerialNo
        AND SAItm.VanID            = ISE.VanID
        AND SAItm.CreatedDate      < v_ToDateExcl
  INNER JOIN db_iemr.m_Item         ITM  ON ISE.ItemID         = ITM.ItemID
  INNER JOIN db_iemr.m_Facility     FAC  ON ISE.FacilityID     = FAC.FacilityID
  INNER JOIN db_iemr.m_ItemCategory ITMC ON ITM.ItemCategoryID = ITMC.ItemCategoryID

  WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
    AND ISE.CreatedDate < v_ToDateExcl  -- keep receipts bounded by report window

  GROUP BY ISE.VanSerialNo, ISE.VanID;

END$$

DELIMITER ;
