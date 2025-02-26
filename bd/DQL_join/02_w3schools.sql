-- . Wyświetl nazwy firm klientów  i daty zamówień
 SELECT CustomerName,OrderDate
 FROM customers
    INNER JOIN orders ON customers.customerID=orders.customerID;
-- 2, Wyświetl dane spedytora z datą zamówienia
SELECT ShipperName,OrderDate
FROM orders
    INNER JOIN shippers ON orders.ShipperID=shippers.ShipperID;
-- 3. Wyświetl nazwiska pracowników i daty zamówień
 SELECT LastName ,OrderDate
 FROM orders
    INNER JOIN Employees ON orders.EmployeeID=employees.EmployeeID;
-- 4. Wyświetl nazwy towarów, nazwy kategorii
 SELECT ProductName, CategoryName
 FROM products
    INNER JOIN categories ON categories.CategoryID=products.CategoryID;
-- 5. Wyświetl nazwy towarów, nazwy kategorii i idzamówień
 SELECT ProductName, CategoryName, OrderID
 FROM products
    INNER JOIN categories ON categories.CategoryID=products.CategoryID
    INNER JOIN order_details ON order_details.ProductID = products.ProductID;
-- 6. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i idklienta
 SELECT ProductName, CategoryName, OrderDate, customerID
 FROM products
    INNER JOIN categories ON categories.CategoryID=products.CategoryID
    INNER JOIN order_details ON order_details.ProductID = products.ProductID
    INNER JOIN orders ON order_details.OrderID=orders.OrderID;
-- 7. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i nazwę firmy klienta
 SELECT ProductName, CategoryName, OrderDate, CustomerName
 FROM products
    INNER JOIN categories ON categories.CategoryID=products.CategoryID
    INNER JOIN order_details ON order_details.ProductID = products.ProductID
    INNER JOIN orders ON order_details.OrderID=orders.OrderID
    INNER JOIN customers ON customers.customerID=orders.customerID;
-- 8. Ile razy był zamawiany dany produkt? (podaj nazwy produktów)
SELECT ProductName,COUNT(*)
FROM products
    INNER JOIN order_details ON order_details.ProductID=products.ProductID
GROUP BY order_details.ProductID;
-- 9. Wyświetl nazwy firm klientów, daty zamówień i nazwy towarów
SELECT CustomerName,OrderDate,ProductName
FROM customers
    INNER JOIN orders ON customers.CustomerID=orders.CustomerID
    INNER JOIN order_details ON orders.OrderID=order_details.OrderID
    INNER JOIN products ON order_details.ProductID=products.ProductID;
