-- NOW()

-- 1. wyświetl aktualną datę i czas. 
SELECT NOW()
-- DATE(), TIME() - tylko  data lub tylko czas ze typu datetime


-- 2. Wyświetl w jednej kolumnie aktualną datę, w drugiej aktualny czas (wykorzystaj funkcję now)
SELECT DATE(NOW()),
TIME(NOW());

-- CURDATE()

-- 3. Wyświetl bieżącą datę systemową
SELECT current_date;
SELECT CURDATE();
-- DATE_FORMAT(data, tekst_formatujący) %m  %d  %Y

-- 4. Wyświetl aktualną datę w formacie amerykańskim (miesiąc/dzień/rok)
SELECT DATE_FORMAT(CURDATE(),"%m/%d/%Y");
-- DATEDIFF(data1, data2) - różnica w dniach między datami


-- 5. Ile dni pozostało do końca roku szkolnego
SELECT DATEDIFF ('2025-06-27',CURDATE());
-- DATE_ADD(data, INTERVAL n przedział_czasu) przedział_czasu to DAY, WEEK, MONTH, YEAR, n - ilość 

-- 6. Wyświetl dowolną datę, oraz datę dzień później, tydzień, miesiąc i rok
SELECT current_date, 
    DATE_ADD(current_date, INTERVAL 1 DAY),
    DATE_ADD(current_date, INTERVAL 1 WEEK),
    DATE_ADD(current_date, INTERVAL 1 MONTH),
    DATE_ADD(current_date, INTERVAL 1 YEAR);
    
    


-- DATE_SUB(data, INTERVAL n przedział_czasu) przedział_czasu to DAY, WEEK, MONTH, YEAR, n - ilość 

-- 7. Wyświetl dowolną datę, oraz datę dzień wcześniej, tydzień, miesiąc i rok
SELECT current_date,
    DATE_SUB(current_date, INTERVAL 1 DAY),
    DATE_SUB(current_date, INTERVAL 1 WEEK),
    DATE_SUB(current_date, INTERVAL 1 MONTH),
    DATE_SUB(current_date, INTERVAL 1 YEAR);


-- DAY(data) MONTH(data) QUARTER(data) YEAR(data) - wyciągają z daty dzień, miesiąc, kwartał i rok

-- 8. wyciągnij z dowolnej daty dzień, miesiac, kwartał, rok



-- WEEKDAY(data) wyświetla numer dnia tygodnia

-- 9. wyświetl numer aktualnego dnia tygodnia, czy tydzień zaczyna się od poniedziałku czy niedzieli?