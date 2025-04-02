<?php
$link= new mysqli('localhost', 'root', '', '4e_1_zadania');

$sql="SELECT miesiac , rok
FROM zadania
WHERE dataZadania='2020-07-01'";
$result=$link -> query($sql);
$dates=$result -> fetch_all(1);

$sql="SELECT dataZadania, wpis
FROM zadania
WHERE miesiac='lipiec'";
$result=$link -> query($sql);
$days=$result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="pl">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mój kalendarz</title>
    <link rel="stylesheet" href="styl6.css">
</head>
<body>
    <header>
        <section class="first">
            <img src="logo1.png" alt="Mój kalendarz">
        </section>

        <section class="second">
            <h1>KALENDARZ</h1>
            <!-- skrypt 1 -->
            <h3>
            <?php
                $date=$dates[0];
                echo "miesiąc:  {$date['miesiac']}, rok: {$date['rok']}"
            ?>
            </h3>
        </section>
    </header>

    <main>
        <!-- skrypt 2 -->
    </main>

    <footer>
        <p>Stronę wykonał:00000000</p>
    </footer>
</body>
</html>
<?php
$link -> close();
?>