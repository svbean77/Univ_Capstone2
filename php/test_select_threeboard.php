<?php
    include('dbcon.php');

    $nickname = $_POST['nickname'];


        $sql = "SELECT * FROM threeboard WHERE threewriter = '".$nickname."' ORDER BY threeid DESC;";

        $stmt = $con->prepare($sql);
        $stmt->execute();
    
        $result = array(); 

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){ 

            
            if($row['threefilename'] != null){
                $path = $row['threefilepath'];
                $data = file_get_contents($path);
                $base64 = base64_encode($data);
            }else{
                $base64 = null;
            }



            array_push($result, array('id'=>$row['threeid'],'title'=>$row['threetitle'],'content'=>$row['threecontent'],
            'filename'=>$row['threefilename'],'filepath'=>$row['threefilepath'],'writer'=>$row['threewriter'],'data'=>$base64));
        } 
        echo json_encode(array("result"=>$result),JSON_UNESCAPED_UNICODE); 
    
    
    
?>