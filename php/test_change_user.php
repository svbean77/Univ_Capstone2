<?php
$db = mysqli_connect('localhost','root','','users');

//회원정보 수정

if(!$db)
{
	echo "Database connection failed";
}

$username = $_POST['username'];
$password = $_POST['password'];
$nickname = $_POST['nickname'];
$userage = (int)$_POST['userage'];
$sex = $_POST['sex'];
$origin = $_POST['origin'];

if(strlen($password) != 0 and strlen($nickname) != 0 and $userage != null){
	$insert = "UPDATE userdata SET  nickname_0='".$nickname."', password='".$password."', userage='".$userage."', sex='".$sex."' WHERE username='".$username."'";
	$insert2 = "UPDATE freeboard SET  freewriter='".$nickname."' WHERE freewriter='".$origin."'";
	$insert3 = "UPDATE friends SET  loginNickname='".$nickname."' WHERE loginNickname='".$origin."'";
	$insert4 = "UPDATE friends SET  friendsNickname='".$nickname."' WHERE friendsNickname='".$origin."'";
	$insert5 = "UPDATE friends_request SET  requestNickname='".$nickname."' WHERE requestNickname='".$origin."'";
	$insert6 = "UPDATE friends_request SET  requestedNickname='".$nickname."' WHERE requestedNickname='".$origin."'";
	$insert7 = "UPDATE my_routine SET  nickname_1='".$nickname."' WHERE nickname_1='".$origin."'";
	$insert8 = "UPDATE my_routine_exercise SET  nickname_2='".$nickname."' WHERE nickname_2='".$origin."'";
	$insert9 = "UPDATE qnaboard SET  qnawriter='".$nickname."' WHERE qnawriter='".$origin."'";
	$insert10 = "UPDATE record_exercise SET  nickname_5='".$nickname."' WHERE nickname_5='".$origin."'";
	$insert11 = "UPDATE record_weight SET  nickname_6='".$nickname."' WHERE nickname_6='".$origin."'";
	$insert12 = "UPDATE select_theme SET  nickname_4='".$nickname."' WHERE nickname_4='".$origin."'";
	$insert13 = "UPDATE threeboard SET  threewriter='".$nickname."' WHERE threewriter='".$origin."'";
	$insert14 = "UPDATE three_info SET  nickname_3='".$nickname."' WHERE nickname_3='".$origin."'";
	
		$query = mysqli_query($db,$insert);
		$query2 = mysqli_query($db,$insert2);
		$query3 = mysqli_query($db,$insert3);
		$query4 = mysqli_query($db,$insert4);
		$query5 = mysqli_query($db,$insert5);
		$query6 = mysqli_query($db,$insert6);
		$query7 = mysqli_query($db,$insert7);
		$query8 = mysqli_query($db,$insert8);
		$query9 = mysqli_query($db,$insert9);
		$query10 = mysqli_query($db,$insert10);
		$query11 = mysqli_query($db,$insert11);
		$query12 = mysqli_query($db,$insert12);
		$query13 = mysqli_query($db,$insert13);
		$query14 = mysqli_query($db,$insert14);
		
		
		if($query and $query10 and $query11 and $query12 and $query13 and $query14 and $query2 and $query3 and $query4 and $query5 and $query6 and $query7 and $query8 and $query9){
			echo "Success";
		}
		else{
			echo "Error";
		}
}else{
	echo "Error";
}

	
?>