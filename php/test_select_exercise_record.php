<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];

    $sql = "SELECT * FROM record_exercise where nickname_5 =  '".$nickname."' ORDER BY writeDate_0 DESC, id_4 ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('comment'=>$row['comment'], 'writeDate'=>$row['writeDate_0'], 'id'=>$row['id_4']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>