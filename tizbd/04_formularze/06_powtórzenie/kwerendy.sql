-- Raport wyświetla dane dotyczące produktów (nazwa produktu, nazwa dostawcy, cena) w formie tabeli.

SELECT productname, price,  suppliername
FROM products 
INNER JOIN suppliers ON suppliers.supplierID=products.supplierID;

--  Podwyżka. Lista rozwijana z nazwą towaru oraz suwak (range) do ustawienia podwyżki dla wartości od 0 do 10% (etykiety, wartości to od 0 do 0.1)). Po wybraniu produktu, ustawieniu podwyżki i kliknięciu na Wyślij zostaje zmodyfikowana cena produktu (podwyższona o wartość podwyżki)

SELECT productname, productID
FROM products;

UPDATE products
SET price = price+price*0.1
WHERE productID = 1;