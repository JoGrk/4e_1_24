mysql -u root
-- 1. Utwórz bazę danych Studenci i przejdź do niej.
 CREATE DATABASE studenci;
 use studenci;
-- 2. Utwórz tabelę studenci. Tabela powinna zawierać następujące kolumny:


-- id_studenta - identyfikator studenta , 4 znaki, stała szerokość, klucz główny,
-- nazwisko - nazwisko studenta, 25 znaków, wartość wymagana (NOT NULL),
-- imie - imię studenta, 25 znaków,

CREATE TABLE studenci (
    id_studenta char(4) PRIMARY KEY,
    nazwisko varchar(25) NOT NULL,
    imie varchar(25)
);

-- 3. Utwórz tabelę oceny. Tabela powinna zawierać następujące kolumny:
-- id_studenta - identyfikator studenta, który otrzymał ocenę, 4 znaki,
-- nazwa przedmiotu - 25 znaków,
-- ocena - liczba, domyślnie 3
-- dzien - data wystawienia oceny,
-- identyfikator studenta i nazwa przedmiotu tworzą klucz główny tabeli.

CREATE TABLE oceny(
    id_studenta char(4),
    nazwa_przedmiotu varchar(25),
    ocena int default 3,
    dzien date,
    PRIMARY KEY(id_studenta,nazwa_przedmiotu)
);
 
-- 4. Wyświetl opisy (desc) obu tabel
 DESC studenci;
 DESC oceny;
-- 5. Wstaw dane dwóch studentów i trzy oceny
INSERT INTO studenci
(id_studenta,nazwisko,imie)
VALUES 
('1312','Gruboń','Paweł'),
('4200','Nowicki','Piotr');
INSERT INTO oceny
(id_studenta,nazwa_przedmiotu,ocena,dzien)
VALUES
('1312','POLSKI',1,'2024-09-13'),
('4200','WF',5,'2024-09-13');
SELECT * FROM studenci;
SELECT * FROM oceny;

-- 6 usunac ocene z polskiego
DELETE FROM oceny
WHERE nazwa_przedmiotu='POLSKI';

7.usun studenta

DELETE FROM studenci
WHERE id_studenta='4200';
