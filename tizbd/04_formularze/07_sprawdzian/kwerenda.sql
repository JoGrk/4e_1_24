-- Modyfikacja cen produktów zamawianych przez wybranego dostawcę. Formularz:
-- lista rozwijana z nazwą dostawcy (jako value id dostawcy)
-- pole typu range do wpisania modyfikacji ceny (o wybraną wartość procentową). Wartość minimalna to -0.1, maksymalna 0.1, step 0.02
-- przycisk


SELECT supplierName , supplierID
FROM suppliers;

UPDATE products
    SET price = price+price*(-0.1)
    WHERE supplierID=1;


-- po wybraniu dostawcy i modyfikacji ceny zmieniane są ceny produktu wybranego dostawcy w taki sposób, że modyfikacja oznacza zmianę procentową ceny (np. price+price*modyfikacja)
 
 
--  Grupa opcji: dostawca, kategoria. Po wybraniu wyświetlony jest raport pokazujący nazwę produktu, nazwę dostawcy i cenę lub nazwę produktu, nazwę kategorii i cenę (w zależności od wybranej na formularzu opcji) w postaci listy tabeli 

SELECT productName, supplierName, price
FROM products
INNER JOIN suppliers ON suppliers.supplierID=products.supplierID;

SELECT productName, categoryName, price
FROM products
INNER JOIN categories ON categories.categoryID=products.categoryID;