<?php
require 'connection.php';


// $name = $_POST['name'];
// $skills = $_POST['skills'];


$name = 'Shubham';
$skills = 'Singing';
$address = 'Andheri';
$phone_no = '8655676678';
$role_id = '2';
$password = 'Shubham@123';


$sql = $connection->prepare("INSERT INTO volunteer (volunteer_name,skills,address,phone_no,role_id,password) VALUES (?,?,?,?,?,?)");
$sql->bind_param('ssssss',$name,$skills,$address,$phone_no,$role_id,$password);
$sql->execute();

?>