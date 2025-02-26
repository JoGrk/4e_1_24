<?php
    $link= new mysqli('localhost','root' ,'','4e_1_hodowla');
    
    $sql = "SELECT rasa FROM rasy";
    $result = $link -> query($sql);
    $rasy = $result -> fetch_all(1);

    $sql = "SELECT DISTINCT data_ur, miot, rasa
        FROM swinki
        INNER JOIN rasy ON swinki.rasy_id=rasy.id
        WHERE rasy_id = 1; ";
    $result = $link -> query($sql);
    $peruwianki = $result -> fetch_all(1);

    $sql = "SELECT imie, cena, opis 
    FROM swinki
    WHERE rasy_id = 1;";
    $result = $link -> query($sql);
    $ceny = $result -> fetch_all(1);

    $sql = "SELECT imie, miot
        FROM swinki
        WHERE data_ur LIKE '%-07-%'";
    $result = $link -> query($sql);
    $lipcoweswinki = $result -> fetch_all(1);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>Poznaj wszystkie rasy świnek morskich</h3>
    <ol>
        <!-- <li>peruwianka</li> -->
        <?php
        foreach($rasy as $rasa){
            echo "<li>{$rasa['rasa']}</li>";
        }
        ?>
    </ol>
    <h1>Świnka morska rasy peruwianka</h1>
        <!-- <h2>Rasa: peruwianka</h2>
        <p>Data urodzenia: 2022-06-2</p>
        <p>Oznaczenie miotu: I5</p> -->
        <?php
        foreach($peruwianki as $peruwianka){
            echo "
            <h2>Rasa: {$peruwianka['rasa']}</h2>
            <p>Data urodzenia: {$peruwianka['data_ur']}</p>
            <p>Oznaczenie miotu: {$peruwianka['miot']}</p>
            ";
        }
        ?>
    <h2> Ceny </h2>
    <!-- <h3>Cindy - 200zł</h3>
    <p>Opis</p> -->
    <?php
    foreach ($ceny as $cena){
        echo "
            <h3>{$cena['imie']} - {$cena['cena']}zł</h3>
            <p>{$cena['opis']}</p>
        ";
    }
    ?>

    <h2>Swinki urodzone w lipcu</h2>
    <table>
        <tr>
            <th>Imie</th>
            <th>miot</th>
        </tr>
        <!-- <tr>
            <td>Ed</td>
            <td>C4</td>
        </tr> -->
    </table>

</body>
</html>
<?php 
    $link -> close();
?>