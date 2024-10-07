<?php
    $servername='mysql2021.cntikk0jg8xf.ca-central-1.rds.amazonaws.com';
    $username='admin';
    $password='admin123456';
    $dbname = "contacts";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysqli_error());
        }
?>

