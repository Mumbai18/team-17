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

echo 'patientname: '.$patientname." ".$hospital." ".$age." ".$city." ".$cancertype." ".$followup;
echo "array".$service;

//if(isset($patientname) && isset($hospital) && isset($city) && isset($age) && isset($followup) && isset($gender) && isset($cancertype) && isset($phone)){

foreach ($_POST['service'] as $service) {

    echo "i am here";
    $stmt = $connection->prepare('INSERT INTO patient(name,hospital,age,address,gender,follow_up,type_of_cancer,phone_no,password) values(?,?,?,?,?,?,?,?)');
    $stmt->bind_param("sssissss", $patientname, $hospital, $city, $age, $gender, $followup, $cancertype, $phone,$password);
    if ($stmt->execute()) {

    } else {
        print $stmt->error;
    }

}
//}




?>