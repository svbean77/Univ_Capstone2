<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$request = $_POST['request'];

$sql = "DELETE FROM friends_request WHERE requestedNickname = '".$nickname."' AND requestNickname = '".$request."'";

	$query = mysqli_query($db,$sql);
	
    
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>