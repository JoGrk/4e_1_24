<!-- Raport wyświetla dane dotyczące produktów (nazwa produktu, nazwa dostawcy, cena) w formie tabeli. -->
<?php

$link= new mysqli('localhost', 'root', '', 'w3schools');
if(isset($_POST['list_product']) && isset($_POST['rise']))
{
    $current_product = $_POST['list_product'];
    $rise_value = $_POST['rise'];
    $sql = "UPDATE products
            SET price = price+price*$rise_value
            WHERE $current_product = 1;";
    $link -> query($sql);
}
$sql = "SELECT productname, price,  suppliername
        FROM products 
        INNER JOIN suppliers ON suppliers.supplierID=products.supplierID";
$result = $link -> query($sql);
$products = $result -> fetch_all(1);

$sql = "SELECT productname, productID
FROM products";
$result = $link -> query($sql);
$products_list = $result -> fetch_all(1);


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
        <label for="list_product">Wybierz produkt:</label>
    <select name="list_product" id="list_product">
        <!-- <option value='2'>Chang</option> -->
         <?php
            foreach($products_list as $product_list){
                echo "<option value='{$product_list['productID']}'>{$product_list['productname']}</option>";
            }
        ?>
    </select>   

    <input type="range" name="rise" id="rise" min="0.01" max="0.1" step="0.01">
     <button>Wyślij</button>
    </form>

    <table>
        <tr>
            <th>Nazwa Produktu</th>
            <th>Nazwa dostawcy</th>
            <th>Cena</th>
        </tr>
        <!-- <tr>
            <td>chili</td>
            <td>mexico</td>
            <td>30</td>
        </tr> -->
        <?php
        foreach($products as $product){
            echo"
            <tr>
            <td>{$product['productname']}</td>
            <td>{$product['suppliername']}</td>
            <td>{$product['price']}</td>
            </tr>";
        };
        ?>
    </table>
</body>
</html>
<?php
$link->close();
?>