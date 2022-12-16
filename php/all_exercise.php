<?php
    include('dbcon.php');

//근육으로만 운동 구분

    $muscle = $_POST['muscle'];
    $sql = "SELECT exercise FROM exercise_data_correct WHERE muscle = '".$muscle."' ORDER BY exercise ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('exercise'=>$row['exercise']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
?>