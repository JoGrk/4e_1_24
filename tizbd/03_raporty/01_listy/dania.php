<?php
   $link = new mysqli('localhost', 'root', '', '4e_1_baza');

   $sql = "SELECT nazwa 
           FROM dania";
   $result = $link -> query($sql);
   $dishes = $result -> fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>dania</h1>
    <ol>
        <!-- <li>Gazpacho</li> -->
         <?php
            foreach($dishes as $dish){
                echo "<li> {$dish['nazwa']} </li>";
            }
         ?>
    </ol>
</body>
</html>

<?php
  $link -> close();
?>