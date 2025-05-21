<!-- Dwie grupy opcji: od i do. W pierwszej opcje cena minimalna i średnia (obliczone na podstawie danych z bazy), w drugiej opcje cena średnia i maksymalna. Następnie powinny być wyświetlone produkty o cenie mieszczącej się w wybranym zakresie cenowym. -->
 <?php
$link=new mysqli ('localhost','root','','w3schools');
$sql="SELECT MIN(price) AS min, MAX(price) AS max, AVG(price) AS avg
FROM products;";
$result=$link->query($sql);
$ceny=$result->fetch_array();


 ?>
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 </head>
 <body>
    <form action="" method="post">
        <section>
            
            <h2>Cena od</h2>
            <input type="radio" name="min" id="min" value="2.5">
            <label for="min">minimalna = 2.5</label><br><br>
            <input type="radio" name="min" id="min_average" value="28.9">
            <label for="min_average">średnia = 28.9</label>
        </section>
        <section>
            <h2>Cena do</h2>
            <input type="radio" name="max" id="max_average" value="28.9">
            <label for="max_average">średnia = 28.9</label><br><br>
            <input type="radio" name="max" id="max" value="263.5">
            <label for="max">maksymalna = 263.5</label>
        </section><br>
        <input type="submit" value="Wyślij">
    </form>
 </body>
 </html>

<?php
    $link->close();
?>