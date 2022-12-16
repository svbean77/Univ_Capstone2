<?php
$db = mysqli_connect('localhost','root','','users');

//회원 탈퇴

if(!$db)
{
	echo "Database connection failed";
}

$nickname = $_POST['nickname'];


$insert = "DELETE FROM userdata WHERE nickname_0 = '".$nickname."'";
$insert2 = "DELETE FROM three_info WHERE nickname_3 = '".$nickname."'";
$insert3 = "DELETE FROM select_theme WHERE nickname_4 = '".$nickname."'";
$insert4 = "DELETE FROM friends WHERE loginNickname = '".$nickname."'";
$insert5 = "DELETE FROM friends WHERE friendsNickname = '".$nickname."'";
$insert6 = "DELETE FROM freeboard WHERE freewriter = '".$nickname."'";
$insert7 = "DELETE FROM friends_request WHERE requestedNickname = '".$nickname."'";
$insert8 = "DELETE FROM friends_request WHERE requestNickname = '".$nickname."'";
$insert9 = "DELETE FROM my_routine WHERE nickname_1 = '".$nickname."'";
$insert10 = "DELETE FROM my_routine_exercise WHERE nickname_2 = '".$nickname."'";
$insert11 = "DELETE FROM qnaboard WHERE qnawriter = '".$nickname."'";
$insert12 = "DELETE FROM record_exercise WHERE nickname_5 = '".$nickname."'";
$insert13 = "DELETE FROM record_weight WHERE nickname_6 = '".$nickname."'";
$insert14 = "DELETE FROM threeboard WHERE threewriter = '".$nickname."'";

	$query = mysqli_query($db,$insert);
	$query2 = mysqli_query($db,$insert2);
	$query3 = mysqli_query($db,$insert3);
	$query4 = mysqli_query($db, $insert4);
	$query5 = mysqli_query($db, $insert5);
	$query6 = mysqli_query($db, $insert6);
	$query7 = mysqli_query($db, $insert7);
	$query8 = mysqli_query($db, $insert8);
	$query9 = mysqli_query($db, $insert9);
	$query10 = mysqli_query($db, $insert10);
	$query11 = mysqli_query($db, $insert11);
	$query12 = mysqli_query($db, $insert12);
	$query13 = mysqli_query($db, $insert13);
	$query14 = mysqli_query($db, $insert14);

	if($query and $query2 and $query3 and $query4 and $query5 and $query6 and $query7 and $query8 and $query9 and $query10 and $query11 and $query12 and $query13 and $query14){
		echo "Success";
	}
	else{
		echo "Error";
	}

?>