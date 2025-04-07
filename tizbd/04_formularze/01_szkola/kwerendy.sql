SELECT * FROM uczen;
-- A. Zmieniające miasto urodzenia ucznia o id 10 na Bydgoszcz
UPDATE uczen
SET miejsce_urodzenia = 'Bydgoszcz' 
WHERE id=10;
-- B.  Usuwające ucznia o id 26
 
 DELETE FROM uczen
 WHERE id=26;