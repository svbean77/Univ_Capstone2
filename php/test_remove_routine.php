<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$routine = $_POST['routine'];

$sql2 = "DELETE FROM my_routine_exercise WHERE nickname_2 = '".$nickname."' AND myroutine_1 = '".$routine."'";
$insert = "DELETE FROM my_routine WHERE nickname_1 = '".$nickname."' AND myroutine_0 = '".$routine."'";
	$query = mysqli_query($db,$sql2);
	$query2 = mysqli_query($db,$insert);
	if($query and $query2){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>