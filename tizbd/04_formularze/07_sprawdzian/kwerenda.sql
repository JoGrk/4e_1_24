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
