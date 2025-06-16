<?php 
    $link = new mysqli('localhost','root','','4e_1_owoce');
    $sql="";
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
    </main>


    <footer>
        <form action="" method="post">
            <label for="name">Nazwa:</label>
            <input type="text" name="name" id="name">
            
            <label for="price">Cena:</label>
            <input type="number" name="price" id="price">

            <button type="submit">Dodaj produkt</button>
            
        

        </form>
        Strone wykonał: =0102030405
    </footer>
</body>
</html>
<?php 
    $link -> close();
?>