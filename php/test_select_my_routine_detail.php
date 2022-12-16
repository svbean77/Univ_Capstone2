<?php
    include('dbcon.php');


    $nickname = $_POST['nickname'];
    $routine = $_POST['routine'];

    $sql = "SELECT * FROM my_routine_exercise, exercise_data_correct where my_routine_exercise.nickname_2 = '".$nickname."' and 
    my_routine_exercise.myroutine_1 = '".$routine."' and my_routine_exercise.exercise_1 = exercise_data_correct.exercise 
    GROUP BY exercise_data_correct.exercise ORDER BY my_routine_exercise.id_3 ASC;";
    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('id'=>$row['id_3'], 'nickname'=>$row['nickname_2'],'routine'=>$row['myroutine_1'],'exercise'=>$row['exercise'],'num'=>$row['num_1'],
        'image1'=>$row['image1'],'image2'=>$row['image2'],'step'=>$row['step']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 

    
?>