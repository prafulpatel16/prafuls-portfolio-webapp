<?php
include_once 'db.php';
 if(isset($_POST['submit']))
 {    
      $name = $_POST['name'];
      $email = $_POST['email'];
      $subject = $_POST['subject'];
            $sql = "INSERT INTO users(name,email,subject)
      VALUES ('$name','$email','$subject')";
      if (mysqli_query($conn, $sql)) {
         echo "New record has been added successfully !";
      } else {
         echo "Error: " . $sql . ":-" . mysqli_error($conn);
      }
      mysqli_close($conn);
 }
 
?>






