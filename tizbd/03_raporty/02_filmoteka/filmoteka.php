<?php
$link = new mysqli('localhost','root','','4e_2_filmoteka');

$sql="SELECT Tytul
FROM filmy
WHERE Gatunek = 'SF'";
$result=$link -> query($sql);
$movies=$result -> fetch_all(1);

$sql="SELECT Tytul, Imie, Nazwisko
FROM filmy
    JOIN rezyserzy ON filmy.RezyserID= rezyserzy.IDRezyser ";
$result=$link -> query($sql);
$movies2=$result -> fetch_all(1);

$sql="SELECT tytul, gatunek, tresc
FROM filmy
    JOIN recenzje ON filmy.recenzjaID= recenzje.IDRecenzja;";
$result=$link -> query($sql);
$movies3=$result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <h2>Tytuły Filmów</h2>
    <ol>
        <!-- <li>Gwiezdne Wojny</li> -->
        <?php
        foreach($movies as $movie){
            echo "<li> {$movie['Tytul']} </li>";
        }
        ?>
    </ol>

    <h2>tytuly i rezyserzy</h2>
    <ul>
        <!-- <li> <strong> gwiezdne wojny </strong> George Lucas</li> -->
         <?php
        foreach($movies2 as $movie){
            echo "<li> <strong> {$movie['Tytul']} </strong>
             {$movie['Imie']} {$movie['Nazwisko']}</li>";
        }
         ?>
    </ul>

    <h2>Recenzje</h2>
    <table>
        <tr>
            <th>Tytul</th>
            <th>Gatunek</th>
            <th>Treść</th>
        </tr>
        <!-- <tr>
            <td>Matrix</td>
            <td>SF</td>
            <td>Dobry film</td>
        </tr> -->
        <?php
        foreach ($movies3 as $movie){
            echo "        
            <tr>

            <td> {$movie['tytul']} </td>
            <td>{$movie['gatunek']}</td>
            <td>{$movie['tresc']}</td>
            
            </tr>";

        }
        ?>
    </table>
</body>

</html>
<?php
$link -> close();
?>