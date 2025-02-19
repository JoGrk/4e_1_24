-- 1. Tabela OrderDetails. Wyświetl sumę wszystkich sprzedanych ilości (Quantity)
SELECT SUM(quantity)
FROM Order_Details;
-- 2. Products. 

-- A.Wyświetl najpierw 23% podatek z ceny (price) oraz nazwę produktu (productname). 
SELECT productname , 0.23*price
FROM Products;
-- B.Następnie wyświetl średni 23% podatek z cen wszystkich produktów
SELECT AVG(0.23*price)
FROM Products;
-- 3 Products. Zlicz ilość produktów.
SELECT COUNT(*)
FROM products;
-- 4. Product. Pogrupuj produkty według CategoryID i oblicz dla każdej kategorii najwyższą i najniższą cenę. Dane posortuj rosnąco według najnizszej ceny.
SELECT CategoryID, min(price), max(price)
FROM products
GROUP BY CategoryID
ORDER BY min(price);
-- 5. Products

-- A. Wyświetl wszystkie towary sprzedawane w butelkach ( unit zawiera tekst  "bottle")

SELECT *
FROM Products
WHERE unit LIKE "%bottle%";


-- B. Pogrupuj według kategorii (CategoryID)  i policz ilość produktów w każdej kategorii. Do zapytania wybierz tylko produkty sprzedawane w butelkach.

SELECT CategoryID , COUNT(*)
FROM products
WHERE unit LIKE "%bottle%"
GROUP BY CategoryID;

-- 6. Customers

-- A. Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów
SELECT COUNTRY , COUNT(*)
FROM Customers
GROUP BY country
ORDER BY COUNT(*) desc;

-- B.  Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów, wyświetl tylko te kraje, w których jest co najmniej 10 klientów
SELECT COUNTRY , COUNT(*)
FROM Customers
GROUP BY country
HAVING COUNT(*)>=10
ORDER BY COUNT(*) desc;
-- 7. Products

-- A. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę.
SELECT SupplierID, max(price)
FROM products
GROUP BY SupplierID;
-- B. Wyświetl supplierID, cenę oraz unit produktów sprzedawanych w paczkach (pole unit zawiera tekst 'pkg') 
SELECT supplierID, price, unit
FROM products
WHERE unit LIKE '%pkg%';
-- C. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach
SELECT supplierID, max(price)
FROM products
WHERE unit LIKE '%pkg%'
GROUP BY supplierID;
-- D. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach, ale wyświetl tylko te wiersze, w których maksymalna cena jest większa od 50
SELECT SupplierID, max(price)
FROM products
WHERE unit LIKE '%pkg%'
GROUP BY SupplierID
HAVING max(price) > 50;
-- 8. OrderDetails

-- A. Dla poszczególnych produktów (productID) podaj średnią, minimalną oraz maksymalną ilość sprzedawaną w ramach zamówienia (quantity)

SELECT productID, AVG(quantity), MIN(quantity), MAX(quantity)
FROM Order_Details
GROUP BY productID;

-- B. z powyższego zestawienia wybierz tylko te wiersze, w których ta średnia ilość jest mniejsza od 20
SELECT productID, AVG(quantity), MIN(quantity), MAX(quantity)
FROM Order_Details
GROUP BY productID
HAVING AVG(quantity) < 20;