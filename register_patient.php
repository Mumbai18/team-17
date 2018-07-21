<?php
/**
 * Created by PhpStorm.
 * User: suyog
 * Date: 7/21/2018
 * Time: 4:25 AM
 */

include_once('connection.php');
session_start();
/*$patientname=$_POST['patientname'];
$hospital=$_POST['hospital'];
$age=$_POST['age'];
$city=$_POST['city'];
$gender=$_POST['gender'];
$cancertype=$_POST['type'];
$phone=$_POST['phoneno'];
$followup=$_POST['followup'];*/

$patientname="njhjdhsjhjd";
$hospital="jhjhdjsj";
$age=20;
$city="mumbai";
$gender="jhdjhds";
$cancertype="";
$phone="phoneno";
$followup="followup";



echo 'patientname: '.$patientname;



if(isset($patientname) && isset($hospital) && isset($city) && isset($age) && isset($followup) && isset($gender) && isset($cancertype) && isset($phone)){
    $stmt=$connection->prepare('INSERT INTO visitor(patientname,hospital,age,city,gender,followup,cancertype,phone) values(?,?,?,?,?,?)');
    $stmt->bind_param("siisssis",$patientname,$hospital,$city,$age,$gender,$followup,$cancertype,$phone);
    $stmt->execute();
}




?>