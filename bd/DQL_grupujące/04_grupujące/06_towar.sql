-- 1. policz ilość wszystkich rekordów (zapisów) ;
SELECT COUNT(*)
FROM towar;
-- 2. z opisami - największą i najmniejsza CENĘ, oraz średnią arytmetyczną CENY ;
SELECT MAX(cena),MIN(cena),AVG(cena) FROM towar;
-- sumę wartości towarów, średnią arytmetyczną wartości (ILOSC * CENA) ;

-- policz średnią arytmetyczną ceny, a później policz ręcznie średnią arytmetyczną ceny = suma CENY / ilość rekordów. 

-- Wyświetl średnią cenę wszystkich towarów o cenie pomiędzy 10 a 1000 zł

-- wyświetl sumę masy (ilosc * waga) , ale tylko dla rodzaju  GD i TR

-- Wyświetl łączną ilość wszystkich zamówionych produktów,

-- wyświetl największą wartość (ilosc * cena)  towarów wyprodukowanych w 1997 roku

-- policz ile rekordów jest w każdym RODZAJU 

-- policz ile rekordów jest w każdym RODZAJU, posortuj malejąco wg RODZAJU;

-- policz sumę i średnią arytmetyczną wartości (ilość * cena) i minimalnej i maksymalnej masie (ilość * waga) dla każdego RODZAJU towaru ;

-- policz ile rekordów jest w każdym RODZAJU - wyświetl ilości rekordów większe od 15 ;

-- policz średnią arytmetyczną ceny dla każdego RODZAJU - wyświetl średnie mniejsze od 500;

-- dla każdego rodzaju towarów wyświetl ilość rekordów, średnią wagę, średnią ilość, maksymalną i minimalną cenę dla ilości rekordów w RODZAJU mniejszej od 15.

-- dla każdego rodzaju towarów wyświetl maksymalną cenę dla ilości rekordów w RODZAJU większe od 10. Uwzględnij tylko towary zamówione.

-- Oblicz minimalną cenę towarów niezamówionych dla każdego rodzaju. 

-- oblicz średnią cenę towarów zamówionych (zamow) i nie zamówionych

-- oblicz średnią cenę towarów wyprodukowanych w 1999 roku  dla poszczególnych rodzajów towaru