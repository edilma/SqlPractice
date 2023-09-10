/*
SELECT WorkOrderID,
	ScrappedQty,
	ScrapReasonId
FROM Production.WorkOrder
--WHERE ScrapReasonID IS NOT NULL
WHERE ScrapReasonID IS NULL
;
*/

SELECT WorkOrderID,
	ScrappedQty,
	ISNULL(ScrapReasonId, 99) AS ScrapReason
FROM Production.WorkOrder
;