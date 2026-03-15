--task : provide view that combine details form orders,products,customer, and employees.

CREATE VIEW Sales.v_Order_Details as (
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
)
GO

SELECT 
*
FROM Sales.v_Order_Details
