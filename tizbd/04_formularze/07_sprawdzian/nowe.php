 <!-- Grupa opcji: dostawca, kategoria. Po wybraniu wyświetlony jest raport pokazujący nazwę produktu, nazwę dostawcy i cenę lub nazwę produktu, nazwę kategorii i cenę (w zależności od wybranej na formularzu opcji) w postaci listy tabeli  -->
<?php
$link= new mysqli('localhost', 'root','','w3schools');

$suppcat_f=$_POST['suppcat_f'] ?? NULL;
// var_dump($suppcat_f);
if($suppcat_f=='supplier'){
    $sql="SELECT productName, supplierName, price
        FROM products
        INNER JOIN suppliers ON suppliers.supplierID=products.supplierID;";
}
else if($suppcat_f=='category'){
    $sql="SELECT productName, categoryName, price
        FROM products
        INNER JOIN categories ON categories.categoryID=products.categoryID;";
}
else {
    $sql="SELECT productName, price
            FROM products";
}
$result=$link->query($sql);
$suppcats=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="" method="post">
        <input type="radio" name="suppcat_f" id="supplier" value="supplier">
        <label for="supplier">supplier</label><br>
        <input type="radio" name="suppcat_f" id="category" value="category">
        <label for="category">category</label><br>
        <button type="submit">Wyslij :)</button>
    </form>
    
    <table>
        <?php
        $names=$suppcats[0];
        echo "<tr>";
        foreach ($names as $key => $value) {
          echo "<th> $key </th>";          
        }
        echo "</tr>";

        foreach($suppcats as $suppcat){
            echo "<tr>";
            foreach($suppcat as $data){
                echo "<td>$data</td>";
            }
            echo "</tr>";
        }
        ?>

    </table>

</body>
</html>
<?php
$link->close();
?>