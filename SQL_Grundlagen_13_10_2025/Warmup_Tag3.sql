--1. Ist der Spediteur �Speedy Express� 
--�ber die Jahre durchschnittlich teurer geworden? (Freight pro Jahr)
SELECT CompanyName, DATEPART(YEAR, OrderDate) as Gesch�ftsjahr, AVG(Freight) as AVGFreight
FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)

--2. Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zur�ckgeben, 
--f�r die die Gesamtzahl der Auftr�ge gr��er als 15 ist (5 Zeilen)
--Tables: Orders
SELECT CustomerID, COUNT(OrderID) FROM Orders
WHERE OrderDate > '31.12.1996'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY 2


-- 3. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight)
-- pro Lieferung und Anzahl an Lieferungen
-- Tables: Orders - Shippers
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Gesch�ftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	usw....
*/

SELECT CompanyName as SpediteurName,
DATEPART(YEAR, OrderDate) as Gesch�ftsjahr,
SUM(Freight) as FreightGesamt,
AVG(Freight) as FreightAvg,
COUNT(*) as AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY SpediteurName, Gesch�ftsjahr, FreightAvg
