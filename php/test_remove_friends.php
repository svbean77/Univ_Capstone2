<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];
$friends = $_POST['friends'];

$sql = "DELETE FROM friends WHERE loginNickname = '".$nickname."' AND friendsNickname = '".$friends."'";
$sql2 = "DELETE FROM friends WHERE loginNickname = '".$friends."' AND friendsNickname = '".$nickname."'";

	$query = mysqli_query($db,$sql);
	$query2 = mysqli_query($db,$sql2);
	
    
	if($query and $query2){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>