<?php
    include_once('connection.php');
    session_start();
?>
<html>
<head>
    <title>Displaying MySQL Data in HTML Table</title>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Vcare</title>
  <link rel="stylesheet" href="css1/font-awesome.min.css">
  <link rel="stylesheet" href="css1/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.css" />
  <link rel="stylesheet" href="css1/style.css">
    <style type="text/css">
        body {
            font-size: 15px;
            color: #343d44;
            font-family: "segoe-ui", "open-sans", tahoma, arial;
            padding: 0;
            margin: 0;
        }
        table {
            margin: auto;
            font-family: "Lucida Sans Unicode", "Lucida Grande", "Segoe Ui";
            font-size: 12px;
        }

        h1 {
            margin: 25px auto 0;
            text-align: center;
            text-transform: uppercase;
            font-size: 17px;
        }

        table td {
            transition: all .5s;
        }

        /* Table */
        .data-table {
            border-collapse: collapse;
            font-size: 14px;
            min-width: 537px;
        }

        .data-table th,
        .data-table td {
            border: 1px solid #e1edff;
            padding: 7px 17px;
        }
        .data-table caption {
            margin: 7px;
        }

        /* Table Header */
        .data-table thead th {
            background-color: #508abb;
            color: #FFFFFF;
            border-color: #6ea1cc !important;
            text-transform: uppercase;
        }

        /* Table Body */
        .data-table tbody td {
            color: #353535;
        }
        .data-table tbody td:first-child,
        .data-table tbody td:nth-child(4),
        .data-table tbody td:last-child {
            text-align: right;
        }

        .data-table tbody tr:nth-child(odd) td {
            background-color: #f4fbff;
        }
        .data-table tbody tr:hover td {
            background-color: #ffffa2;
            border-color: #ffff0f;
        }

        /* Table Footer */
        .data-table tfoot th {
            background-color: #e5f5ff;
            text-align: right;
        }
        .data-table tfoot th:first-child {
            text-align: left;
        }
        .data-table tbody td:empty
        {
            background-color: #ffcccc;
        }
        .dropdown-submenu {
    position: relative;
}

.dropdown-submenu .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -1px;
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
            <a href="Volunteer.php" class="nav-link">Patient</a>
          </li>
          <li class="nav-item active">
            <a href="register_donor.html" class="nav-link">Donor</a>
          </li>
          <li class="nav-item">
            <a href="contacts.html" class="nav-link">Contact</a>
          </li>
          <li class="nav-item">
            <a href="login.php" class="nav-link">Login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  
<br><br>
<table class="data-table">
    <caption class="title">Volunteer Details</caption>
    <thead>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Phone No</th>
        <th>Skills</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <?php
    $volunteer_id = $_SESSION['vid'];
    if($stmt = $connection->prepare("SELECT * FROM volunteer WHERE id = ?")) {

        $stmt->bind_param("i", $volunteer_id);
        $stmt->execute();
        $stmt->bind_result($id, $volunteer_name, $skills,$address, $phone_no,$role_id,$password,$email);

        while ($stmt->fetch()) {
            // Because $name and $countryCode are passed by reference, their value
            // changes on every iteration to reflect the current row

            echo "<tr><td>";
            echo "$volunteer_name</td><td>";
            echo "$address</td><td>";

            echo "$phone_no</td><td>";
            echo "$skills</td><td>";
            echo "$email</td><td>";
        }
    }
    ?>
    </tbody>

</table>

