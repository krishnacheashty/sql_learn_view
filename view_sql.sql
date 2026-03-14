--				task 01
-- find the running total of sales for each month.
IF OBJECT_ID ('Sales.V_MONTHLY_SUMMERY','V') IS NOT NULL 
DROP VIEW Sales.V_MONTHLY_SUMMERY;
GO


CREATE VIEW Sales.V_MONTHLY_SUMMERY AS
(
	SELECT
		DATETRUNC(month,O.orderDate) orderMonth,
		SUM(O.Sales) TotalSales,
		COUNT(O.OrderDate) TotalOrders,
		SUM(O.Quantity) TotalQuantities
	FROM Sales.Orders AS O
	group by DATETRUNC(month,orderDate)
)
GO

SELECT 
orderMonth,
TotalSales,
TotalQuantities,
SUM(TotalSales) OVER(ORDER BY OrderMonth) RunningTotal
FROM Sales.V_MONTHLY_SUMMERY
