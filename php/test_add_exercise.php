<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$routine = $_POST['routine'];
$exercise = $_POST['exercise'];
$num = $_POST['num'];

if(strlen($num) != 0){
	$insert = "INSERT INTO my_routine_exercise(nickname_2, myroutine_1, exercise_1, num_1) VALUES ('".$nickname."', '".$routine."','".$exercise."', '".$num."')";

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