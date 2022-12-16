<?php
    include('dbcon.php');


        $sql = "SELECT * FROM qnaboard ORDER BY qnaid DESC;";

        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 

            
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
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
  
?>