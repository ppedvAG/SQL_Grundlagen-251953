USE Northwind
/******************************************/

-- Temporäre Tabellen / Temp Tables / #Tables

/******************************************/

/*
	- SELECT INTO #TableName => Ergebnisse werden in eine Temporäre Tabelle geschrieben
	- existiert nur innerhalb meiner Session (Skriptfenster / Abfragefenster)
	- werden in Systemdatenbanken => tempDB => Temporäre Tabellen Ordner abgelegt
	- Ergebnisse werden nur einmal generiert => TempTables sind sehr schnell, aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/

-- Erstellen
SELECT * INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporäre Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell loeschen
DROP TABLE #TempTable

-- globale Temp Table:
SELECT * INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'

--1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--„Seafood“ (Categories) verkauft?
--Wenn ja, wieviel Lieferkosten sind 
--dabei insgesamt entstanden (Freight)?
--> Speichert das ganze in eine Temporäre Tabelle
SELECT LastName, CategoryName, SUM(Freight) as Lieferkosten
INTO #FreightSumme
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'
GROUP BY LastName, CategoryName

SELECT * FROM #FreightSumme
