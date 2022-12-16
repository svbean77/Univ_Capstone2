<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$writeDate = $_POST['writeDate'];
$weight = $_POST['weight'];


if(strlen($writeDate) != 0 and strlen($weight) != 0){
	$insert = "INSERT INTO record_weight(nickname_6, weight, writeDate_1) VALUES ('".$nickname."', '".$weight."', '".$writeDate."')";

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