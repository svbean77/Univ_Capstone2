<?php
$db = mysqli_connect('localhost','root','','users');
if(!$db)
{
	echo "Database connection failed";
}

if($_POST["image"] == "no"){
    $image = $_POST["image"];
    $title = $_POST["title"];
    $content = $_POST["content"];
    $filename = $_POST["filename"];
    $writer = $_POST["writer"];

    if(strlen($title) != 0 and strlen($content) != 0){
        $insert = "INSERT INTO freeboard(freetitle, freecontent,freewriter) VALUES ('".$title."', '".$content."', '".$writer."')";
        $query = mysqli_query($db,$insert);

        if($query){
            echo "Success";
        }else{
            echo "Error";
        }
        
    }
    else{
        echo "Error";
    }
    


}else{
    $image = $_POST["image"];
    $title = $_POST["title"];
    $content = $_POST["content"];
    $filename = $_POST["filename"];
    $writer = $_POST["writer"];

    $outputfile = "image/".$filename;
    $filehandler = fopen($outputfile, 'w'); 

    fwrite($filehandler, base64_decode($image));
    fclose($filehandler); 

    if(strlen($title) != 0 and strlen($content) != 0){
        $insert = "INSERT INTO freeboard(freetitle, freecontent,freewriter, freefilename, freefilepath) VALUES ('".$title."', '".$content."', '".$writer."', '".$filename."', '".$outputfile."')";
	    $query = mysqli_query($db,$insert);

        if($query){
            echo "Success";
        }else{
            echo "Error";
        }
    }
    else{
        echo "Error";
    }
}

?>