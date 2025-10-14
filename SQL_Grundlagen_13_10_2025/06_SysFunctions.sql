USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge des Strings zurück (Anzahl Zeichen) als INT
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" bzw. "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position x in einem String und gebe y Zeichen zurück
SELECT SUBSTRING(CompanyName, 5, 10) as NeueSpalte, CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x
-- mit dem "replace" Wert
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers
-- 01567 683274
-- LEN: 12 - 4 => 8 => 01567 68XXXXX

-- CONCAT fügt mehrere Strings in die Selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees

----------------------------------------------------------------
-- Datumsfunktionen

SELECT GETDATE() -- aktuelle Systemzeit mit Zeitstempel

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag
, OrderDate FROM Orders

-- "Zieht" ein gewünschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde,
OrderDate FROM Orders

-- Zieht den IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate) as Monat, DATENAME(WEEKDAY, OrderDate) as WochentagName,
DATEPART(WEEKDAY, OrderDate) as Wochentag, OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- 1. Parameter: Intervall zum Addieren/subtrahieren wählen, Monate, Tage, Jahre etc
-- 2. Parameter: Wieviel dazu addieren/subtrahieren? 10, 15, 20 ?
-- 3. Parameter: Auf welches Datum soll das addiert/subtrahiert werden?

-- Differenz in Intervall xy zwischen 2 Datum
SELECT DATEDIFF(YEAR, '13.02.2005', GETDATE()) -- 20050213 => YYYYMMDD
-- 1. Parameter: Welches Intervall sollen wir differenzieren?
-- 2. Parameter: Startdatum
-- 3. Parameter: Enddatum

-----------------------------------------------------------------
-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
-- konvertierung von datetime => date
SELECT CAST(OrderDate as date) as Datum, OrderDate FROM Orders

SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prüft auf Null Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

DECLARE @d AS DATE = '08/09/2024';

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';


SELECT TOP 5 Freight, 
	FORMAT(Freight, 'N', 'de-de'),
	FORMAT(Freight, 'G', 'de-de'),
	FORMAT(Freight, 'C', 'de-de')
FROM Orders

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen!')

-- REPLICATE(x, y) => Setze "y" mal die "x" vor die Spalte XYZ
SELECT REPLICATE('0', 3) + Phone FROM Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) From Customers

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen Inputstring an, wähle die "chars" aus die im "inputString" ersetzt werden sollen
-- mit "replace" Wert
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()')
