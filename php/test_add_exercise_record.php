<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$writeDate = $_POST['writeDate'];
$comment = $_POST['comment'];

if(strlen($comment) != 0){
	$insert = "INSERT INTO record_exercise(nickname_5, comment,writeDate_0) VALUES ('".$nickname."', '".$comment."', '".$writeDate."')";

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