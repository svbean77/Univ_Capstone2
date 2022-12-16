<?php
$db = mysqli_connect('localhost','root','','users');

//회원정보 수정

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$requested = $_POST['requested'];


$insert = "DELETE FROM friends_request WHERE requestNickname = '".$nickname."' and requestedNickname = '".$requested."')";

	$query = mysqli_query($db,$insert);
	
    
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>