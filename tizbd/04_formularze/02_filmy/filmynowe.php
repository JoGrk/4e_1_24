<?php
$link = new mysqli('localhost','root','','4e_1_filmy');

if(!empty($_POST['firstname']) && !empty($_POST['lastname'])){
    $firstname=$_POST['firstname'];
    $lastname=$_POST['lastname'];
    $sql="INSERT INTO rezyserzy
            (imie, nazwisko)
            VALUES
            ('$firstname', '$lastname')";
    $link->query($sql);
    }


$sql="SELECT imie, nazwisko
FROM rezyserzy";
$result=$link->query($sql);
$directors=$result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Rezyserzy</h2>
    
         <ul>
            <!-- <li>Imie Nazwisko</li> -->
            <?php
            foreach($directors as $director){
                echo"<li>{$director['imie']} {$director['nazwisko']}</li>";
            }
            ?>
        </ul> 
    

    <form action="" method="post">
        imie:
        <input type="text" name="firstname" id="firstname"><br>
        nazwisko:
        <input type="text" name="lastname" id="lastname"><br>
        <button>Wyśli</button>

    </form>
  
</body>
</html>
<?php
$link -> close();
?>