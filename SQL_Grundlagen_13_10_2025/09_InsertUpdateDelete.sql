USE Northwind

-- INSERT / UPDATE / DELETE
-- CREATE / ALTER / DROP 
-- => DDL ( Data Definition Language )

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

-- Eine Tabelle erstellen

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen über die ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufuegen zu bestehender Tabelle
ALTER TABLE PurchasingOrders
ADD TestDaten INT NULL

-- Spalte aus der bestehenden Table loeschen:
ALTER TABLE PurchasingOrders
DROP COLUMN Spalte

-- Spalte nach Datentyp ändern?
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten DECIMAL(10,2) NULL

/*************************************/

-- INSERT - Hinzufügen von Datensätzen in bestehender Table

/*************************************/

-- Alle Spalten befuellen:
INSERT INTO PurchasingOrders
VALUES('12.12.2012', 2, 20.25)

-- Explizit bestimmte Spalten zu befuellen:
INSERT INTO PurchasingOrders (OrderDate, ProductID)
VALUES ('24.12.2012', 5)

-- Ergebnisse aus einer SELECT-Abfrage in die Tabelle direkt zu Inserten
-- (Wenn Spaltenanzahl passen & Datentypen kompatibel sind)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 4, 50.50

SELECT * FROM PurchasingOrders

/*************************************/

-- DELETE - Löschen von Datensätzen in einem bestehendem Table

/*************************************/


SELECT * FROM PurchasingOrders

DELETE FROM PurchasingOrders
WHERE ID = 5


-- Primaer-/Fremdschlüsselbeziehungen verhindern das loeschen von Datensaetzen, wenn
-- andere Datensaetze sonst "ins Leere Laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

/*************************************/

-- UPDATE - Ändern von Spaltenwerten in einem vorhandenden Datensatz

/*************************************/

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 2

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 2

--1. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- 2: Aendere die Werte danach um, in eine Person die frei erfunden ist


/*******************************************/

-- Transactions

/*******************************************/

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 5

COMMIT   -- Bestätigung der Abfrage => Übernehmen
ROLLBACK -- Springe mir zum alten Stand VOR der Abfrage zurück

SELECT * FROM PurchasingOrders