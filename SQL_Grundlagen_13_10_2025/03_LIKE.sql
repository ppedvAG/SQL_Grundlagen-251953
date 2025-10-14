USE Northwind

-- LIKE: Für ungenaue Filterung/Suche können wir LIKE verwenden
-- (statt Vergleichsoperatoren)

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'


SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Owner'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbol, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

-- "_"-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

--"[]"-Zeichen: Alles was in den Klammern steht ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0, 1, 2, 3, 4, 5]%'

-- "[a-z] [1-5]" oder Gegenteil mit ^ (Caret) [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^0-3]%'

-- Sonderfälle: ' %
-- %
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

-- 1. Alle ShipPostalCode's anzeigen lassen, die mit 0,2,4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'
