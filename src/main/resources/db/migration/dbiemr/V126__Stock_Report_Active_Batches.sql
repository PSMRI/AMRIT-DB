  use db_iemr;

  -- Stock detail / summary reports (daily, monthly, yearly).

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
        ROW_NUMBER() OVER (ORDER BY S.FacilityName, S.ItemName, S.BatchNo) AS `Sl No`,
        DATE_FORMAT(v_ToDate, '%d-%m-%Y')            AS `Date`,
        S.EntryType                                   AS `EntryType`,
        S.FacilityName                                AS `Facility Name`,
        S.ItemFormName                                AS `item form`,
        S.ItemName                                    AS `Item Name`,
        S.Strength                                    AS `item strength`,
        S.UOMName                                     AS `UOM`,
        S.ItemCategoryName                            AS `Item Category`,
        S.BatchNo                                     AS `Batch No`,
        S.UnitCostPrice                               AS `Unit Cost Price`,
        DATE_FORMAT(S.ExpiryDate, '%d-%m-%Y')         AS `Expiry Date`,
        S.BatchQuantity                               AS `Total Quantity Received(Batch wise)`,
        S.OpeningStock                                AS `Opening Stock`,
        S.ExitInPeriod                                AS `Dispensed Quantity`,
        S.AdjInPeriodReceipt                          AS `Adjustment Receipt`,
        S.AdjInPeriodIssue                            AS `Adjustment Issue`,
        GREATEST(S.OpeningStock + S.ReceivedInPeriod - S.ExitInPeriod + S.AdjInPeriodSigned, 0) AS `Closing Stock`,
        DATE_FORMAT(S.CreatedDate, '%d-%m-%Y')        AS `Item Entered Date`
    FROM (
        SELECT
            B.*,
            GREATEST(B.ReceivedBefore - B.ExitBeforeFrom + B.AdjBeforeFrom, 0) AS OpeningStock
        FROM (
            SELECT
                ISE.EntryType,
                ISE.BatchNo,
                ISE.UnitCostPrice,
                ISE.ExpiryDate,
                ISE.CreatedDate,
                FAC.FacilityName,
                ITMF.ItemFormName,
                ITM.ItemName,
                ITM.Strength,
                UOM.UOMName,
                ITMC.ItemCategoryName,
                IFNULL(ISE.Quantity, 0) AS BatchQuantity,
                (CASE WHEN ISE.CreatedDate <  v_FromDate THEN GREATEST(IFNULL(ISE.Quantity,0),0) ELSE 0 END) AS ReceivedBefore,
                (CASE WHEN ISE.CreatedDate >= v_FromDate THEN GREATEST(IFNULL(ISE.Quantity,0),0) ELSE 0 END) AS ReceivedInPeriod,
                IFNULL(EX.ExitBeforeFrom, 0)          AS ExitBeforeFrom,
                IFNULL(EX.ExitInPeriod, 0)            AS ExitInPeriod,
                IFNULL(ADJ.AdjBeforeFrom, 0)          AS AdjBeforeFrom,
                IFNULL(ADJ.AdjInPeriodSigned, 0)      AS AdjInPeriodSigned,
                IFNULL(ADJ.AdjInPeriodReceipt, 0)     AS AdjInPeriodReceipt,
                IFNULL(ADJ.AdjInPeriodIssue, 0)       AS AdjInPeriodIssue
            FROM db_iemr.t_itemstockentry ISE

            LEFT JOIN (
                SELECT
                    x.ItemStockEntryID,
                    SUM(CASE WHEN x.CreatedDate < v_FromDate
                            THEN GREATEST(IFNULL(x.Quantity,0),0) ELSE 0 END)       AS ExitBeforeFrom,
                    SUM(CASE WHEN x.CreatedDate >= v_FromDate AND x.CreatedDate < v_ToDateExcl
                            THEN GREATEST(IFNULL(x.Quantity,0),0) ELSE 0 END)       AS ExitInPeriod
                FROM db_iemr.t_itemstockexit x
                INNER JOIN db_iemr.t_itemstockentry e ON e.ItemStockEntryID = x.ItemStockEntryID
                WHERE x.CreatedDate < v_ToDateExcl
                  AND IFNULL(x.Deleted, 0) = 0
                  AND (v_facilityid IS NULL OR e.FacilityID = v_facilityid)
                GROUP BY x.ItemStockEntryID
            ) EX  ON EX.ItemStockEntryID = ISE.ItemStockEntryID

            LEFT JOIN (
                SELECT
                    s.ItemStockEntryID,
                    SUM(CASE WHEN s.CreatedDate < v_FromDate THEN
                              CASE WHEN s.IsAdded = 1 THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0)
                                    ELSE -GREATEST(IFNULL(s.AdjustedQuantity,0),0) END
                            ELSE 0 END)                                             AS AdjBeforeFrom,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl THEN
                              CASE WHEN s.IsAdded = 1 THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0)
                                    ELSE -GREATEST(IFNULL(s.AdjustedQuantity,0),0) END
                            ELSE 0 END)                                             AS AdjInPeriodSigned,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 1
                            THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0) ELSE 0 END) AS AdjInPeriodReceipt,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 0
                            THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0) ELSE 0 END) AS AdjInPeriodIssue
                FROM db_iemr.t_SAItemMapping s
                INNER JOIN db_iemr.t_itemstockentry e ON e.ItemStockEntryID = s.ItemStockEntryID
                WHERE s.CreatedDate < v_ToDateExcl
                  AND IFNULL(s.Deleted, 0) = 0
                  AND (v_facilityid IS NULL OR e.FacilityID = v_facilityid)
                GROUP BY s.ItemStockEntryID
            ) ADJ ON ADJ.ItemStockEntryID = ISE.ItemStockEntryID

            INNER JOIN db_iemr.m_Item         ITM  ON ISE.ItemID         = ITM.ItemID
            INNER JOIN db_iemr.m_Facility     FAC  ON ISE.FacilityID     = FAC.FacilityID
            INNER JOIN db_iemr.m_ItemCategory ITMC ON ITM.ItemCategoryID = ITMC.ItemCategoryID
            LEFT  JOIN db_iemr.m_itemform     ITMF ON ITM.ItemFormID     = ITMF.ItemFormID
            LEFT  JOIN db_iemr.m_uom          UOM  ON ITM.UOMID          = UOM.UOMID

            WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
              AND IFNULL(FAC.Deleted, 0) = 0
              AND ISE.CreatedDate < v_ToDateExcl
              AND IFNULL(ISE.Deleted, 0) = 0
              -- Same batches as the stock screens (itemBatchPartialSearch):
              -- stock in hand, item mapped to the facility and not deleted.
              AND IFNULL(ISE.QuantityInHand, 0) > 0
              AND IFNULL(ITM.Deleted, 0) = 0
              AND EXISTS (
                    SELECT 1 FROM db_iemr.m_itemfacilitymapping MIF
                    WHERE MIF.ItemID = ISE.ItemID
                      AND MIF.FacilityID = ISE.FacilityID
                      AND IFNULL(MIF.Deleted, 0) = 0
                  )
        ) B
    ) S
    ORDER BY S.FacilityName, S.ItemName, S.BatchNo;

  END$$

  DELIMITER ;

  drop procedure if exists Pr_Stocksummary;

  DELIMITER $$

  CREATE PROCEDURE `Pr_Stocksummary`(
    IN v_FromDate DATE,
    IN v_ToDate   DATE,
    IN v_facilityid INT
  )
  BEGIN
    DECLARE v_ToDateExcl DATETIME;
    SET v_ToDateExcl = DATE_ADD(v_ToDate, INTERVAL 1 DAY);

    SELECT
        S.ItemID,
        S.FacilityID,
        S.ItemName,
        S.FacilityName,
        S.ItemCategoryName,
        SUM(S.BatchQuantity)                          AS TotalQuantityReceived,
        SUM(S.OpeningStock)                           AS OpeningStock,
        0                                             AS AdjustedQuantity_FromDate,
        SUM(S.ExitInPeriod)                           AS QuantityDispanced,
        SUM(S.AdjInPeriodSigned)                      AS AdjustedQuantity_ToDate,
        SUM(S.AdjInPeriodReceipt)                     AS AdjustedQuantity_ToDate_Receipt,
        SUM(S.AdjInPeriodIssue)                       AS AdjustedQuantity_ToDate_Issue,
        SUM(GREATEST(S.OpeningStock + S.ReceivedInPeriod - S.ExitInPeriod + S.AdjInPeriodSigned, 0)) AS ClosingStock
    FROM (
        SELECT
            B.*,
            GREATEST(B.ReceivedBefore - B.ExitBeforeFrom + B.AdjBeforeFrom, 0) AS OpeningStock
        FROM (
            SELECT
                ISE.ItemID,
                ISE.FacilityID,
                FAC.FacilityName,
                ITM.ItemName,
                ITMC.ItemCategoryName,
                IFNULL(ISE.Quantity, 0) AS BatchQuantity,
                (CASE WHEN ISE.CreatedDate <  v_FromDate THEN GREATEST(IFNULL(ISE.Quantity,0),0) ELSE 0 END) AS ReceivedBefore,
                (CASE WHEN ISE.CreatedDate >= v_FromDate THEN GREATEST(IFNULL(ISE.Quantity,0),0) ELSE 0 END) AS ReceivedInPeriod,
                IFNULL(EX.ExitBeforeFrom, 0)          AS ExitBeforeFrom,
                IFNULL(EX.ExitInPeriod, 0)            AS ExitInPeriod,
                IFNULL(ADJ.AdjBeforeFrom, 0)          AS AdjBeforeFrom,
                IFNULL(ADJ.AdjInPeriodSigned, 0)      AS AdjInPeriodSigned,
                IFNULL(ADJ.AdjInPeriodReceipt, 0)     AS AdjInPeriodReceipt,
                IFNULL(ADJ.AdjInPeriodIssue, 0)       AS AdjInPeriodIssue
            FROM db_iemr.t_itemstockentry ISE

            LEFT JOIN (
                SELECT
                    x.ItemStockEntryID,
                    SUM(CASE WHEN x.CreatedDate < v_FromDate
                            THEN GREATEST(IFNULL(x.Quantity,0),0) ELSE 0 END)       AS ExitBeforeFrom,
                    SUM(CASE WHEN x.CreatedDate >= v_FromDate AND x.CreatedDate < v_ToDateExcl
                            THEN GREATEST(IFNULL(x.Quantity,0),0) ELSE 0 END)       AS ExitInPeriod
                FROM db_iemr.t_itemstockexit x
                INNER JOIN db_iemr.t_itemstockentry e ON e.ItemStockEntryID = x.ItemStockEntryID
                WHERE x.CreatedDate < v_ToDateExcl
                  AND IFNULL(x.Deleted, 0) = 0
                  AND (v_facilityid IS NULL OR e.FacilityID = v_facilityid)
                GROUP BY x.ItemStockEntryID
            ) EX  ON EX.ItemStockEntryID = ISE.ItemStockEntryID

            LEFT JOIN (
                SELECT
                    s.ItemStockEntryID,
                    SUM(CASE WHEN s.CreatedDate < v_FromDate THEN
                              CASE WHEN s.IsAdded = 1 THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0)
                                    ELSE -GREATEST(IFNULL(s.AdjustedQuantity,0),0) END
                            ELSE 0 END)                                             AS AdjBeforeFrom,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl THEN
                              CASE WHEN s.IsAdded = 1 THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0)
                                    ELSE -GREATEST(IFNULL(s.AdjustedQuantity,0),0) END
                            ELSE 0 END)                                             AS AdjInPeriodSigned,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 1
                            THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0) ELSE 0 END) AS AdjInPeriodReceipt,
                    SUM(CASE WHEN s.CreatedDate >= v_FromDate AND s.CreatedDate < v_ToDateExcl AND s.IsAdded = 0
                            THEN GREATEST(IFNULL(s.AdjustedQuantity,0),0) ELSE 0 END) AS AdjInPeriodIssue
                FROM db_iemr.t_SAItemMapping s
                INNER JOIN db_iemr.t_itemstockentry e ON e.ItemStockEntryID = s.ItemStockEntryID
                WHERE s.CreatedDate < v_ToDateExcl
                  AND IFNULL(s.Deleted, 0) = 0
                  AND (v_facilityid IS NULL OR e.FacilityID = v_facilityid)
                GROUP BY s.ItemStockEntryID
            ) ADJ ON ADJ.ItemStockEntryID = ISE.ItemStockEntryID

            INNER JOIN db_iemr.m_Item         ITM  ON ISE.ItemID         = ITM.ItemID
            INNER JOIN db_iemr.m_Facility     FAC  ON ISE.FacilityID     = FAC.FacilityID
            INNER JOIN db_iemr.m_ItemCategory ITMC ON ITM.ItemCategoryID = ITMC.ItemCategoryID

            WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
              AND IFNULL(FAC.Deleted, 0) = 0
              AND ISE.CreatedDate < v_ToDateExcl
              AND IFNULL(ISE.Deleted, 0) = 0
              -- Same batches as the stock screens (itemBatchPartialSearch):
              -- stock in hand, item mapped to the facility and not deleted.
              AND IFNULL(ISE.QuantityInHand, 0) > 0
              AND IFNULL(ITM.Deleted, 0) = 0
              AND EXISTS (
                    SELECT 1 FROM db_iemr.m_itemfacilitymapping MIF
                    WHERE MIF.ItemID = ISE.ItemID
                      AND MIF.FacilityID = ISE.FacilityID
                      AND IFNULL(MIF.Deleted, 0) = 0
                  )
        ) B
    ) S
    GROUP BY S.ItemID, S.FacilityID, S.ItemName, S.FacilityName, S.ItemCategoryName
    ORDER BY S.FacilityName, S.ItemName;

  END$$

  DELIMITER ;
