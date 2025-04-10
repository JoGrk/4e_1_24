<?php 
$link= new mysqli('localhost','root','','4e_1_filmy');

$sql="SELECT tytul,Nazwisko
FROM filmy
    INNER JOIN rezyserzy ON filmy.RezyserID = rezyserzy.IDRezyser;";
$result=$link->query($sql);
$movies=$result->fetch_all(1);

$sql="SELECT imie,nazwisko,COUNT(IDfilm) as ilosc 
FROM rezyserzy
    LEFT JOIN filmy ON filmy.RezyserID = rezyserzy.IDRezyser
GROUP BY IDRezyser;";
$result=$link->query($sql);
$directors=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <!-- <tr>
            <td>tytul</td>
            <td>nazwisko</td>
        </tr> -->
        <?php
    foreach($movies as $movie){
        echo "
        <tr>
            <td>{$movie['tytul']}</td>
            <td>{$movie['Nazwisko']}</td>
        </tr>";
    }
        ?>
    </table>

    <ul>
    <?php
    foreach($directors as $director){
        echo "<li>{$director['imie']} {$director['nazwisko']} {$director['ilosc']}</li>";
    }
    ?>
    </ul>
</body>
</html>
<?php 
$link->close();
?>