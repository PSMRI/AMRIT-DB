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
      ROW_NUMBER() OVER (ORDER BY FAC.FacilityName, ITM.ItemName, ISE.BatchNo) AS `Sl No`,
      DATE_FORMAT(v_ToDate, '%d-%m-%Y')            AS `Date`,
      ISE.EntryType                                 AS `EntryType`,
      FAC.FacilityName                              AS `Facility Name`,
      ITMF.ItemFormName                             AS `item form`,
      ITM.ItemName                                  AS `Item Name`,
      ITM.Strength                                  AS `item strength`,
      UOM.UOMName                                   AS `UOM`,
      ITMC.ItemCategoryName                         AS `Item Category`,
      ISE.BatchNo                                   AS `Batch No`,
      ISE.UnitCostPrice                             AS `Unit Cost Price`,
      DATE_FORMAT(ISE.ExpiryDate, '%d-%m-%Y')       AS `Expiry Date`,

      IFNULL(ISE.Quantity, 0)                       AS `Total Quantity Received(Batch wise)`,

      -- Floored at 0: a negative opening is reported as no stock rather
      -- than a negative quantity.
      GREATEST(
        (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
        - IFNULL(EX.ExitBeforeFrom, 0)
        + IFNULL(ADJ.AdjBeforeFrom, 0)
      , 0)                                          AS `Opening Stock`,

      -- If Opening Stock (floored) is 0, Dispensed/Adjustment/Closing are
      -- all forced to 0 too - nothing to carry forward for this batch in
      -- this period. Otherwise, each computes exactly as before.
      (CASE
         WHEN GREATEST(
                (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
                - IFNULL(EX.ExitBeforeFrom, 0)
                + IFNULL(ADJ.AdjBeforeFrom, 0)
              , 0) = 0
         THEN 0
         ELSE IFNULL(EX.ExitInPeriod, 0)
       END)                                         AS `Dispensed Quantity`,

      (CASE
         WHEN GREATEST(
                (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
                - IFNULL(EX.ExitBeforeFrom, 0)
                + IFNULL(ADJ.AdjBeforeFrom, 0)
              , 0) = 0
         THEN 0
         ELSE IFNULL(ADJ.AdjInPeriodReceipt, 0)
       END)                                         AS `Adjustment Receipt`,

      (CASE
         WHEN GREATEST(
                (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
                - IFNULL(EX.ExitBeforeFrom, 0)
                + IFNULL(ADJ.AdjBeforeFrom, 0)
              , 0) = 0
         THEN 0
         ELSE IFNULL(ADJ.AdjInPeriodIssue, 0)
       END)                                         AS `Adjustment Issue`,

      (CASE
         WHEN GREATEST(
                (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
                - IFNULL(EX.ExitBeforeFrom, 0)
                + IFNULL(ADJ.AdjBeforeFrom, 0)
              , 0) = 0
         THEN 0
         ELSE
           GREATEST(
             (CASE WHEN ISE.CreatedDate < v_FromDate THEN IFNULL(ISE.Quantity,0) ELSE 0 END)
             - IFNULL(EX.ExitBeforeFrom, 0)
             + IFNULL(ADJ.AdjBeforeFrom, 0)
           , 0)
           - IFNULL(EX.ExitInPeriod, 0)
           + IFNULL(ADJ.AdjInPeriodSigned, 0)
       END)                                         AS `Closing Stock`,

      DATE_FORMAT(ISE.CreatedDate, '%d-%m-%Y')      AS `Item Entered Date`

  FROM db_iemr.t_itemstockentry ISE

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
  LEFT  JOIN db_iemr.m_itemform     ITMF ON ITM.ItemFormID     = ITMF.ItemFormID
  LEFT  JOIN db_iemr.m_uom          UOM  ON ITM.UOMID          = UOM.UOMID

  WHERE (v_facilityid IS NULL OR ISE.FacilityID = v_facilityid)
    AND ISE.CreatedDate < v_ToDateExcl
    AND IFNULL(ISE.Deleted, 0) = 0
  ORDER BY FAC.FacilityName, ITM.ItemName, ISE.BatchNo;

END$$

DELIMITER ;
