<?php
$link = new mysqli('localhost','root','','4e_1_szkola');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    if(!empty($_POST['studentID'])){
        $studentID = $_POST['studentID'];
        $sql =" DELETE FROM uczen
            WHERE id=$studentID";
        if($link->query($sql)){
            echo "<h2>Dane zostały usunięte</h2>";
        }else{
            echo "<h2>Nie udało się</h2>";
        }
    }else{
        echo "<h2>Uzupełni dane!!!</h2>";
    }

    ?>
    <a href="szkola.php">Powrót do strony głównej</a>
</body>
</html>
<?php
$link -> close();
?>