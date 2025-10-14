USE Northwind

/*
	Inner Join:
	=> Wenn wir nur übereinstimmende Daten aus beiden Tabellen brauchen
*/

-- Wir wollen eine Verknüpfung zwischen Customers und Orders haben
SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax:

	SELECT * FROM [Tabelle.A]
	INNER JOIN [Tabelle.B] ON [Tabelle.A].Schlüsselspalte = [Tabelle.B].Schlüsselspalte
*/

-- Customers und Orders Joinen
SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Joinen mit Aliase
SELECT * FROM Customers as CUS
JOIN Orders as ORD ON CUS.CustomerID = ORD.CustomerID
WHERE Country = 'Germany'
ORDER BY CUS.CustomerID ASC

-- Customers - Orders - [Order Details]
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID

-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
SELECT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE LastName = 'Leverling'

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Tabellen: Customers - Orders
SELECT OrderID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 5. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, 
-- das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE Discontinued = 1

---------------------------------------------------------
-- OUTER Joins: LEFT/RIGHT und FULL OUTER

-- Left:
-- Alle Datensätze aus der Linken Tabelle, auch wenn es keine passende Verknüpfung gibt
SELECT * FROM Orders -- ist immer Links (obere Tabelle)
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID -- 830
-- Bestellungen ohne ein Kunde (gibt keinen)

-- Right: Z. 189 & Z.502
-- Alle Datensätze aus der Rechten Tabelle, auch wenn es keine passende Verknüpfung gibt
SELECT * FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID -- 832
-- Kunden die keine Bestellung getätigt haben: 2

-- Full Outer = Links und Rechts beides
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen => (Tabelle A x Tabelle B)
SELECT * FROM Orders CROSS JOIN Customers -- (830 x 91)

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo