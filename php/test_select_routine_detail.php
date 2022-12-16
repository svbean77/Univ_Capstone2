<?php
    include('dbcon.php');


    $routine = $_POST['routine'];

    $sql = "SELECT * FROM routine where routine = '".$routine."' ORDER BY id_1 ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('routine'=>$row['routine'],'exercise'=>$row['exercise_0'],'num'=>$row['num_0'],
        'image1'=>$row['image1_0'],'image2'=>$row['image2_0'],'step'=>$row['step_0']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>