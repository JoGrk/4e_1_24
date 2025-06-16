-- Zapytanie 1: wybierające jedynie pola nazwa, ilosc, opis, cena, zdjecie z tabeli Produkty, dla produktów, których pole Rodzaje_id przyjmuje jedną z wartości: 1, 2

SELECT nazwa , ilosc , opis , cena , zdjecie
FROM Produkty
WHERE Rodzaje_id IN (1,2);

-- Zapytanie 2: wybierające jedynie nazwę produktu z tabeli Produkty i odpowiadającą mu nazwę producenta z tabeli Producenci dla produktów, dla których ilość jest mniejsza od 10 oraz pole Rodzaje_id przyjmuje wartość 1

SELECT produkty.nazwa , producenci.nazwa
FROM Produkty
INNER JOIN producenci ON produkty.Producenci_ID = producenci.id
WHERE ilosc<10 AND Rodzaje_id=1;


-- Zapytanie 3: tworzące użytkownika anna z hasłem @nna23



-- Zapytanie 4: wstawiające wiersz do tabeli Produkty według specyfikacji:
-- klucz główny nadany automatycznie
-- Rodzaje_id – id wiersza z nazwą owoce w tabeli Rodzaje
-- Producenci_id – id wiersza z nazwą warzywa-rolnik w tabeli Producenci
-- pozostałe dane: nazwa: owoc1, ilość: 10, opis: puste pole, cena: 9,99, zdjecie: owoce.jpg


INSERT INTO produkty
VALUES(NULL,(SELECT id FROM rodzaje WHERE nazwa='owoce'),(SELECT id FROM producenci WHERE nazwa='warzywa-rolnik') , 'owoc1' , 10 , '' , 9.99 ,'owoce.jpg');