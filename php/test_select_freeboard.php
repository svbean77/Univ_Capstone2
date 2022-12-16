<?php
    include('dbcon.php');

        $sql = "SELECT * FROM freeboard ORDER BY freeid DESC;";
        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 

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
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
   
    
    
?>