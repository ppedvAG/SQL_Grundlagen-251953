-- 1. Bestellungen die Herr King bearbeitet hat
-- Employees & Orders
SELECT * FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE LastName = 'King'

-- 2. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--„Seafood“ (Categories) verkauft?
--Wenn ja, wieviel Lieferkosten sind 
--dabei insgesamt entstanden (Freight)?

-- Welche Tabellen: Employees - Products - Categories - Orders - Order Details

SELECT Freight as Lieferkosten
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'
