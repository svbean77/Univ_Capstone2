<?php
    include('dbcon.php');


    $board = $_POST['board'];
    $nickname = $_POST['nickname'];

    if($board == "free"){
        $sql = "SELECT * FROM freeboard ORDER BY freeid DESC;";
        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
            array_push($result, array('id'=>$row['freeid'],'title'=>$row['freetitle'],'content'=>$row['freecontent'],
            'filename'=>$row['freefilename'],'filepath'=>$row['freefilepath'],'writer'=>$row['freewriter']));
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    }
    else if($board == "qna"){
        $sql = "SELECT * FROM qnaboard ORDER BY qnaid DESC;";

        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
            array_push($result, array('id'=>$row['qnaid'],'title'=>$row['qnatitle'],'content'=>$row['qnacontent'],
            'filename'=>$row['qnafilename'],'filepath'=>$row['qnafilepath'],'writer'=>$row['qnawriter']));
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    }else{
        $sql = "SELECT * FROM threeboard WHERE threewriter = '".$nickname."' ORDER BY threeid DESC;";

        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
            array_push($result, array('id'=>$row['threeid'],'title'=>$row['threetitle'],'content'=>$row['threecontent'],
            'filename'=>$row['threefilename'],'filepath'=>$row['threefilepath'],'writer'=>$row['threewriter']));
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    }
    
    
?>