<?php 
    $link = new mysqli('localhost','root','','4e_1_owoce');

    $name_f = $_POST['name_f'] ?? NULL;
    $price_f = $_POST['price_f'] ?? NULL;
    if ($name_f && $price_f){
        $sql = " INSERT INTO produkty
VALUES(NULL,(SELECT id FROM rodzaje WHERE nazwa='owoce'),(SELECT id FROM producenci WHERE nazwa='warzywa-rolnik') , '$name_f' , 10 , '' , $price_f ,'owoce.jpg')";
    $result = $link -> query($sql);
    }


    $sql="SELECT nazwa , ilosc , opis , cena , zdjecie
    FROM Produkty
    WHERE Rodzaje_id IN (1,2);";
    $result = $link -> query($sql);
    $products = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warzywniak</title>
    <link rel="stylesheet" href="styl2.css">
</head>
<body>
    <header>
        <section class="left">
            <h1>Internetowy sklep z eko-warzywami</h1>
        </section>

        <section class="right">
            <ol>
                <li>Warzywa</li>
                <li>Owoce</li>
                <li><a href="terapiasokami.pl" target="_blank">Soki</a></li>
            </ol>
        </section>
    </header>


    <main>
        <!-- skrypt 1 -->
         <!-- <div class='product'>
            <img src='papaja.jpg' alt='warzywniak'>
            <h5>papaja</h5>
            <p>opis:opis</p>
            <p>na stanie:ilosc</p>
            <h2>cena zł</h2>
         </div> -->
         
         <?php
         foreach ($products as $product){
            echo "<div class='product'>
            <img src='{$product['zdjecie']}' alt='warzywniak'>
            <h5>{$product['nazwa']}</h5>
            <p>opis:{$product['opis']}</p>
            <p>na stanie:{$product['ilosc']}</p>
            <h2>{$product['cena']} zł</h2>
         </div>";
         }
         ?>

        
    </main>


    <footer>
        <form action="" method="post">
            <label for="name">Nazwa:</label>
            <input type="text" name="name_f" id="name_f">
            
            <label for="price">Cena:</label>
            <input type="number" name="price_f" id="price_f">

            <button type="submit">Dodaj produkt</button>
        </form>
        <?php
        
        ?>
        Strone wykonał: =0102030405
    </footer>
</body>
</html>
<?php 
    $link -> close();
?>