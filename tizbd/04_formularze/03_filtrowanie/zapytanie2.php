<?php
$link = new mysqli ('localhost', 'root', '', 'w3schools');

$suppID=$_POST['suppID'] ?? null;

if($suppID){
    $sql="SELECT ProductName, Price
FROM products
WHERE supplierID=$suppID";
}
else{
    $sql="SELECT ProductName, Price
FROM products";
}
$result=$link->query($sql);
$products=$result-> fetch_all(1);

$sql="SELECT SupplierID, SupplierName
FROM suppliers";
$result=$link->query($sql);
$suppliers=$result->fetch_all(1);

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
        <label for="suppID">
            Wybierz dostawce:
        </label>
        <select name="suppID" id="suppID">
            <!-- <option value='1'>Nazwa dostawcy</option> -->
            <?php
                foreach($suppliers as $supplier){
                    echo "<option value='{$supplier['SupplierID']}'>
                    {$supplier['SupplierName']}</option>";
                }
             ?>
        </select>
        <button>Filtruj</button>
    </form>
    <ol>
        <!-- <li>cukierki 10</li> -->
         <?php
            foreach($products as $product){
               echo "<li>{$product['ProductName']} {$product['Price']}</li>";
            }
         ?>
    </ol>
</body>
</html>