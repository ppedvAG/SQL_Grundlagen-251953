USE Northwind
GO

-- Views: Erzeugt eine virtuelle Tabelle, deren Inhalt durch eine Abfrage definiert wird

/*
	Vorteile:
	- Um komplexere Abfragen zu speichern
	- Sicherheit: User erlauben nur die View zu lesen, nicht zu verändern
	- Views sind immer aktuell (aktuelle Daten)
		=> beim Aufruf einer View wird das hinterlegte Statement ausgeführt
*/

CREATE VIEW vRechnungsdaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName
GO

-- Aufruf der View
SELECT * FROM vRechnungsdaten
GO

-- View ändern
ALTER VIEW vRechnungsdaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName
GO

-- View loeschen
--DROP VIEW vRechnungsdaten
--GO


-- 1. Wieviel Umsatz haben wir in jedem Geschäftsjahr insgesamt gemacht?
-- Benoetigt: SUM(SummeBestPosi)
-- View: vRechnungsDaten
SELECT DATEPART(YEAR, OrderDate) as Geschäftsjahr, SUM(SummeBestPosi) as Gesamtumsatz
FROM vRechnungsDaten
GROUP BY DATEPART(YEAR, OrderDate)
ORDER BY 1 DESC

-- 2. Wieviel Umsatz haben wir in Q1 1998 mit Kunden aus den USA gemacht?
SELECT SUM(SummeBestPosi) as GesamtUmsatz FROM vRechnungsdaten
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1998 AND
DATEPART(QUARTER, OrderDate) = 1
