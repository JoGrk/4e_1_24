-- 1. Usuń klientów z Meksyku
UPDATE orders
SET customerID=NULL
WHERE customerID IN (SELECT customerID
                        FROM customers
                        WHERE country='mexico'
);

DELETE FROM customers
WHERE country='mexico';
-- 2. Usuń produkty o cenie mniejszej niż 15
UPDATE Order_details
SET ProductID= NULL
WHERE ProductID IN (SELECT ProductID
                        FROM Products
                        WHERE Price < 15  );

DELETE FROM Products
WHERE Price < 15; 
 


 
-- 3. Zmień numer dostawcy produktu o id 2 na dostawcę o id 3
UPDATE Products
SET SupplierID = 3
WHERE ProductID = 2;
-- 4, Zmień osobę do kontaktów na siebie dla klienta o numerze 1
 
UPDATE customers
SET ContactName ='Jan Kowalski'
WHERE CustomerID=1;

-- 5. Zmniejsz o 5% cenę wszystkich produktów dostarczanych przez dostawcę o numerze 7
UPDATE Products
SET Price = Price*0.95
WHERE SupplierID =7;
 
-- 6. Zwiększ cenę produktów z kategorii 1 o 10%
UPDATE Products
SET Price = Price*1.10
WHERE CategoryID=1;
-- 7. Dodaj nową kategorię produktów
INSERT INTO Categories
(CategoryName)
VALUES
('zwierzęta');

-- 8. Z tabeli Pracownicy (Employees) usuń pracownika o numerze 3 (EmployeeID). 
UPDATE orders
SET EmployeeID = NULL
WHERE EmployeeID =3;

DELETE FROM Employees
WHERE EmployeeID = 3;
-- 9. Dodaj jeszcze jednego dostawcę (tabela Shippers)
INSERT INTO Shippers
(ShipperName)
VALUES
('Pocztex');
-- 10. Podnieś cenę Tofu do 30 (ProductName -nazwa produktu, Price - cena, tabela Products)
UPDATE Products
SET price = 30
WHERE ProductName = 'Tofu';
-- 11. Podnieś o 10% cenę (Price) wszystkich produktów o nazwie (ProductName) zaczynającej się na literę C) (tabela Products)
UPDATE Products
SET Price = Price*1.30
WHERE ProductName LIKE 'C%';
-- 12. Usuń z tabeli OrderDetails zamówienia o ID 10443 oraz 10440 (OrderID).
DELETE FROM Order_Details
WHERE OrderID IN ('10443', '10440');
-- 13. Zmień adres (Address), miasto (City) i kraj (Country) dostawcy o numerze 2  (SupplierID) na ul. Pocztową, Nakło, Polskę. (tabela Suppliers)

UPDATE Suppliers
SET address='Czarna 12' , city='kraków' , country='Poland'
WHERE SupplierID=2; 