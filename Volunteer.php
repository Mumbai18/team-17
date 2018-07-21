<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Volunteer Registration</title>
    <script src="js/jquery.min.js"></script>

    <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.css" />
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/slick-theme.css">
  <link rel="stylesheet" href="css/slick.css">

    <style>
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
      <div class="collapse navbar-collapse" id="navbarNav">
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
          <li class="nav-item active">
            <a href="contact.html" class="nav-link">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header id="page-header">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto text-center">
          <h1>Patient Registration</h1>
          
        </div>
      </div>
    </div>
  </header>

   <!-- PATIENT REGISTRATION SECTION -->
  <section id="contact" class="py-3">
    <div class="container">
      <div class="row">

        <form action="register_patient.php" method="post">
          <div class="card p-4">
            <div class="card-body">
              <h3 class="text-center">Please fill out this form to contact us</h3>
              <hr>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Name">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="number" name="age" class="form-control" placeholder="Age">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" name="gender" class="form-control" placeholder="Sex">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" name="hospital" class="form-control" placeholder="Hospital (File No.)">
                  </div>
                </div>
                
                 <div class="col-md-4">
                  <div class="form-group">
                      <select  name="city" class="form-control">

                            <?php

                            include_once ("connection.php");

                            $stmt2=$connection->prepare('SELECT name FROM city');

                            $stmt2->execute();
                            $stmt2->store_result();
                            $stmt2->bind_result($cityname);
                            if($stmt2-> num_rows > 0){
                                while($stmt2->fetch()){
                                    echo '<option value='.$cityname.'>'.$cityname.'</option>';


                                }


                            }

                            ?>


                      </select>
                 </div>
              </div>


                  <div class="col-md-4">
                      <div class="form-group">
                          <select class="form-control" name="type">

                                  <?php

                                  include_once ("connection.php");

                                  $stmt2=$connection->prepare('SELECT name_cancer FROM cancer_type');

                                  $stmt2->execute();
                                  $stmt2->store_result();
                                  $stmt2->bind_result($cityname);
                                  if($stmt2-> num_rows > 0){
                                      while($stmt2->fetch()){
                                          echo '<option value='.$cityname.'>'.$cityname.'</option>';


                                      }


                                  }

                                  ?>

                          </select>
                      </div>
                  </div>

                <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="phoneno" class="form-control" placeholder="Phone Number">
                  </div>
                </div>

              </div>
                  <div class="row">


                    <?php

                    include_once ("connection.php");
                         $stmt=$connection->prepare('Select name,id from  main_program');
                           $stmt->execute();
                           $stmt->store_result();
                           $stmt->bind_result($name,$id);

                      if($stmt-> num_rows > 0){
                          while($stmt->fetch()){

                              //echo "<div class=\"row\">";

                              echo "<div class='col-md-3'>";
                              echo "<div class=\"form-group\">";
                              echo "".$name.":";

                              echo '<select class="js-example-basic-multiple form-control multiselect"  name="service" multiple="multiple">';


                                $stmt1=$connection->prepare('SELECT name,id FROM sub_program WHERE main_program_id=?');
                                  $stmt1->bind_param("i",$id);
                                  $stmt1->execute();
                                  $stmt1->store_result();
                                  $stmt1->bind_result($subname,$subid);
                                  if($stmt1-> num_rows > 0){
                                      while($stmt1->fetch()){
                                                 echo '<option value='.$subid.'>'.$subname.'</option>';


                           }


                           }
                           echo "</select>";
                                  echo "</div>";
                                  echo "</div>";
                                  //echo "</div>";
                        }

                           }





                    ?>

                  </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <textarea name="followup" class="form-control" placeholder="Follow ups"></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <input type="submit" class="btn btn-outline-danger btn-block">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
      </form>
  </section>

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

  <script>

      $(document).ready(function() {

          $(".multiselect").multiselect({
              enableFiltering: true,
              enableCaseInsensitiveFiltering: true,
              maxHeight: 200
          });





      });
  </script>

  </script>


  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/bootstrap-multiselect.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.js"></script>
  <script src="js/slick.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
