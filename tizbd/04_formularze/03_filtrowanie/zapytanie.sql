SELECT ProductName, CategoryName, Price
FROM products
JOIN categories ON products.CategoryID=categories.CategoryID;


SELECT ProductName, CategoryName, Price
FROM products
JOIN categories ON products.CategoryID=categories.CategoryID
WHERE Price BETWEEN 10 AND 50;



SELECT SupplierID, SupplierName
FROM suppliers;

SELECT ProductName, Price
FROM products;

SELECT ProductName, Price
FROM products
WHERE supplierID=1;

SELECT ShipperID, ShipperName
FROM shippers;

SELECT OrderID , OrderDate
FROM orders;

SELECT OrderID , OrderDate
FROM orders
WHERE shipperID=1;