<?php
$conn = new mysqli('localhost','root','','4e_1_video');

$movie_f = $_POST['movie_f'] ?? null;
if($movie_f){
    $sql="DELETE FROM produkty
    WHERE id = $movie_f;";
    $result = $conn -> query($sql);
}

$sql= "SELECT id, nazwa, opis, zdjecie
FROM produkty 
WHERE id IN (18, 22, 23, 25);";
$result = $conn -> query($sql);
$movies1 = $result -> fetch_all(1);

$sql="SELECT id, nazwa, opis, zdjecie
    FROM produkty 
    WHERE rodzaje_id = 12";
$result = $conn -> query($sql);
$movies2 = $result -> fetch_all(1);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styl3.css">
    <title>Video on Demand</title>
</head>
<body>
    <header>
        <section class="left">
            <h1>Internetowa wypozyczalnia filmow</h1>
        </section>
        <section class="right">
            <table>
                <tr>
                    <td>Kryminal</td>
                    <td>Horror</td>
                    <td>Przygodowy</td>
                </tr>
                <tr>
                    <td>20</td>
                    <td>30</td>
                    <td>10</td>
                </tr>
            </table>
        </section>
    </header>
    
    <section class="list">
        <h3>Polecamy</h3>
        <div class="flex">
        <!-- skrypt1 -->
         <!-- <div class="movie">
            <h4><id>. <nazwa></h4>
            <img src="zdjecie" alt="film">
            <p>opis</p>
         </div> -->

         <?php
        foreach($movies1 as $movie){
            echo "<div class='movie'>
                    <h4>{$movie['id']}. {$movie['nazwa']}</h4>
                    <img src='{$movie['zdjecie']}' alt='film'>
                    <p>{$movie['opis']}</p>
                </div>";
         }
         ?>
         </div>
    </section>
    <section class="list">
        <h3>Filmy fantastyczne</h3>
        <div class="flex">
            <!-- skyrpt2 -->
             <!-- <div class="movie">
            <h4><id>. <nazwa></h4>
            <img src="zdjecie" alt="film">
            <p>opis</p>
         </div> -->
         <?php 
            foreach($movies2 as $movie2){
                echo"<div class='movie'>
                        <h4>{$movie2['id']}. {$movie2['nazwa']}</h4>
                        <img src='{$movie2['zdjecie']}' alt='film'>
                        <p>{$movie2['opis']}</p>
                    </div>";
            }
         ?>

        </div>
        

    </section>

    <footer>
        <form action="" method="post">
            <label for="movie_f">Usuń film nr:</label>
            <input type="number" name="movie_f" id="movie_f">
            <button type="submit">Usuń film</button>
        </form>
        Stronę wykonał: 
        <a href="mailto:ja@poczta.com">00000000000</a>
    </footer>
</body>
</html>
<?php
$conn->close();