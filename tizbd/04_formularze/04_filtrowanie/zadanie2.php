  <!-- pole tekstowe, gdzie podajemy początek nazwy produktu i są wyświetlone produkty razem z ceną. Uwaga, ceny podajemy w zł, z dokładnością do dwóch miejsc po przecinku. Jeśli nic nie będzie wpisane do pola, powinny być wyświetlone wszystkie produkty. Jeśli brak produktów pasujących do wzorca, powinien być wyświetlony odpowiedni komunikat.  -->
<?php 
    $link = new mysqli('localhost','root','','w3schools');
    
    if(!empty($_POST['product'])){
        $product = $_POST['product'];
        $sql="SELECT ProductName, Price
            FROM products
            WHERE productname LIKE '$product%';";
        
        
    }else{
        $sql="SELECT ProductName, Price
            FROM products";
    }

    $result = 
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <p>Podaj produkt</p>
        <input type="text" name="product" id="product"><br><br>
        <button type="submit">Wyslij</button>
    </form>
</body>
</html>
<?php 
    $link -> close();
?>