USE Northwind
/*******************************************/

-- Subqueries / Unterabfragen / nested queries

/*******************************************/

/*
	- M�ssen eigenst�ndig fehlerfrei ausf�hrbar sein!
	- K�nnen prinzipiell �berall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden von "innen nach au�en" der Reihe nach ausgef�hrt
*/

-- Zeige mir alle Orders, deren Freight Wert ueber dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 78,2442

-- Mehrere Werte aus einer Subquery im WHERE machen
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)