<?php
$db = mysqli_connect('localhost','root','','users');

//테마 변경

if(!$db)
{
	echo "Database connection failed";
}

$apptheme = (int)$_POST['apptheme'];
$nickname = $_POST['nickname'];


$insert = "UPDATE select_theme SET apptheme='".$apptheme."' WHERE nickname_4='".$nickname."'";

	$query = mysqli_query($db,$insert);
	
    
	if($query){
		echo "Success";
	}
	else{
		echo "Error";
	}
	
?>