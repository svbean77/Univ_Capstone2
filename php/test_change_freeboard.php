<?php
$db = mysqli_connect('localhost','root','','users');

//테마 변경

if(!$db)
{
	echo "Database connection failed";
}

$image = $_POST["image"];
$title = $_POST["title"];
$content = $_POST["content"];
$filename = $_POST["filename"];
$id = $_POST["id"];

if($_POST["image"] == "no"){
	if(strlen($title) != 0 and strlen($content) != 0){
		$insert = "UPDATE freeboard SET freetitle='".$title."', freecontent='".$content."', 
		freefilename = null, freefilepath = null WHERE freeid = '".$id."'";
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
}else{
	$outputfile = "image/".$filename;
    $filehandler = fopen($outputfile, 'w'); 

	fwrite($filehandler, base64_decode($image));
    fclose($filehandler); 

	if(strlen($title) != 0 and strlen($content) != 0){
		$insert = "UPDATE freeboard SET freetitle='".$title."', freecontent='".$content."', 
		freefilename = '".$filename."', freefilepath = '".$outputfile."' WHERE freeid = '".$id."'";
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
}


	
?>