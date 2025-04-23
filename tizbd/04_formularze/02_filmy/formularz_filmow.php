<?php
    $link = new mysqli('localhost','root','','4e_1_filmy');
    $sql="SELECT * FROM filmy";
    $result = $link->query($sql);
    $films = $result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="Usuwanie.php" method="post">
        <label for="filmID">Wybierz film</label>
        <select name="filmID" id="filmID">
            <!-- <option value="1">Matrix</option>
            <option value="2">Gwiezdne Wojny</option> -->
            <?php
            foreach($films as $film){
                echo "
                <option value='{$film['IDFilm']}'>{$film['Tytul']}</option>
                ";
            }
            ?>
        </select>
        <button>Usun film</button>
    </form>
</body>
</html>
<?php
    $link ->close();
?>