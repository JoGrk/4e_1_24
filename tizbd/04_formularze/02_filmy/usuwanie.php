<?php
$link = new mysqli('localhost','root','','4e_1_filmy');
if(isset($_POST['filmID'])){
    $filmID = $_POST['filmID'];
    $sql = "DELETE FROM filmy
            WHERE IDfilm = $filmID";
    // if($link -> query($sql)){
    //     echo "film został usuniety";
    // } 
    $result = $link -> query($sql);
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
<h2>
    <?php
    if($result){
        echo "film zostal usuniety";
    }
    ?>
</h2>

    <a href="formularz_filmow.php">Powrót</a>
</body>
</html>
<?php
$link -> close()
?>