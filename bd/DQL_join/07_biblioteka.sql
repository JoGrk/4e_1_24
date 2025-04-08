-- 4e_1_biblioteka

-- 1. Biblioteka potrzebuje informacji o wypożyczeniach książek. Proszę podać autorów, tytuły książek i oraz daty ich wypożyczeń.
SELECT autor_Nazwisko, tytul, Data_wypozyczenia
FROM ksiazka
JOIN Wypozyczenia ON Wypozyczenia.ksiazka_sygnatura = ksiazka.sygnatura;

-- 2. Dodaj nową książkę, aby mieć pewność, że są takie, które nigdy nie były wypożyczone. Wyświetl książki, które nigdy nie zostały wypożyczone.
INSERT INTO ksiazka
    (sygnatura, tytul, autor_Nazwisko)
VALUES 
    (2115, 'PDW', 'Kurczynski');

SELECT autor_Nazwisko, tytul
FROM ksiazka LEFT JOIN Wypozyczenia ON Wypozyczenia.ksiazka_sygnatura = ksiazka.sygnatura 
where Data_wypozyczenia  is NULL;

-- 3. Utwórz zestawienie pokazujące ile razy zostały wypożyczone książki (tytuł, autor, ilość wypożyczeń). W zestawieniu uwzględnij także te książki, które nigdy nie były wypożyczone.
SELECT tytul, autor_Nazwisko, count(ksiazka_sygnatura)
FROM ksiazka LEFT JOIN Wypozyczenia ON Wypozyczenia.ksiazka_sygnatura = ksiazka.sygnatura 
GROUP BY ksiazka.sygnatura;
-- 4. Które osoby figurujące w bazie jako czytelnicy, nie wypożyczyły ani razu choćby jednej książki?
SELECT Czytelnik_Nazwisko
FROM czytelnik
    LEFT JOIN Wypozyczenia ON czytelnik.ID = Wypozyczenia.Czytelnik_ID
WHERE Data_wypozyczenia IS NULL;
-- 5.  Jacy czytelnicy nie są przypisani do żadnego wydziału
SELECT Czytelnik_Nazwisko
FROM czytelnik
    LEFT JOIN wydzial ON wydzial.ID = czytelnik.wydzial
WHERE wydzial.wydzial IS NULL;
-- 6. Wyświetl ranking czytelników pokazujący wszystkich z informacja, ile razy wypożyczyli cokolwiek (lista ma zawierać wszystkich czytelników – nawet tych, którzy nic nie wypożyczyli)