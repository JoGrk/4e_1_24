<?php
$link= new mysqli('localhost', 'root', '', '4e_1_zadania');

if(!empty($_POST['taskname'])){
    $taskname=$_POST['taskname'];
    $sql = "INSERT INTO zadania
        (dataZadania , wpis , miesiac , rok )
    VALUES
        ('2020-07-13','$taskname','lipiec',2020)
    ";
    $result=$link -> query($sql);
}

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
        <!-- <section class='day'>
            <h5>2020-07-01</h5>
            <p>Projekt z programowania</p>
        </section> -->
        <?php
        foreach($days as $day){
            echo "
            <section class='day'>
                <h5>{$day['dataZadania']}</h5>
                <p>{$day['wpis']}</p>
            </section>
            ";
        }


        ?>
    </main>

    <footer>
        <form action="" method="post">
            <p>dodaj wpis</p>
            <input type="text" name="taskname" id="">
            <button>DODAj</button>
            
        </form>
        <p>Stronę wykonał:00000000</p>
    </footer>
</body>
</html>
<?php
$link -> close();
?>