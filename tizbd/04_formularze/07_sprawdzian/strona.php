<?php 
    $link = new mysqli('localhost','root','','w3schools');
    $supplierForm = $_POST['supplierForm'] ?? null;
    $priceModForm = $_POST['priceModForm'] ?? null;
    
    // są dane w formularzu
    if($supplierForm && $priceModForm){
        $sql = "UPDATE products
         SET price = price+price*($priceModForm)
         WHERE supplierID=$supplierForm";
        $result = $link -> query($sql);
    }

    $sql = "SELECT supplierName , supplierID
            FROM suppliers";
    $result = $link -> query($sql);
    $suppliers = $result -> fetch_all(1);
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
        <select name="supplierForm" id="supplierForm">
            <?php 
                foreach($suppliers as $supplier){
                    echo "<option value='{$supplier['supplierID']}''>{$supplier['supplierName']}</option>";
                }
            ?>
        </select>
        <input type="range" name="priceModForm" id="priceModForm" min="-0.1" max="0.1" step="0.02">
        <button type="submit">Wyslij</button>
    </form>
</body>
</html>
<?php 
    $link -> close();
?>