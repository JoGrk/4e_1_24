-- select
-- 1.  Wypisać nazwę wszystkich towarów, cenę i pole ze średnią cenę wszystkich towarów
SELECT round(AVG(Price),2)
FROM Products

SELECT ProductName,Price,(SELECT round(AVG(Price),2)
    FROM Products) AS AVG_price
FROM Products;
-- 2 . Wypisać nazwę towaru, cenę i różnicę między jego ceną a średnią ceną wszystkich towarów
SELECT 
    ProductName,
    Price,
    (SELECT (round(AVG(Price),2))
    FROM Products)-Price AS dif_price
FROM Products;
-- 3. wypisze nazwę towaru, cenę oraz ile razy jego cena jest większa od najmniejszej ceny wszystkich towarów (stosunek ceny do ceny minimalnej)
SELECT min(Price)
FROM Products;

SELECT 
    ProductName,
    Price,

    Price/(SELECT min(Price)
    FROM Products) AS  relation
FROM Products;
-- where
-- 4.  wybieramy te zamówienia, w których łączna ilość zamówionych produktów jest mniejsza od średniej ilości zamawianych produktów

-- 5. zapytanie zwracające nazwę najtańszego towaru

-- 6. zapytanie zwracające nazwy i ceny wszystkich produktów z kategorii Seafood o cenach niższych niż średnia cena produktów

-- 7. wyświetl nazwę i cenę towarów, które zostały zamówione (kiedykolwiek) w ilości co najmniej 15 sztuk (Quantity )

-- 8. wyświetl nazwę i cenę towarów, które zawsze są zamawiane w ilości co najmniej 15 sztuk (Quantity ) (i były co najmniej raz zamówione)

-- 9. Wyświetl nazwiska i imiona klientów (Customer Name), którzy nie korzystali z firmy  Speedy Express

-- 10. Wszystkie informacje o klientach, mających tę samą wartość w polu CustomerName (może wpisanych przez pomyłkę?)
SELECT *
FROM Customers
WHERE CustomerName IN (SELECT CustomerName
                        FROM Customers
                        GROUP BY CustomerName
                        HAVING COUNT(*)>1);

INSERT INTO Customers (CustomerName)
VALUES ('Wolski');

-- update

-- 11 Podnieś o 10% ceny produktów z kategorii  "Confections"

UPDATE Products
SET price=price*1.10
WHERE categoryID=(SELECT categoryID
FROM categories
WHERE categoryName="confections");

-- 12  Dla zamówień klientów z UK zmień spedytora na "United Package"
UPDATE Orders
SET ShipperID = (SELECT ShipperID
                FROM shippers
                WHERE ShipperName = "United Package")
WHERE CustomerID IN (SELECT CustomerID 
                    FROM Customers
                    WHERE Country = "UK");

-- 13. Dodaj nowy produkt z kategorii Confections dostarczony przez Exotic Liquid 

INSERT INTO Products
    (ProductName,categoryID,supplierID)
VALUES
    ('hlep',
    (SELECT categoryID
    FROM categories
    WHERE categoryName='confections')
    ,(SELECT supplierID
    FROM suppliers
    WHERE supplierName='exotic liquid'));
