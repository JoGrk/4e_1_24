-- W Bajtkowie trwa rekrutacja dzieci do przedszkoli prowadzona za pośrednictwem systemu komputerowego. Rodzice wybierają maksymalnie trzy przedszkola, a ich kolejność ustalają na liście preferencji. W plikach  dzieci.txt i przedszkola.txt  zebrano dane o dzieciach, ich listach preferencji oraz przedszkolach biorących udział w rekrutacji. 

 
-- 1.  Wykonaj zapytania sql wyszukujące odpowiedzi na poniższe pytania:
-- A. Ile jest chętnych do przyjęcia do poszczególnych przedszkoli? Wyświetl nazwę przedszkola i ilość chętnych.

SELECT nazwa_przedszkola, COUNT(*)
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
GROUP BY dzieci.Id_przedszkola;


-- B. Ilu jest chętnych do przyjęcia do poszczególnych przedszkoli, uwzględnij wyłącznie trzylatków

SELECT nazwa_przedszkola , COUNT(*)
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
WHERE wiek = 3
GROUP BY dzieci.Id_przedszkola;


-- C. Wyświetl imiona i nazwiska dzieci, które mają na liście preferencji przedszkole mające w nazwie "Zuch". 
SELECT imie, nazwisko, nazwa_przedszkola
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
WHERE przedszkola.nazwa_przedszkola LIKE '%Zuch%'; 
 
-- D. Wyświetl imiona i nazwiska dzieci, które chodzą do przedszkola o identyfikatorze 16, 14, 8,28, 27 . Użyj operatora IN.
SELECT imie, nazwisko, nazwa_przedszkola
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
WHERE przedszkola.Id_przedszkola IN (16,14,8,28,27);
-- E. Zmodyfikuj zapytanie z części D tak, aby zamiast numerów przedszkoli były wyświetlane ich nazwy.
SELECT imie, nazwisko, nazwa_przedszkola
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
WHERE przedszkola.Id_przedszkola IN (16,14,8,28,27);
 
-- F. Policz, ilu jest kandydatów do poszczególnych przedszkoli (wystarczą identyfikatory, uwzględnij tylko chłopców. Dane uporządkuj malejąco według ilości chętnych. Wyświetl tylko te wiersze, w których  ta ilość jest większa od 15.

SELECT Id_przedszkola, COUNT(*)
FROM dzieci
WHERE plec = 'chlopiec'
GROUP BY Id_przedszkola
HAVING COUNT(*) > 15
ORDER BY COUNT(*) desc;
-- G. Policz, ilu jest chętnych do poszczególnych przedszkoli. Wyświetl nazwy przedszkoli i liczbę miejsc w przedszkolach. Czy są takie przedszkola, w których liczba chętnych jest różna od ilości miejsc? 
 SELECT nazwa_przedszkola, przedszkola.Id_przedszkola, Liczba_miejsc, COUNT(*)
 FROM przedszkola
 INNER JOIN dzieci ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola 
 GROUP BY przedszkola.Id_przedszkola
 HAVING COUNT(*) != Liczba_miejsc;

 
-- H. Utwórz uporządkowaną alfabetycznie według nazwisk, listę pięcioletnich dziewczynek, które są zapisane do przedszkola Smerf lub Stokrotka.
SELECT nazwisko, imie
FROM dzieci
    JOIN przedszkola ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola
WHERE wiek=5 AND plec="dziewczynka"
    AND (nazwa_przedszkola LIKE "%Smerf%" OR nazwa_przedszkola LIKE "%Stokrotka%0");
-- I.  Podaj nazwy czterech przedszkoli, które mają największą ilość chętnych (uporządkowane malejąco według ilości chętnych) 
SELECT nazwa_przedszkola, COUNT(*)
FROM przedszkola
INNER JOIN dzieci ON przedszkola.Id_przedszkola = dzieci.Id_przedszkola 
GROUP BY nazwa_przedszkola
ORDER BY COUNT(*) DESC 
LIMIT 4;