<table class="data-table">
    <caption class="title">Volunteer History</caption>
    <thead>
    <tr>
        <th>Patient Name</th>
        <th>Age</th>
        <th>Hospital File No</th>
        <th>Type 0f Cancer</th>
        <th>Gender</th>
        <th>Service</th>

    </tr>

    </thead>
    <tbody>
    <!--    --><?php
    $volunteer_id =session_id();
    //
    if($stmt = $connection->prepare("SELECT patient_id,sub_program_id FROM patient_volunteer_relation WHERE volunteer_id = ?")) {
        $stmt->bind_param("i", $volunteer_id);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($patient_id,$sub_program_id);
        $i=0;
    while ($stmt->fetch()) {


        if($stmt1 = $connection->prepare("SELECT name,age,file_no,type_of_cancer,gender FROM patient WHERE id = ?")) {
            $stmt1->bind_param("i", $patient_id);
            $stmt1->execute();
            $stmt1->bind_result($name, $age, $file_no, $type_of_cancer, $gender);
            while ($stmt1->fetch()) {
                echo "<tr><td>";
                echo "$name</td><td>";
                echo "$age</td><td>";
                echo "$file_no</td><td>";
                echo "$type_of_cancer</td><td>";
                echo "$gender</td><td>";

            }
            $stmt1->close();
        }
            if($stmt1 = $connection->prepare("SELECT name FROM sub_program WHERE id = ?")){
                $stmt1->bind_param("i", $sub_program_id);
                $stmt1->execute();
                $stmt1->bind_result($name);
                while($stmt1->fetch()){

                    echo "$name</td></tr>";

                }
            $stmt1->close();
            $i=$i+1;
        }

    }$stmt->close();
    }

    //    include_once('connection.php');
    //    $patient_id=1;
    //    if($stmt = $connection->prepare("SELECT * FROM patient_volunteer_relation WHERE patient_id = ?")) {
    //
    //        $stmt->bind_param("i", $patient_id);
    //        $stmt->execute();
    //        $stmt->bind_result($patient_id, $volunteer_id, $sub_program_id, $date_of_allotment,$comment);
    //
    //        while ($stmt->fetch()) {
    //            // Because $name and $countryCode are passed by reference, their value
    //            // changes on every iteration to reflect the current row
    //            echo "$patient_id";
    //            echo "$volunteer_id";
    //            if($stm1 = $connection->prepare("SELECT * FROM `patient` WHERE id=?")){
    //            $stm1->bind_param("i", $patient_id);
    //                if ($stm1->execute()) {
    //                    echo "Success";
    //                } else {
    //                    print $stm1->error;
    //                }
    //            }

    //            if ($stmt1 = $connection->prepare("SELECT name FROM patient WHERE id = ?")) {
    //                $stmt1->bind_param("s", $patient_id);
    //                $stmt1->execute();
    //                $stmt1->bind_result($patient_name);
    //
    //                while ($stmt1->fetch()) {
    //                    echo "$patient_name";
    //                    if ($stmt2 = $connection->prepare("SELECT volunteer_name FROM volunteer WHERE id = ?")) {
    //
    //                        $stmt2->bind_param("s", $volunteer_id);
    //                        $stmt2->execute();
    //                        $stmt2->bind_result($volunteer_name);
    //                        while($stmt2->fetch()) {
    //                            if ($stmt3 = $connection->prepare("SELECT name FROM sub_program WHERE id = ?")) {
    //                                $stmt3->bind_param("s", $sub_program_id);
    //                                $stmt3->execute();
    //                                $stmt3->bind_result($sub_program_name);
    //                                while($stmt3->fetch()) {
    //
    //                                    echo "<tr><td>";
    //                                    echo "$patient_name</td><td>";
    //                                    echo "$volunteer_name</td><td>";
    //                                    echo "$sub_prorgram_name</td><td>";
    //                                    echo "$date_of_allotment</td><td>";
    //                                    echo "$comment</td></tr>";
    //                                    $stmt3->close();
    //                                }
    //                            }
    //                            $stmt2->close();
    //                        }
    //                    }
    //                    $stmt1->close();
    //                }
    //            }

    //        }
    //        $stmt->close();
    //    }
    //    ?>
    </tbody>

</table>
  <!-- STAFF SECTION -->
  <section id="staff" class="py-5 text-center bg-dark text-white">
    <div class="container">
      <h1>Our Team</h1>
      <hr>
      <div class="row">
        <div class="col-md-3">
          <img src="img/im1.png" alt="" class="img-fluid rounded-circle mb-2">
          <h4>Vandana Gupta</h4>
          <small>All Rounder</small>
        </div>
        <div class="col-md-3">
          <img src="img/im2.png" alt="" class="img-fluid rounded-circle mb-2">
          <h4>Sangeeta Kadakia</h4>
          <small>Volunteer Management</small>
        </div>
        <div class="col-md-3">
          <img src="img/im3.png" alt="" class="img-fluid rounded-circle mb-2">
          <h4>Jyoti Patil Shah</h4>
          <small>Administration and Patient Assistance Program</small>
        </div>
        <div class="col-md-3">
          <img src="img/im4.png" alt="" class="img-fluid rounded-circle mb-2">
          <h4>Chahna Gandhi</h4>
          <small>Hospitality Management</small>
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
