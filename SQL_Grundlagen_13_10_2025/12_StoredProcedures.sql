Use Northwind
GO
/*******************************************/

-- Stored Procedures / gespeicherte Prozeduren

/*******************************************/

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECTs, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Praktisch zum "automatisieren" von Code
*/

CREATE PROCEDURE spOrderID
@OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID -- 10250
GO

-- Prozedur aufuehren
EXEC spOrderID 10250
GO

CREATE PROCEDURE spNeuerKunde
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNeuerKunde 'PPEDV', 'ppedv AG', 'Germany', 'Burghausen'
GO
EXEC spNeuerKunde LIDLI, 'Lidl GmbH', 'Germany', Burghausen
GO
EXEC spNeuerKunde ALDIS, AldiGmbH, Germany, Burghausen
GO

SELECT * FROM Customers
GO

-- Default Werte:
CREATE PROCEDURE spKundenNachLandCity 
@Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers 
WHERE Country = @Country AND City = @City
GO

EXEC spKundenNachLandCity
GO
EXEC spKundenNachLandCity France, Paris
GO
EXEC spKundenNachLandCity DEFAULT, Köln
GO

-- 1. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
-- Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.
-- OrderID |  RechnungsSumme
-- ------------------------------
-- 10250   |  1050,25     

CREATE PROCEDURE sp_RechnungsSumme @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) AS RechnungsSumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID
GO

EXEC sp_RechnungsSumme 10250