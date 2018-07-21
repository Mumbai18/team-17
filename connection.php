<?php

$server = 'localhost';
$username = 'root';
$password = '';
$database = 'vcare';

$connection = mysqli_connect($server, $username, $password, $database);

if(mysqli_connect_errno()){
	echo 'Failed to connect : ' . mysqli_connect_error();
}
// else{
// 	echo 'Connection Successfull';
// }
?>