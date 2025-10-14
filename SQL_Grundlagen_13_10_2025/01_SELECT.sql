-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentarblock
*/

-- USE Datenbankname wechselt angesprochene Datenbank
-- Markieren => STRG + E | F5 | oder auf 'ausf�hren' oben klicken
-- Alternativ "oben link" im Drop-Down Men� die richtige Datenbank ausw�hlen
USE Northwind

/*
	SELECT: w�hlt Spalten aus, die im
	Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten in der angesprochene Tabelle

-- "Custom" - Werte und mathematische Operationen ebenfalls m�glich

SELECT 100

SELECT 'Hallo!'

SELECT 'Hallo', 100

SELECT 100 + 10, 80 * 9
--------------------------------------------------

SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons n�tig

SelEcT			CoUnTrY,

		ComPanYNamE
FrOm				CuStOmERs
----------------------------------------------------------------

-- ORDER BY: Sortieren die Spalten aufsteigend oder absteigend

-- Sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City -- ASC = Ascending => Aufsteigend => vom kleinsten zum gr��ten

-- Absteigend sortieren mit DESC
SELECT * FROM Customers
ORDER BY City DESC -- DESC = Descending => Absteigend => vom gr��ten zum kleinsten

-- ORDER BY steht syntaktisch immer am Ende
-- DESC = Descending => absteigend => Z-A oder 100-1
-- ASC = Ascending => aufsteigend => A-z oder 1-100 (standardwert)

SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName DESC

/*
	City DESC | CompanyName DESC
	----------------------------
	Sao Paulo	Tradi��o Hipermercados
	Sao Paulo	Queen Cozinha
	Sao Paulo	Familia Arquibaldo
	Sao Paulo	Com�rcio Mineiro

*/


SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName ASC

/*
	City DESC | CompanyName ASC
	---------------------------
	Sao Paulo	Com�rcio Mineiro
	Sao Paulo	Familia Arquibaldo
	Sao Paulo	Queen Cozinha
	Sao Paulo	Tradi��o Hipermercados
*/

----------------------------------------
-- TOP X gibt nur die ersten X Zeilen aus von OBEN
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %-Angabe
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers
----------------------------------------

-- Die 20 kleinsten Frachtkosten aus der Tabelle "Orders"
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- Die 20 gr��ten Frachtkosten aus der Tabelle "Orders"
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC
----------------------------------------

-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind
-- Macht automatisch ein ORDER BY ASC mit

SELECT DISTINCT Country FROM Customers
SELECT DISTINCT City, Country FROM Customers

SELECT * FROM Customers
SELECT DISTINCT * FROM Customers

----------------------------------------
-- UNION f�hrt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, sowohl muss der Datentyp kompatibel sein

SELECT * FROM Customers -- 91 Datens�tze
UNION
SELECT * FROM Customers -- 91 Datens�tze
-- Insgesamt Datens�tze => 182 Datens�tze

-- mit UNION ALL wird KEIN DISTINCT ausgef�hrt
SELECT * FROM Customers -- 91 Datens�tze
UNION ALL
SELECT * FROM Customers -- 91 Datens�tze
-- Insgesamt Datens�tze => 182 Datens�tze

-- Geht nicht wegen Datentyp, falsche Reihenfolge
SELECT 100, 'Hallo'
UNION
SELECT 'Tsch�ss', 5

-- Geht wiederrum schon
SELECT 'Hallo', 100
UNION
SELECT 'Tsch�ss', 5

-- Geht nicht, weil oben 2 Spalten, unten 3 Spalten
SELECT 'Hallo', 100
UNION
SELECT 'Tsch�ss', 5, 100

------------------------------------------

-- Spalten "umbenennen" mit Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo' as Begr��ung

-- Nicht zwingend notwenig das "as" aber w�re sehr Sinnvoll
SELECT City Stadt FROM Customers

-- Aliase f�r Tabellennamen vergeben
SELECT * FROM Customers as cus