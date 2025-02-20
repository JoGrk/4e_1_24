<?php
$link=new mysqli('localhost','root','','biblioteka');
$sql="SELECT imie,nazwisko
FROM czytelnicy
ORDER BY nazwisko";
$result=$link -> query($sql);
$readers=$result -> fetch_all(1);

$sql="SELECT tytul
FROM ksiazki
    JOIN kategorie ON ksiazki.id_kategoria=kategorie.id
WHERE nazwa='dramat';";
$result=$link -> query($sql);
$books=$result -> fetch_all(1);

$sql="SELECT tytul
FROM ksiazki
    JOIN wypozyczenia ON ksiazki.id=wypozyczenia.id_ksiazka
WHERE id_czytelnik=2;";
$result=$link -> query($sql);
$books2=$result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>czytelnicy</h2>
    <!-- <p>Olga <strong>Domys</strong> </p> -->

    <?php
    foreach($readers as $reader){
        echo "<p>{$reader['imie']} <strong>{$reader['nazwisko']}</strong> </p>";

    }
    ?>

    <h2>tytuly dramatu</h2>
    <ul>
        <!-- <li>Zemsta</li> -->
         <?php
         foreach($books as $book){
            echo "<li>{$book['tytul']}</li>";
         }
         ?>
    </ul>
    
    <h2>tytuly wypozyczone</h2>
    <ol>
        <!-- <li>Zemsta</li> -->
         <?php
         foreach($books2 as $book){
            echo "<li>{$book['tytul']}</li>";
         }
         ?>
    </ol>





    
    
</body>
</html>
<?php
$link -> close();
?>