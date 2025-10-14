USE Northwind

-- WHERE: filtert Ergebniszeilen => Inhalte in der Tabelle
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = wird nach exakten Treffern gefiltert
SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Orders
WHERE Freight = 100

-- alle boolschen Vergleichsoperatoren verwenden
-- größer als (>)
-- kleiner als (<)
-- größer oder gleich (>=)
-- kleiner oder gleich (<=)
-- Ungleich als (!= bzw. <>)

-- Alle Frachtkosten von der Tabelle Orders haben (mit allen Spalten)
-- die größer als 500 sind
SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Berlin'

-- AND = "Beide" Bedingungen müssen "wahr" sein (true oder 1)
-- OR = Ein Ausdruck muss wahr sein
-- Können beliebig oft kombiniert werden

-- "Vorsicht" bei Kombination von AND und OR
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindenter" als OR; Notfalls klammern setzen!

-- Alle Frachtkosten aus Orders die zwischen 100 und 500 liegen mit Inbegriffen
SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternative mit BETWEEN, Randwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France'

-- Alternativ IN (Wert1, Wert2, Wert3., usw...)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France')

-- IN verbindet mehrere OR Bedingungen die sich auf die selbe Spalte bezieht

---------------------------------------------------------
-- Übungen:

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid und Brazilien
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- "Bonus/Problem": Alle Kunden die eine Fax Nummer haben
-- Filtern mit/nach NULL Werten:
SELECT * FROM Customers
WHERE Fax != 'NULL'

SELECT * FROM Customers
WHERE Fax IS NOT NULL

-- 4. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht
-- mehr verkauft werden (Discontinued)? Wenn ja, wieviel "Geld" liegt dort im Lager?
-- Rechnung: UnitsInStock * UnitPrice
SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
ORDER BY Wert
