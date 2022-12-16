<?php
    include('dbcon.php');


    $board = $_POST['board'];
    $search = $_POST['search'];

    if($board == "free"){
        $sql = "SELECT * FROM freeboard ORDER BY freeid DESC;";
        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 
            if(strpos($row['freetitle'], $search) !== false){

                if($row['freefilename'] != null){
                    $path = $row['freefilepath'];
                    $imagedata = file_get_contents($path);
                    $base64 = base64_encode($imagedata);
                }else{
                    $base64 = null;
                }
            array_push($result, array('id'=>$row['freeid'],'title'=>$row['freetitle'],'content'=>$row['freecontent'],
            'filename'=>$row['freefilename'],'filepath'=>$row['freefilepath'],'writer'=>$row['freewriter'],'data'=>$base64));
            }
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    }
    else {
        $sql = "SELECT * FROM qnaboard ORDER BY qnaid DESC;";
        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 

            if(strpos($row['qnatitle'], $search) !== false){

                if($row['qnafilename'] != null){
                    $path = $row['qnafilepath'];
                    $imagedata = file_get_contents($path);
                    $base64 = base64_encode($imagedata);
                }else{
                    $base64 = null;
                }

            array_push($result, array('id'=>$row['qnaid'],'title'=>$row['qnatitle'],'content'=>$row['qnacontent'],
            'filename'=>$row['qnafilename'],'filepath'=>$row['qnafilepath'],'writer'=>$row['qnawriter'],'data'=>$base64));
            }
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    }
    
    
?>