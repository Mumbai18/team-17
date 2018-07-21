<?php
/**
 * Created by PhpStorm.
 * User: suyog
 * Date: 7/21/2018
 * Time: 3:57 AM
 */

include_once('connection.php');
session_start();
$patientname = $_POST['name'];
$city = $_POST['location'];
$gender = $_POST['gender'];
$reason = $_POST['query'];
$age = $_POST['age'];
$cancertype = $_POST['type_of_cancer'];
$phone = $_POST['phone_no'];

$stmt = $connection->prepare('INSERT INTO visitor(name,location,gender,query,type_of_cancer,phone_no,age) values(?,?,?,?,?,?,?)');
$stmt->bind_param("ssssssi",$patientname,$city,$gender,$reason,$cancertype,$phone,$age);

if($stmt->execute()){
}
else{
	print $stmt->error;
}



?>