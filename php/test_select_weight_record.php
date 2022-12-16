<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];

    $sql = "SELECT * FROM record_weight where nickname_6 = '".$nickname."' ORDER BY writeDate_1 ASC, id_5 ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('weight'=>$row['weight'], 'writeDate'=>$row['writeDate_1']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>