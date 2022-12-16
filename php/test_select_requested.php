<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];

   
    $sql = "SELECT * FROM friends_request, userdata where requestedNickname = '".$nickname."' and userdata.nickname_0 = friends_request.requestNickname ORDER BY requestNickname ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('request'=>$row['requestNickname'], 'rating'=>$row['rating']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>