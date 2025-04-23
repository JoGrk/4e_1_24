-- 1. Wyświetl nazwisko i imię oraz adres osób które:
--A. płacą mniej niż 50;
SELECT imie, nazwisko, oplaty
FROM osoba
INNER JOIN dom ON osoba.nrtel=dom.nrtel
WHERE oplaty<50;
-- B. mieszkają w miejscowości o numerze 1, 2, 3;
SELECT imie, nazwisko, oplaty
FROM osoba
INNER JOIN dom ON osoba.nrtel=dom.nrtel
WHERE nrmiejscow IN(1,2,3);
-- C. są głównymi abonentami;
SELECT imie, nazwisko, oplaty
FROM osoba
INNER JOIN dom ON osoba.nrtel=dom.nrtel
WHERE Czy_glowny='Prawda';

--2 Wyświetl nazwisko, imię i zawód osób, które:
--A płacą za telefon między 40 a 80;

SELECT imie, nazwisko, zawod
FROM osoba
INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
INNER JOIN dom ON osoba.nrtel=dom.nrtel
WHERE oplaty BETWEEN 40 and 80; 

--B mieszkają w miejscowości, której nazwa zaczyna się na ' P' lub na 'K';
SELECT imie, nazwisko, zawod
FROM osoba
    INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
    INNER JOIN dom ON osoba.nrtel=dom.nrtel
    INNER JOIN miejscow ON miejscow.nrmiejscow=dom.nrmiejscow
WHERE nazwa LIKE 'P%' OR nazwa LIKE 'K%';

--C w numerze telefonu występuje cyfra 3 na trzecim miejscu;
SELECT imie, nazwisko, zawod
FROM osoba
    INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
WHERE NRTEL LIKE '__3%';


--3 Wyświetl nr telefonu, nazwisko, miejscowość adres i zawód osoby, która:
--A pracują w miejscu, gdzie w polu NAZWA znajduje się litera 'u';
SELECT dom.nrtel, nazwisko, nazwa , adres , zawod
FROM osoba
    INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
    INNER JOIN dom ON osoba.nrtel=dom.nrtel
    INNER JOIN miejscow ON miejscow.nrmiejscow=dom.nrmiejscow
WHERE nazwa LIKE '%U%';
--B mieszka w miejscowości, w której serwis prowadzi firma, której nazwa kończy się na 'A' (lub 'a') i w polu ADRES ma literę 'o';
SELECT dom.nrtel, nazwisko, nazwa , adres , zawod
FROM osoba
    INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
    INNER JOIN dom ON osoba.nrtel=dom.nrtel
    INNER JOIN miejscow ON miejscow.nrmiejscow=dom.nrmiejscow
WHERE serwis LIKE '%a' AND adres LIKE '%o%';
--C pole SYMBZATR kończy się dużą lub małą literą 'm' lub 'k' ;
SELECT dom.nrtel, nazwisko, nazwa , adres , zawod
FROM osoba
    INNER JOIN praca ON osoba.SYMBZATR=praca.SYMBZATR
    INNER JOIN dom ON osoba.nrtel=dom.nrtel
    INNER JOIN miejscow ON miejscow.nrmiejscow=dom.nrmiejscow
WHERE praca.SYMBZATR Like '%m' OR praca.SYMBZATR Like '%k';