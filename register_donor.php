<?php
include 'connection.php';


// $name = $_POST['name'];
// $skills = $_POST['skills'];


$name = $_POST['name'];
$pan_no = $_POST['pan_no'];
$phone_no = $_POST['phone_no'];
$address = $_POST['address'];
$payment_amt = $_POST['payment_amt'];
$mode_of_payment = $_POST['mode_of_payment'];
$purpose_of_donation = $_POST['purpose_of_donation'];

// $name = 'Shubham';
// $pan_no = 'Shubham';
// $phone_no = 'Shubham';
// $address = 'Shubham';
// $payment_amt = 'Shubham';
// $mode_of_payment = 'Shubham';
// $purpose_of_donation = 'Shubham';


// echo $name;
// echo $pan_no;
// echo $address;
// echo $payment_amt;
// echo $mode_of_payment;
// echo $phone_no;
// echo $purpose_of_donation;

$sql = $connection->prepare("INSERT INTO donor (name,pan_no,phone_no,address,payment_amt,mode_of_payment,purpose_of_donation) VALUES (?,?,?,?,?,?,?)");
$sql->bind_param('sssssss',$name,$pan_no,$phone_no,$address,$payment_amt,$mode_of_payment,$purpose_of_donation);
$sql->execute();



?>