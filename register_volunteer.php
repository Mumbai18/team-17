<?php
require 'connection.php';

$volunteer_name = $_POST['volunteer_name'];
$phone_no = $_POST['phone_no'];
$email = $_POST['email'];
$password = $_POST['password'];
$address = $_POST['address'];
$skills = $_POST['skills'];
$role_id = $_POST['role_id'];

$sql = $connection->prepare("INSERT INTO volunteer (volunteer_name,skills,address,phone_no,role_id,password) VALUES (?,?,?,?,?,?)");
$sql->bind_param('ssssss',$volunteer_name,$skills,$address,$phone_no,$role_id,$password);
$sql->execute();

?>