-- Na podstawie bazy Bank

-- ODDZIAŁY
-- NrRozlicz (klucz)
-- Miejscowo

-- PRACOWNICY
-- Nr (klucz)
-- Nazwisko
-- Imi

-- PRODUKTY
-- Nazwa (klucz)
-- Punktacja

-- WYRÓŻNIENI
-- Nr (klucz)

-- Proste zapytania
-- 1.Imiona i nazwiska wszystkich pracowników banku posortowane alfabetycznie.

-- 2.Wszstkie produkty o punktacji co najmniej 5.

-- 3.Imiona i nazwiska wszystkich pracowników banku, których nazwiska rozpoczynają się literą 'P' (posortowane alfabetycznie).

-- 4.Dane pracowników banku (nr, imię, nazwisko), których nazwiska lub imiona rozpoczynają się literą 'J' (posortowane wg numerów).

-- Funkcje agregacyjne: SUM(), AVG(), MAX(), MIN(), COUNT(*)
-- 1.Łączna liczba sprzedanych produktów.

-- 2.Minimalna (niezerowa), maksymalna i średnia liczba punktów przypadających na jednego pracownika banku.

-- 3.Liczba pracowników banku.

-- 4.Liczba pracowników regionu 'Północ'.

-- GROUP BY i HAVING
-- 1.Nr oddziału, miejscowość oraz liczba pracowników w oddziale.

-- 2.Nr oddziału, miejscowość oraz liczba pracowników w oddziale (tylko dla miejscowości 'Wrocław').

-- 3.Nazwa regionu i liczba pracowników w regionie.

-- 4.Imię, nazwisko, suma punktów przypadających na pracownika.

-- 5.Nazwa produktu, liczba sprzedanych produktów (tylko jeśli przekracza 5).

-- 6.Imiona i nazwiska pracowników, którzy sprzedali większą liczbę rachunków firmowych niż wynosi średnia sprzedaż tych rachunków przypadająca na jednego pracownika.