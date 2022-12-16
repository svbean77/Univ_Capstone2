<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];

    $sql = "SELECT * FROM my_routine where nickname_1 =  '".$nickname."' ORDER BY id_2 ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('id'=>$row['id_2'],'nickname'=>$row['nickname_1'],'routine'=>$row['myroutine_0']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>