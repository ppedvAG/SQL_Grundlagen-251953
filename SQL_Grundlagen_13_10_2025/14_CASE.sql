Use Northwind
/*******************************************/

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

/*******************************************/

-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Wir müssen nachbestellen!'
	WHEN UnitsInStock > 10 THEN 'Die Menge passt!'
END as Prufung
FROM Products

-- Alternative mit ELSE einen "Notausgang" definieren
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Wir müssen nachbestellen!'
	WHEN UnitsInStock > 10 THEN 'Die Menge passt!'
	ELSE 'Fehler! Für diesen Wert gibt es keinen Fall'
END as Prufung
FROM Products

-- Funktioniert auch mit UPDATE:
UPDATE Customers
SET City =
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END


-- Auch im GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 10 THEN 'Wir müssen nachbestellen!'
	WHEN UnitsInStock > 10 THEN 'Die Menge passt!'
	ELSE 'Fehler! Für diesen Wert gibt es keinen Fall'
END as Prufung
FROM Products
GROUP BY
CASE
	WHEN UnitsInStock < 10 THEN 'Wir müssen nachbestellen!'
	WHEN UnitsInStock > 10 THEN 'Die Menge passt!'
	ELSE 'Fehler! Für diesen Wert gibt es keinen Fall'
END