<?php
/**
 * Created by PhpStorm.
 * User: suyog
 * Date: 7/21/2018
 * Time: 4:25 AM
 */

include_once('connection.php');
session_start();
$patientname=$_POST['name'];
$hospital=$_POST['hospital'];
$age=$_POST['age'];
$city=$_POST['city'];
$gender=$_POST['gender'];
$cancertype=$_POST['type'];
$phone=$_POST['phoneno'];
$followup=$_POST['followup'];
$password="Patient123";


//$patientname="njhjdhsjhjd";
//$hospital="abc";
//$age=20;
//$city="mumbai";
#$gender="jhdjhds";
//$cancertype="throat";
//$phone=1111111111;
//$followup="followup";
//
//

//$vid=$_SESSION['vid'];
$vid=1;
echo 'patientname: '.$patientname." ".$hospital." ".$age." ".$city." ".$cancertype." ".$followup;
//echo "array".$service;

//if(isset($patientname) && isset($hospital) && isset($city) && isset($age) && isset($followup) && isset($gender) && isset($cancertype) && isset($phone)){
$service = $_POST['service'];
//foreach($_POST['service'] as $service) {
    echo "i am here";
    $stmt = $connection->prepare('INSERT INTO patient(name,file_no,age,address,gender,follow_up,type_of_cancer,phone_no,password) values(?,?,?,?,?,?,?,?,?)');
    $stmt->bind_param("sssisssss", $patientname, $hospital, $city, $age, $gender, $followup, $cancertype, $phone,$password);
    if ($stmt->execute()) {
        echo "i am in if";
        $stmt1 = $connection->prepare('select id from patient where name=?');
        $stmt1->bind_param("s", $patientname);
        $stmt1->execute();
        $stmt1->store_result();
        $stmt1->bind_result($id);
        $stmt1->fetch();
        echo "printing".$id."  ".$vid."  ".$service;
        $stmt2=$connection->prepare("insert into patient_volunteer_relation(patient_id,volunteer_id,sub_program_id) values(?,?,?)");
        $stmt2->bind_param("iii",$id,$vid,$service);
        if($stmt2->execute()){

            echo "printted";
        }
        else{
            print "fail".$stmt->error;
        }
    }
    else {
        print $stmt->error;
  //  }

}
//}




?>