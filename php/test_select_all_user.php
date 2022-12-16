<?php
    include('dbcon.php');
//모든 사용자 정보

    $sql = "SELECT * FROM userdata, three_info WHERE userdata.nickname_0 = three_info.nickname_3 ORDER BY total DESC;";

    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('nickname'=>$row['nickname_0'],'rating'=>$row['rating'],
        'deadlift'=>$row['deadlift'],'benchpress'=>$row['benchpress'],'squat'=>$row['squat'],'total'=>$row['total']));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
?>