<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$routineName = $_POST['routineName'];

if(strlen($routineName) != 0){
	$insert = "INSERT INTO my_routine(nickname_1, myroutine_0) VALUES ('".$nickname."', '".$routineName."')";

	$query = mysqli_query($db,$insert);
	
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
}else{
	echo "Error";
}

	

?>