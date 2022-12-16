<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];

   
    $sql = "SELECT * FROM friends, userdata where loginNickname = '".$nickname."' and userdata.nickname_0 = friends.friendsNickname ORDER BY friendsNickname ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('friends'=>$row['friendsNickname'], 'rating'=>$row['rating']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>