-- 1. Klienci, którzy niczego nie zamówili
SELECT CustomerName
FROM Customers
LEFT JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE OrderID IS NULL;

-- 2. Towary, które nie zostały kupione
SELECT ProductName
FROM products
LEFT JOIN order_details ON order_details.ProductID = products.ProductID
WHERE OrderID IS NULL;
-- 3. czy są dostawcy, którzy nic nie dostarczyli?
SELECT SupplierName
FROM suppliers
        LEFT JOIN products ON suppliers.SupplierID = products.SupplierID
WHERE ProductID IS NULL;
-- 4. Ile zamówień obsłużyli poszczególni pracownicy? Wyświetl dane malejąco według ilości zamówień. Czy są pracownicy, którzy nic nie obsłużyli?
SELECT LastName, COUNT(OrderId)
FROM employees
    LEFT JOIN orders ON orders.EmployeeID = employees.employeeID
GROUP BY orders.employeeID
ORDER BY COUNT(OrderID) desc;
-- 5. wszystkich pracowników,  daty zamówień, wszystkich klientów
SELECT LastName, OrderDate, CustomerName
FROM employees
    LEFT JOIN orders ON orders.employeeID=employees.employeeID
    RIGHT JOIN customers ON customers.CustomerID=orders.CustomerID;
-- 6. interesują nas zamówienia klientów z Francji, Niemiec, Włoch. Wyświetl nazwę klienta, ilość zamówień. Uwzględnij także klientów, którzy nic nie zamawiali.

SELECT CustomerName , COUNT(OrderID)
FROM customers
LEFT JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE country IN ('France','Germany','Italy')
GROUP BY CustomerName;




-- 7. Oblicz ile sztuk poszczególnych towarów zostało zamówione (zsumuj pole Quantity z  tabeli OrderDetails. Podaj nazwę towaru, cenę, łączną zamówioną ilość. Zestawienie posortuj według zamówionych ilości, uwzględnij tylko ilości mniejsze od 10. Uwzględnij tylko zamówione towary

-- 8. Oblicz łączną wartość zamówionych towarów (wykorzystaj pole cena i quantity). Wyświetl nazwę towaru, zamówioną wartość, dane posortuj malejąco według wartości towarów, wyświetl tylko pierwsze 10 wierszy

-- 9. Ile razy były zamawiane poszczególne towary? Wyświetl nazwę kategorii, nazwę towaru, policz ilość zamówień. Uwzględnij tylko zamówienia z 1997 roku. Wyświetl tylko te towary, które były zamawiane rzadziej niż 5 razy, w tym te, które nie zostały zamówione ani razu. Dane posortuj według nazwy kategorii, a następnie nazwy towaru