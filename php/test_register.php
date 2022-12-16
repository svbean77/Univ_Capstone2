<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}
//이름, 아이디, 비밀번호, 닉네임, 나이, 성별, 체중
$username = $_POST['username'];
$password = $_POST['password'];
$nickname = $_POST['nickname'];
$userage = (int)$_POST['userage'];
$sex = $_POST['sex'];

$sql_1 = "SELECT username FROM userdata WHERE username = '".$username."'";
$sql_2 = "SELECT username FROM userdata WHERE nickname_0 = '".$nickname."'";

$result_1 = mysqli_query($db,$sql_1);
$result_2 = mysqli_query($db,$sql_2);

$count_1 = mysqli_num_rows($result_1);
$count_2 = mysqli_num_rows($result_2);

if($count_1 != 0){
	echo "Error1";
}
else if($count_2 != 0){
    echo "Error2";
}
else{
	$insert = "INSERT INTO userdata(username,password,nickname_0, sex,userage) VALUES ('".$username."','".$password."','".$nickname."','".$sex."','".$userage."')";
	$insert2 = "INSERT INTO three_info(nickname_3) VALUES ('".$nickname."')";
	$insert3 = "INSERT INTO select_theme(nickname_4) VALUES ('".$nickname."')";
	$insert4 = "INSERT INTO friends VALUES('".$nickname."', '".$nickname."')";
		$query = mysqli_query($db,$insert);
		$query2 = mysqli_query($db,$insert2);
		$query3 = mysqli_query($db,$insert3);
		$query4 = mysqli_query($db, $insert4);
		if($query and $query2 and $query3 and $query4){
			echo "Success";
			}
			else{
				echo "Error";
			}
		
}
?>