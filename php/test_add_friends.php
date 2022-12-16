<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$request = $_POST['request'];


$insert = "INSERT INTO friends VALUES ('".$nickname."', '".$request."')";
$insert2 = "INSERT INTO friends VALUES ('".$request."', '".$nickname."')";

	$query = mysqli_query($db,$insert);
	$query2 = mysqli_query($db, $insert2);
	
	if($query and $query2){
		echo "Success";
	}
	else{
		echo "Error";
	}

?>