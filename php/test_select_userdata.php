<?php
    include('dbcon.php');
//특정 사용자 정보

    $username = $_POST['username'];
    $mode = $_POST['mode'];

    if($mode == "ID"){

        $sql = "SELECT * FROM userdata, three_info, select_theme WHERE userdata.username = '".$username."' and
        userdata.nickname_0 = three_info.nickname_3 and userdata.nickname_0 = select_theme.nickname_4 and three_info.nickname_3 = select_theme.nickname_4;";
    }
        
    else{
        $sql = "SELECT * FROM userdata, three_info, select_theme WHERE userdata.nickname_0 = '".$username."' and
        userdata.nickname_0 = three_info.nickname_3 and userdata.nickname_0 = select_theme.nickname_4 and three_info.nickname_3 = select_theme.nickname_4;";
    }

    
    $stmt = $con->prepare($sql);
    $stmt->execute();

    $result = array(); 

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
        array_push($result, array('username'=>$row['username'],'password'=>$row['password'],'nickname'=>$row['nickname_0'],'userage'=>$row['userage'],'sex'=>$row['sex'],'rating'=>$row['rating'],
        'deadlift'=>$row['deadlift'],'benchpress'=>$row['benchpress'],'squat'=>$row['squat'],'total'=>$row['total'],'apptheme'=>$row['apptheme'],));
    } 
    echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
?>