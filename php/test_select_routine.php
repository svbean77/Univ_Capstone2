<?php
    include('dbcon.php');


    $part = $_POST['part'];
    $time = (int)$_POST['time'];

    if($time == 0){
        $sql = "SELECT distinct routine, time FROM routine where part =  '".$part."' ORDER BY id_1 ASC;";
    }
    else{
        $sql = "SELECT distinct routine, time FROM routine where time = '".$time."' ORDER BY id_1 ASC;";
    }
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('routine'=>$row['routine'],'time'=>$row['time']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>