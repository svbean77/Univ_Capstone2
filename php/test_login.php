<?php
error_reporting(E_ALL);
ini_set('display_errors',1);

 $username = $_POST["username"];
 $password = $_POST["password"];

 $android = strpos($_SERVER['HTTP_USER_AGENT'], "Android");

 
    $sql="select * from userdata where username='$username' and password='$password'";

    $con = mysqli_connect('localhost', 'root', '', 'users');
    $result = mysqli_query($con, $sql);
 
    if($result->num_rows > 0){
         echo "Success";
      }
     else{
      echo "Error";
     }
    
    ?>