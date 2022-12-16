<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$id = (int)$_POST['id'];

$insert = "DELETE FROM record_exercise WHERE id_4 = '".$id."'";
	$query = mysqli_query($db,$insert);
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>