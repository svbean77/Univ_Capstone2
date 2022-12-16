<?php
    include('dbcon.php');
//운동(근육별,도구별,난이도별)운동이름 오름차순

    $muscle = $_POST['muscle'];
    $equipment = $_POST['equipment'];
    $difficulty = $_POST['difficulty'];

    if($difficulty !='초보자'){
        $sql = "SELECT * FROM exercise_data_correct WHERE muscle = '".$muscle."' AND equipment = '".$equipment."' AND difficulty NOT IN 
        (SELECT difficulty FROM exercise_data_correct WHERE difficulty = '초보자') ORDER BY exercise ASC;";
    }
    else{
        $sql = "SELECT * FROM exercise_data_correct 
        WHERE muscle = '".$muscle."' AND equipment = '".$equipment."' AND difficulty = '".$difficulty."' ORDER BY exercise ASC;";
    }
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('muscle'=>$row['muscle'],'equipment'=>$row['equipment'], 
        'difficulty'=>$row['difficulty'], 'exercise'=>$row['exercise'],
        'image1'=>$row['image1'],'image2'=>$row['image2'], 'step'=>$row['step']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    
    
?>