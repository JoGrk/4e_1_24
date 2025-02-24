<?php
$link= new mysqli('localhost','root','','4e_1_wynajem');

$sql="SELECT * FROM pokoje";
$result = $link -> query($sql);
$rooms = $result -> fetch_all(1);

$sql="SELECT id_pok,nazwa,sezon
FROM pokoje
    INNER JOIN rezerwacje ON pokoje.id=rezerwacje.id_pok
WHERE liczba_dn>7;";
$result = $link -> query($sql);
$reservations = $result -> fetch_all(1);

$sql="SELECT sezon,SUM(liczba_dn) as razem_rezerwacji 
FROM rezerwacje
GROUP BY sezon";
$result = $link -> query($sql);
$reservations2 = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>pokoje</h2>
    <table>
        <tr>
            <th>id</th>
            <th>nazwa</th>
            <th>cena</th>
        </tr>
        <!-- <tr>
            <td>1</td>
            <td>jednoosobowy</td>
            <td>100</td>
        </tr> -->
    <?php
    foreach ($rooms as $room){
        echo "
        <tr>
            <td> {$room['id']} </td>
            <td>{$room['nazwa']}</td>
            <td>{$room['cena']}</td>
        </tr>
        ";
    }
    ?>


    </table>

    <h2>Rezerwacje</h2>
    <ul>
        <!-- <li>1 <strong>jednoosobowy</strong> <em>lato</em></li> -->
    <?php
    foreach ($reservations as $reservation){
        echo "
        <li>{$reservation['id_pok']}
        <strong>{$reservation['nazwa']}</strong> 
        <em>{$reservation['sezon']}</em></li>
        ";
    }
    ?>

    </ul>
    <h2>suma rezerwacji</h2>
    <!-- <h4>Lato</h4>
    <p>suma dni rezerwacji dla sezonu [sezon] wynosi [razem_rezerwacji]</p> -->

    <?php
foreach ($reservations2 as $reservation){
    echo "
    <h4>{$reservation['sezon']}</h4>
    <p>suma dni rezerwacji dla sezonu {$reservation['sezon']}
     wynosi {$reservation['razem_rezerwacji']}</p>
    ";
}

    ?>
</body>
</html>
<?php
$link-> close();
?>