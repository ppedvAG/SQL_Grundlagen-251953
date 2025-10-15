USE Northwind
/*******************************************/

-- Subqueries / Unterabfragen / nested queries

/*******************************************/

/*
	- Müssen eigenständig fehlerfrei ausführbar sein!
	- Können prinzipiell überall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden von "innen nach außen" der Reihe nach ausgeführt
*/

-- Zeige mir alle Orders, deren Freight Wert ueber dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 78,2442

-- Mehrere Werte aus einer Subquery im WHERE machen
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)