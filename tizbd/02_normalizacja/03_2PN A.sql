
CREATE TABLE wypozyczenia (
    id_ksiazki char(3),
    id_czytelnika int,
    PRIMARY KEY(id_ksiazki, id_czytelnika)
)