<!-- 1. Lista rozwijana z nazwami krajów z których pochodzą klienci (tylko tych krajów) - wyświetla nazwy klientów z tego kraju -->

<?php 
    $link = new mysqli('localhost','root','','w3schools');

    $form_country=$_POST['country'] ?? null;
    if($form_country){
        $sql="
        SELECT customerName
        FROM customers
        WHERE country='$form_country'";
    }
    else{
        $sql="SELECT customerName
                FROM customers
";
    }
    $result=$link->query($sql);
    $customers=$result->fetch_all(1);
    

    $sql = "SELECT DISTINCT country
            FROM customers
                ORDER BY country";
    $result=$link->query($sql);
    $countries=$result->fetch_all(1);
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
   <label for="country">Wybierz kraje</label>
   <select name="country" id="country">
    <!-- <option>Poland</option> -->
     <?php
        foreach($countries as $country){
            echo "
            <option>{$country['country']}</option>
            ";
        }
     ?>
   </select><br>
   <button>Przeslij</button>
   </form>
   <ol>
    <!-- <li>nazwa producenta</li> -->
     <?php
foreach($customers as $customer){
    echo "
    <li>{$customer['customerName']}</li>
    ";
}
     ?>
   </ol>
   
</body>
</html>
<?php 
    $link -> close();
?>