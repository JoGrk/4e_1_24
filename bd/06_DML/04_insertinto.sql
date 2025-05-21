-- 1. Utwórz tabelę KatalogConfections zawierającą wszystkie dane o produktach z kategorii Confections
CREATE TABLE KatalogConfections as 
SELECT products.*
FROM products
    JOIN categories ON categories.CategoryID = products.CategoryID
WHERE CategoryName="Confections";
-- 2. ze względu na nowy podatek podnieś cenę wszystkich artykułów kategorii Confections o 20% w tabeli Products
UPDATE products
JOIN categories ON categories.CategoryID=products.CategoryID
SET price=price*1.20
WHERE CategoryName="Confections";
-- 3. Zmień nazwę tabeli KatalogConfections na KatalogTaniejJuzBylo 
ALTER TABLE KatalogConfections
RENAME TO KatalogTaniejJuzBylo;
-- 4. Skopiuj do tabeli KatalogTaniejJuzBylo wszystkie produkty z kategorii Beverages
INSERT INTO KatalogTaniejJuzBylo
SELECT products.*
FROM products
    JOIN categories ON categories.CategoryID = products.CategoryID
WHERE CategoryName="Beverages";

-- 5. Do tabeli Archiwum przenieś dane z tabeli Orders dotyczące zamówień z 1996 roku (skopiuj - jeśli trzeba utwórz tabelę -i potem usuń)
CREATE TABLE Archiwum AS 
SELECT orders.*
FROM orders
WHERE OrderDate LIKE "1996%";

-- 6. Utwórz tabelę  Archiwum_Kontrahentów z danymi: nazwa dostawcy lub nazwa klienta, osoba do kontaktu, miasto, kraj z Włoch
CREATE TABLE Archiwum_Kontrahentow AS
SELECT SupplierName, ContactName, City
FROM Suppliers
WHERE Country LIKE 'italy'
UNION
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country LIKE 'italy';

-- 7. Usuń klientów i dostawców z Włoch z tabel Customers i Suppliers (dwoma zapytaniami)

-- 8. Do tabeli Archiwum_Kontrahentów dodaj kontrahentów z Niemiec i Francji
INSERT INTO Archiwum_Kontrahentow
SELECT SupplierName, ContactName, City
FROM Suppliers
WHERE Country IN ('Germany', 'France')
UNION
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country IN ('Germany', 'France');
 

-- 9. Z tabeli Customers wybierz dane klientów z Niemiec i dodaj ich do tabeli Suppliers
INSERT INTO Suppliers(SupplierName, ContactName, Address, City, PostalCode, Country)
SELECT CustomerName, ContactName, Address, City, PostalCode, Country
FROM Customers
WHERE Country LIKE 'Germany';
-- 10. Utwórz tabelę Archiwum zawierającą wszystkie dane z tabeli Orders dotyczące zamówień z 1996 roku

 

-- 11. Usuń z tabeli Orders wszystkie zamówienia z 1996 roku

-- 12. Do tabeli Archiwum dodaj wszystkie dane dotyczące zamówień ze stycznia 1997 roku

 