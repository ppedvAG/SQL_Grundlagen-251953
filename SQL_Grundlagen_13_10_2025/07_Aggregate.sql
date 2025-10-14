USE Northwind

-- Aggregatfunktionen: F�hrt eine Berechnung auf einer Menge von Werten durch und gibt einen
--					   einzigen Wert zur�ck
-- Ausnahme: COUNT(*) ignoriert keine Null Werte, alle anderen Funktionen schon

-- 5 grunds�tzliche verschieden Funktionen

SELECT
SUM(Freight) as Summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) as Durchschnitt,
COUNT(ShippedDate) as Z�hleSpalte, COUNT(*) as Z�hleAlles
FROM Orders

-- AVG selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders

-- Freight Summe pro CustomerID
SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

-- L�sung �ber Group By => Fasst mehrere Werte in Gruppen zusammen
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity Summe pro ProductName f�r Produkte der Kategorien 1-4:
SELECT ProductName, SUM(Quantity) AS SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1, 2, 3, 4)
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- Quantity Summe Pro ProductName f�r Produkte der Kategorie 1-4, alle die �ber 1000 liegen
-- HAVING funktioniert 1zu1 wie WHERE, kann aber gruppierte/aggregierte Werte nachtraeglich filtern
SELECT ProductName, SUM(Quantity) AS SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1, 2, 3, 4)
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckzahl DESC