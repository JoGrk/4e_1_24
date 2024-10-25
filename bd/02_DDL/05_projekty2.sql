-- Utwórz tabelę projekty z polami:
--  id_projektu, liczba, autonumerowanie, klucz podstawowy
--  nazwa_projektu tekst do 255 znaków, pole nie może być puste
-- start_projektu data
-- koniec_projektu data
-- koszt dokładne wartości liczbowe, do 500000, z dokładnością do dwóch miejsc po przecinku
-- utworzony stempel czasowy (data i czas), wartością domyślną jest current_timestamp

CREATE TABLE projekty (
    id_projektu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_projektu varchar(255) NOT NULL,
    start_projektu date,
    koniec_projektu date,
    koszt DEC (8, 2),
    stempel TIMESTAMP DEFAULT current_timestamp 
);

-- Utwórz tabelę etapy_projektu
-- id_etapu liczba, autonmerowanie
-- id_projektu liczba
-- opis_etapu tekst do 255 znaków, nie może być pusty
-- numer_etapu liczba z zakresu od 0 do 255
-- ukonczony wartość logiczna (prawda, fałsz)
-- klucz podstawowy na pola id_etapu i id_projektu
-- klucz obcy na polu id_projektu odwołujący się do tabeli projekty

CREATE TABLE etapy_projektu(
    id_etapu int AUTO_INCREMENT,
    id_projektu int,
    opis_etapu varchar(255) NOT NULL,
    numer_etapu TINYINT,
    ukonczony boolean,
    PRIMARY KEY (id_etapu, id_projektu),
    FOREIGN KEY (id_projektu) REFERENCES projekty (id_projektu)
);

CREATE TABLE posty(
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tytul varchar(255) NOT NULL,
    tresc BLOB NOT NULL,
    kategoria ENUM('technologia','edukacja') NOT NULL,
    czas_utworzenia datetime DEFAULT current_timestamp  
);
