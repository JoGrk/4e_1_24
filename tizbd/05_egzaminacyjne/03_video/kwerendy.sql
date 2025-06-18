SELECT id, nazwa, opis, zdjecie
FROM produkty 
WHERE id IN (18, 22, 23, 25);

SELECT id, nazwa, opis, zdjecie
FROM produkty 
WHERE rodzaje_id = 12;


SELECT produkty.nazwa, rodzaje.nazwa 
FROM produkty
JOIN rodzaje ON rodzaje.id=produkty.rodzaje_id
WHERE opis LIKE '%Leia%';

DELETE FROM produkty
WHERE id = 15;