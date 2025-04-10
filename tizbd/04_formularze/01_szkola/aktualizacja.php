<?php
$link = new mysqli('localhost','root','','4e_1_szkola');

$message = '';
if(!empty($_POST['studentID']) && !empty($_POST['birthplace'])){
    $studentID=$_POST['studentID'];
    $birthplace=$_POST['birthplace'];
    $sql="UPDATE uczen
        SET miejsce_urodzenia = '$birthplace'
        WHERE id=$studentID
    ";
    if($link -> query($sql)){
        $message = 'Dane zostały zmodyfikowane';
    }
    else{
        $message = "Błąd!";
    }
}
else{
    $message = "Uzupełnij wszystkie pola!";
}
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
        echo "<h2>$message</h2>";
    ?>
    <a href="szkola.php">Powrót do strony głównej</a>
</body>
</html>
<?php
$link -> close();
?>