--				views Use Case (03)
/*Use views to enforce security and protect sensitive 
data,by hiding colums and /or rows from tables.*/


--					task 04
/*  1.provider a view for EU sales team
	2.that combines details from all tables
	3.and excludes Data related to THE USA
*/
CREATE VIEW Sales.V_Order_Details_EU AS (
	SELECT
		O.OrderID,
		O.OrderDate,
		O.Sales,
		O.Quantity,
		P.Product,
		P.Category,
		COALESCE(C.FirstName,'') + ' ' + COALESCE(c.LastName,'') CustomerName,
		C.Country,
		COALESCE(e.FirstName,'') + ' ' + COALESCE(e.LastName,'') SalerName,
		e.Department
	FROM Sales.Orders O
	LEFT JOIN Sales.Products P
	ON P.ProductID=O.ProductID
	LEFT JOIN Sales.Customers c
	ON c.CustomerID=O.CustomerID
	LEFT JOIN Sales.Employees AS e
	ON e.EmployeeID=O.SalesPersonID
	WHERE C.Country ='USA'
	)
	GO

	SELECT 
	*
	FROM Sales.V_Order_Details_EU