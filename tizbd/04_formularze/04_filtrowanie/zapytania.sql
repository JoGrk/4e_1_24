<!-- 1. Lista rozwijana z nazwami krajów z których pochodzą klienci (tylko tych krajów)

SELECT country
FROM customers;

SELECT customerName
FROM customers;


SELECT customerName
FROM customers
WHERE country='Poland';

SELECT MIN(price) AS min, MAX(price) AS max, AVG(price) AS avg
FROM products;