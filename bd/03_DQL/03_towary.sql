-- Towary, których WAGA >150 kg;
SELECT * 
FROM towar
WHERE waga >150; 
-- całkowita wartość pola CENA jest trzycyfrowa;
SELECT *
FROM towar
where cena>=100 and cena<1000;
-- 23% podatek od jednej sztuki wynosi więcej niż 750 zł;
SELECT *
FROM towar
WHERE cena*0.23>750;
-- CENA < 10 zł., lub CENA >10000 zł i równocześnie ILOSC < 5;
SELECT *
FROM towar
WHERE (cena <10 OR cena > 10000)AND ILOSC <5;
-- cena 1 kg (CENA / WAGA) jest mniejsza od 10 zł i równocześnie większa od 5 zł;
SELECT *
FROM towar
WHERE (cena/waga)<10 AND (cena/waga)>5;
-- całkowita masa (ILOSC * WAGA) jest większa od ceny, a mniejsza od potrójnej ceny;
SELECT *
FROM towar
WHERE (ILOSC*waga)>cena AND (ILOSC*waga)<cena*3;

-- tylko ZAMÓWIONE towary, których waga =1;

SELECT *
FROM towar
WHERE zamow='prawda' and waga=1;

-- nazwy towarów, których RODZAJ = NA i GD (również małymi literami);
SELECT *
FROM towar
WHERE RODZAJ = 'NA' OR RODZAJ = 'GD';
-- wyświetl nazwy towarów, które nie zawierają litery a w NAZWIE;
SELECT *
FROM towar
WHERE nazwa NOT LIKE '%a%';
-- Wyprodukowane w 1997 roku;
SELECT *
FROM towar
WHERE DATA_PROD LIKE '1997-%';
-- (DATA_PROD - od początku 1995 roku do końca 1998,) CENA jest dwucyfrowa, WAGA < 0.5;
SELECT *
FROM towar
WHERE DATA_PROD BETWEEN '1995-01-01' AND '1998-12-31'
    AND cena BETWEEN '10' AND '99'
    AND waga < 0.5;
-- jw. wyświetl tylko NAZWĘ, RODZAJ I CENĘ;
SELECT nazwa, rodzaj, cena
FROM towar
WHERE DATA_PROD BETWEEN '1995-01-01' AND '1998-12-31'
    AND cena BETWEEN '10' AND '99'
    AND waga < 0.5;
-- rekordy w których CENA jest pomiędzy 12,50 a 35 i WAGA jest pomiędzy 0,5 a 2,5;
SELECT *
FROM towar
WHERE cena BETWEEN 12.50 AND 35
    AND waga BETWEEN 0.5 AND 2.5;
-- jw. - wyświetl tylko NAZWĘ, RODZAJ i wartość (ILOSC * CENA) ;
SELECT Nazwa,Rodzaj,(ilosc*cena)
FROM towar
WHERE cena BETWEEN 12.50 AND 35
    AND waga BETWEEN 0.5 AND 2.5;
-- jw. posortowane malejąco wg NAZWY ; 

-- różne RODZAJE towarów (bez powtórek) ; (wskazówka: SELECT DISTINCT...)