<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$routine = $_POST['routine'];
$id = (int)$_POST['id'];


$insert = "DELETE FROM my_routine_exercise WHERE nickname_2 = '".$nickname."' AND myroutine_1 = '".$routine."' AND id_3 = '".$id."'";
	$query = mysqli_query($db,$insert);
	
    
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>