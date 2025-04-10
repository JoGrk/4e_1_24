<?php
$link = new mysqli('localhost','root','','4e_1_szkola');




$sql = "SELECT * FROM uczen";
$result = $link -> query($sql);
$students = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>szkoła</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Uczniowie</h1>
    <h2>Lista uczniow</h2>
    <table>
        <?php
            echo "<tr>";
            foreach ($students[0] as $key => $value) {
                echo "<th> $key </th>";
            }
            echo "</tr>";

            foreach($students as $student){
                echo "<tr>";
                foreach($student as $value){
                    echo "<td> $value </td>";
                }
                echo "</tr>";
            }
        ?>
    </table>

    <h2>Aktualizacja</h2>
    <form action="aktualizacja.php" method="POST">
        <label for="studentID">Podaj ID ucznia</label>
        <input type="number" name="studentID" id="studentID">
        <br>
        <label for="studentID">Podaj miejscowosc urodzenia</label>
        <input type="text" name="birthplace" id="birthplace">
        <br>
        <button type="submit">Wyślij</button>
    </form>

    <h2>usuwanie</h2>
    <form action="usuwanie.php" method="POST">
        <label for="studentID">Podaj ID ucznia</label>
        <input type="number" name="studentID" id="studentID">
        <button type="submit">Wyślij</button>
    </form>
</body>
</html>
<?php
$link -> close();
?>