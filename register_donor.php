<?php
require 'connection.php';


// $name = $_POST['name'];
// $skills = $_POST['skills'];


$name = 'Shubham';
$pan_no = '84578956';
$phone_no = '8695869856';
$address = 'Andheri';
$payment_amt = '1000';
$mode_of_payment = 'Cash';
$purpose_of_donation = 'CFG';


$sql = $connection->prepare("INSERT INTO donor (name,pan_no,phone_no,address,payment_amt,mode_of_payment,purpose_of_donation) VALUES (?,?,?,?,?,?,?)");
$sql->bind_param('sssssss',$name,$pan_no,$phone_no,$address,$payment_amt,$mode_of_payment,$purpose_of_donation);
$sql->execute();

?>