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
$email = $_POST['email'];
$password = $_POST['password'];
$currentDateTime = date('Y-m-d');

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
echo $currentDateTime;
$sql = $connection->prepare("INSERT INTO donor ( name,pan_no,phone_no,address,payment_amt,mode_of_payment,purpose_of_donation,email_id,password) VALUES (?,?,?,?,?,?,?,?,?)");
$sql->bind_param('sssssssss',$name,$pan_no,$phone_no,$address,$payment_amt,$mode_of_payment,$purpose_of_donation,$email,$password);

if($sql->execute()){
	?>
            <script type="text/javascript">
                alert("Data entered successfully");
                window.location = "register_donor.html"
            </script>
            <?php
}
else{
	echo "Error encountered";
}



?>