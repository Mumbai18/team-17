<?php
//databse operations

include_once('functions.php');
include_once('connection.php');

if(isset($_POST['login'])) {

    $username = validateFormData($_POST['username']);
    $password = validateFormData($_POST['password']);
    //  echo $username."      ".$password;
    $table = validateFormData($_POST['table']);
    session_start();

    if ($table == "volunteer") {
        $stmt = $connection->prepare('Select volunteer_name,id,role_id from volunteer WHERE volunteer_name = ? and password = ?');
        // $stmt->bind_param("ss",$username,$password);
        $stmt->execute([$username,$password]);
        $stmt->store_result();
        $stmt->bind_result($vname, $vid, $vrole);
        $_SESSION['vname'] = $vname;
        $_SESSION['vid'] = $id;
        echo $vname;
        echo $vid;
        echo $vrole;
        if ($vrole == 1) {
            header('Location:admin.html');
        } else if ($vrole == 2) {

            header('Location:volunteer_detail.php');

        } else if ($vrole == 3) {

            header('Location:volunteer_detail.php');

        } else {
            header('Location:index.html');
        }
    } else if ($table == "donor") {
        $stmt1 = $connection->prepare('Select name,id from donor where name = ? and password = ?');
        $stmt1->execute([$username,$password]);
        $stmt1->store_result();
        $stmt1->bind_result($dname, $did);
        if ($stmt1->num_rows > 0) {
            $_SESSION['dname'] = $dname;
            $_SESSION['did'] = $did;
            header('Location:donor_detail.php');
        } else {
            header('Location:login.php');
        }

    } else if ($table == "patient") {

        $stmt2 = $connection->prepare('Select name,id from patient');
        $stmt2->execute();
        $stmt2->store_result();
        $stmt2->bind_result($pname, $pid);
        //$stmt2->fetch();
        echo "".$pname;
        if ($stmt2->num_rows > 0) {
            $_SESSION['pname'] = $pname;
            $_SESSION['pid'] = $pid;
            header('Location:patient_detail.php');


        } else {
            header('Location:login.php');
        }


    } else {

        header('Location:login.php');

    }


}



?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Volunteer Registration</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.css" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/slick-theme.css">
    <link rel="stylesheet" href="css/slick.css">
    <style type="text/css">
        .bs-example{
            margin: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container">
        <a href="index.html" class="navbar-brand">VCare</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navNavbar"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="index.html" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="about.html" class="nav-link">About Us</a>
                </li>
                <li class="nav-item">
                    <a href="Volunteer.php" class="nav-link">Volunteer</a>
                </li>
                <li class="nav-item">
                    <a href="Donor.html" class="nav-link">Donor</a>
                </li>
                <li class="nav-item">
                    <a href="contact.html" class="nav-link">Contact</a>
                </li>
                <li class="nav-item active">
                    <a href="login.php" class="nav-link">Login</a>
                  </li>
            </ul>
        </div>
    </div>
</nav>

<header id="page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6 m-auto text-center">
                <h1>Contact Us</h1>
                <p>To be added</p>
            </div>
        </div>
    </div>
</header>

<!-- PATIENT REGISTRATION SECTION -->
<section id="contact" class="py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card p-4">
                    <div class="card-body">
                        <h4>Get In Touch</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <h4>Address</h4>
                        <p>550 Main st Boston MA</p>
                        <h4>Email</h4>
                        <p>test@test.com</p>
                        <h4>Phone</h4>
                        <p>(555) 555-5555</p>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card p-4">
                    <div class="card-body">
                        <h3 class="text-center">Login</h3>
                        <hr>
                        <form class="form-horizontal" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="post">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <input type="text" name="username" class="form-control" placeholder="user name">
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <input type="text" name="password" class="form-control" placeholder="Password">
                                </div>
                            </div>
                            <div class="col-md-2"></div>

                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                            <select class="form-control" name="table">
                                        <option value="patient">Patient</option>
                                        <option value="volunteer">Volunteer</option>
                                        <option value="volunteer">Admin</option>
                                        <option value="volunteer">Staff</option>
                                        <option value="donor">Donor</option>

                            </select>

                            </div>
                                <div class="col-md-2"></div>



                                <br>
                                <div class="col-md-2"></div>
                                <br>
                                <div class="col-md-12" >
                                <input type="submit" name="login" value="Login" class="btn btn-outline-danger btn-block">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- STAFF SECTION -->
<section id="staff" class="py-5 text-center bg-dark text-white">
    <div class="container">
        <h1>Our Staff</h1>
        <hr>
        <div class="row">
            <div class="col-md-3">
                <img src="img/person1.jpg" alt="" class="img-fluid rounded-circle mb-2">
                <h4>Jane Doe</h4>
                <small>Marketing Manager</small>
            </div>
            <div class="col-md-3">
                <img src="img/person2.jpg" alt="" class="img-fluid rounded-circle mb-2">
                <h4>Sara Williams</h4>
                <small>Business Manager</small>
            </div>
            <div class="col-md-3">
                <img src="img/person3.jpg" alt="" class="img-fluid rounded-circle mb-2">
                <h4>John Doe</h4>
                <small>CEO</small>
            </div>
            <div class="col-md-3">
                <img src="img/person4.jpg" alt="" class="img-fluid rounded-circle mb-2">
                <h4>Steve Smith</h4>
                <small>Web Developer</small>
            </div>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.js"></script>
<script src="js/slick.js"></script>
<script src="js/main.js"></script>
</body>
</html>



