<?php
$link= new mysqli ('localhost', 'root', '', 'w3schools');

$minprice=$_POST['minprice'] ?? null;
$maxprice=$_POST['maxprice'] ?? null;

if($minprice && $maxprice){
    // echo "$minprice $maxprice";
    $sql="SELECT ProductName, CategoryName, Price
    FROM products
    JOIN categories ON products.CategoryID=categories.CategoryID
    WHERE Price BETWEEN $minprice AND $maxprice
    ";
}
else{
    $sql="SELECT ProductName, CategoryName, Price
        FROM products
    JOIN categories ON products.CategoryID=categories.CategoryID";
}

$result=$link->query($sql);
$products=$result -> fetch_all(1);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table, td, th{
            border: 1px solid;
            border-collapse: collapse;
        }
    </style>
    <title>Document</title>
</head>
<body>
<form action="" method="post">
    Podaj minimalna i maksymalna cene
        <input type="number" name="minprice" id="minprice">
        <input type="number" name="maxprice" id="maxprice">
            <button type="send">Filtruj</button>

</form>
<table>
    <tr>
        <th>Nazwa produktu</th>
        <th>Kategoria</th>
        <th>Cena</th>
    </tr>
    <!-- <tr>
        <td>Nazwa</td>
        <td>Kategoria</td>
        <td>Cena</td>
    </tr> -->
    <?php
        foreach($products as $product){
            echo "
            <tr>
        <td>{$product['ProductName']}</td>
        <td>{$product['CategoryName']}</td>
        <td>{$product['Price']}</td>
    </tr>";
        }

    ?>
</table>
</body>
</html>

<?php
$link->close();
?>