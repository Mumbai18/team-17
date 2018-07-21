<?php
/**
 * Created by PhpStorm.
 * User: suyog
 * Date: 7/21/2018
 * Time: 3:57 AM
 */

include_once('connection.php');
session_start();
$patientname=$_POST['patientname'];
$city=$_POST['city'];
$gender=$_POST['gender'];
$reason=$_POST['reason'];
$age=$_POST['age'];
$cancertype=$_POST['type'];
$phone=$_POST['phoneno'];
if(isset($patientname) && isset($city) && isset($gender) && isset($reason) && isset($cancertype) && isset($phone) ){

    $stmt=$connection->prepare('INSERT INTO visitor(patientname,city,gender,reason,cancertype,phone,age) values(?,?,?,?,?,?,?)');
    $stmt->bind_param("ssssssi",$patientname,$city,$gender,$reason,$cancertype,$phone,$age);
    $stmt->execute();

}
?>