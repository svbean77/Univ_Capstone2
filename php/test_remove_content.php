<?php
$db = mysqli_connect('localhost','root','','users');

//내 루틴 삭제

if(!$db)
{
	echo "Database connection failed";
}

$id = $_POST['id'];
$board = $_POST['board'];

if($board == "free"){
	$sql = "DELETE FROM freeboard WHERE freeid = '".$id."'";
}else{
	$sql = "DELETE FROM qnaboard WHERE qnaid = '".$id."'";
}

	$query = mysqli_query($db,$sql);
	
    
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	

?>