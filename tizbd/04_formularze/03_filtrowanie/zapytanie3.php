<?php
$link = new mysqli('localhost', 'root', '','w3schools');

$shipping=$_POST["shipping"] ?? null;
if($shipping){
  $sql = "SELECT OrderID , OrderDate
FROM orders
WHERE shipperID=$shipping;"  ;
}
else{
    $sql = "SELECT OrderID , OrderDate
FROM orders;";
}
$result=$link -> query($sql);
$orders=$result -> fetch_all(1);

$sql="SELECT ShipperID, ShipperName
FROM shippers;";
$result=$link -> query($sql);
$shippers = $result -> fetch_all(1);


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
    <!-- <input type='radio' name='shipping' id='shipping' value='1'>
    <label for='shipping'>Speedy Express</label><br> -->
    <?php
        foreach($shippers as $shipper){
            echo "<input type='radio' name='shipping' id='shipping' value='{$shipper['ShipperID']}'>
                 <label for='shipping'>{$shipper['ShipperName']}</label><br>
            ";
        }
    ?>
    <button>Wyslij</button>
  </form>
  <ul>
    <?php 
        foreach($orders as $order){
            echo "<li>{$order['OrderID']}  {$order['OrderDate']}</li>";
        }
    ?>
  </ul>
</body>
</html>
<?php
$link -> close();
?>