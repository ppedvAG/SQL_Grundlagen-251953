USE Northwind
GO

-- Versuch Nr.1
-- Eine Beliebige Variable mit VARCHAR(20) => Default Value muss Hoeher sein
-- @CustomerID = char(5), @CompanyName von varchar(40)
-- @Country varchar(20), @City = varchar(30)
-- Default Wert benoetigt!!!, Country Default Wert muss die 20 Zeichenketten ueberschreiben
CREATE PROCEDURE sp_Test1 
@CustomerID char(5) = '12345', @CompanyName varchar(40) = 'TestUnternehmen',
@Country varchar(20) = 'GermanyGermanyGermanyGermany', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC sp_Test1
GO

SELECT * FROM Customers
GO

------------------------------------------
-- Versuch Nr.2
-- Keine Defaultwerte:
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(20), @City = varchar(30)
-- Beim Exec muss der WERT größer sein als der Datentyp es zulässt
CREATE PROCEDURE sp_Test2 
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(20), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC sp_Test2 12345, TestUnternehmen, GermanyGermanyGermanyGermany, Berlin
GO

SELECT * FROM Customers
GO

-- Versuch Nr.3
-- Keine Defaultwerte:
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(10), @City = varchar(30)
-- Beim Exec muss der WERT größer sein als der Datentyp es zulässt
CREATE PROCEDURE sp_Test3
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(10), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC sp_Test3 12345, TestUnternehmen, GermanyGermanyGermanyGermany, Berlin
GO

SELECT * FROM Customers
GO

-- Versuch Nr.4
-- @CustomerID = char(5), @CompanyName von varchar 40
-- @Country varchar(10), @City = varchar(30)
-- Mit Default werden
CREATE PROCEDURE sp_Test4
@CustomerID char(5) = '67890', @CompanyName varchar(40) = 'TestUnternehmen',
@Country varchar(10) = 'GermanyGermanyGermanyGermany', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC sp_Test4
GO

SELECT * FROM Customers
GO