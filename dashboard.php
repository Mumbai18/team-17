<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Vcare</title>
  <link rel="stylesheet" href="css1/font-awesome.min.css">
  <link rel="stylesheet" href="css1/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.2.0/ekko-lightbox.css" />
  <link rel="stylesheet" href="css1/style.css">
	<title></title>
</head>
<?php
 
include_once("connection.php");

echo '<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container">
      <a href="index.html" class="navbar-brand">Vcare</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navNavbar"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navNavbar">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="register_volunteer.html" class="nav-link">Volunteer</a>
          </li>
          <li class="nav-item">
            <a href="patientlist.php" class="nav-link">Patient</a>
          </li>
          <li class="nav-item">
            <a href="donorlist.php" class="nav-link">Donor</a>
          </li>
          <li class="nav-item">
            <a href="logout.php" class="nav-link">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>';

$stmt=$connection->prepare('SELECT name from city');

$dataPoints = array();
$i=0;
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($cityName);


$cityCount = 0;
if($stmt->num_rows > 0){

  while($stmt->fetch()){
    
      
      $stmt1=$connection->prepare("SELECT count(id) as num FROM patient WHERE address= ? ");
      $stmt1->bind_param("s",$cityName);
      $stmt1->execute();
      $stmt1->store_result();
      $stmt1->bind_result($cityCount);
      $stmt1->fetch();
      $dataPoints[$i]=array("label"=>$cityName,"y"=>$cityCount);
       //echo $cityName .' ' . $cityCount;
      $i++;


    }

}


$stmt=$connection->prepare('select product_name,quantity from product');
$dataPoints2 = array();
$i=0;
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($product_name,$quantity);

if($stmt->num_rows > 0){

  while($stmt->fetch()){
      $dataPoints2[$i]=array("label"=>$product_name,"y"=>$quantity);
       //echo $cityName .' ' . $cityCount;
      $i++;


    }

}

 

$stmt=$connection->prepare("select gender,count(gender) from patient where gender='Male'");
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($males,$malecount);
$stmt->fetch();
$stmt1=$connection->prepare("select gender,count(gender) from patient where gender='Female'");
$stmt1->execute();
$stmt1->store_result();
$stmt1->bind_result($females,$femalecount);
$stmt1->fetch();
//$total=$malecount+$femalecount;





$dataPoints3 = array(
	array("label"=> $femalecount, "Symbol"=> "F", "y"=>$femalecount),
	array("label"=> $malecount, "Symbol"=> "M", "y"=>$malecount)
);


//age plot
$stmt=$connection->prepare("select count(*) from patient where age between 0 and 20");
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($count1);
$stmt->fetch();
$a=$count1;

$stmt1=$connection->prepare("select count(*) from patient where age between 21 and 40");
$stmt1->execute();
$stmt1->store_result();
$stmt1->bind_result($count2);
$stmt1->fetch();
$b=$count2;

$stmt2=$connection->prepare("select count(*) from patient where age between 41 and 60");
$stmt2->execute();
$stmt2->store_result();
$stmt2->bind_result($count3);
$stmt2->fetch();
$c=$count3;

$stmt3=$connection->prepare("select count(*) from patient where age between 61 and 80");
$stmt3->execute();
$stmt3->store_result();
$stmt3->bind_result($count4);
$stmt3->fetch();
$d=$count4;


$stmt4=$connection->prepare("select count(*) from patient where age between 81 and 100");
$stmt4->execute();
$stmt4->store_result();
$stmt4->bind_result($count5);
$stmt4->fetch();
$d=$count5;

$dataPoints4 = array( 
	array("y" => $count1, "label" => "10-20" ),
	array("y" => $count2, "label" => "21-40" ),
	array("y" => $count3, "label" => "41-60" ),
	array("y" => $count4, "label" => "61-80" ),
	array("y" => $count5, "label" => "81-100" ),
	
);


$dataPoints5= array();
$i=0;

$stmt9=$connection->prepare('SELECT name_cancer from cancer_type');
$stmt9->execute();
$stmt9->store_result();
$stmt9->bind_result($cancertype);


//$cityCount = 0;
if($stmt9->num_rows > 0){

  while($stmt9->fetch()){
    
      
      $stmt10=$connection->prepare("SELECT count(*) from patient where type_of_cancer=? ");
      $stmt10->bind_param("s",$cancertype);
      $stmt10->execute();
      $stmt10->store_result();
      $stmt10->bind_result($patientCount);
      $stmt10->fetch();
      $dataPoints5[$i]=array("label"=>$cancertype,"y"=>$patientCount);
       //echo $cityName .' ' . $cityCount;
      $i++;


    }

}



?>
   
 
 <!DOCTYPE HTML>
 <html>
 <head>  
 <script>
 window.onload = function () {
  
 var chart = new CanvasJS.Chart("chartContainer", {
   animationEnabled: true,
   exportEnabled: true,
   title:{
     text: "Number of patients based on Location"
   },
   
   data: [{
     type: "pie",
     showInLegend: "true",
     legendText: "{label}",
     indexLabelFontSize: 16,
     indexLabel: "{label} - #percent%",
     yValueFormatString: "฿#,##0",
     dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
   }]
 });
 chart.render();
  

 var chart = new CanvasJS.Chart("barChartContainer", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title: {
		text: "Product Quantity"
	},
	axisY: {
		title: "Quantity",
		includeZero: false
	},
	data: [{
		type: "column",
		dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();


//chart
var chart = new CanvasJS.Chart("circleContainer", {
	theme: "light2",
	animationEnabled: true,
	title: {
		text: "Mens Vs Female"
	},
	data: [{
		type: "doughnut",
		indexLabel: "{symbol} - {y}",
		yValueFormatString: "#,##0.0\"%\"",
		showInLegend: true,
		legendText: "{label} : {y}",
		dataPoints: <?php echo json_encode($dataPoints3, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();


//age chart
var chart = new CanvasJS.Chart("ageContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Age"
	},
	axisX: {
		title: "Catogories of Ages"
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0.## tonnes",
		dataPoints: <?php echo json_encode($dataPoints4, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();




  
  var chart = new CanvasJS.Chart("typeContainer", {
   animationEnabled: true,
   exportEnabled: true,
   title:{
     text: "Number of patients based on Cancer Type"
   },
   
   data: [{
     type: "pie",
     showInLegend: "true",
     legendText: "{label}",
     indexLabelFontSize: 16,
     indexLabel: "{label} - #percent%",
     yValueFormatString: "฿#,##0",
     dataPoints: <?php echo json_encode($dataPoints5, JSON_NUMERIC_CHECK); ?>
   }]
 });
 chart.render();
  



 }
 </script>
 </head>
 <body>
 <div id="chartContainer" style="height: 370px; width: 100%; align:left"></div><br><br>
 <div id="barChartContainer" style="height: 370px; width: 100%; align:right"></div><br><br>
 <div id="circleContainer" style="height: 370px; width: 100%;"></div><br><br>
 <div id="ageContainer" style="height: 370px; width: 100%;"></div><br><br>
 <div id="typeContainer" style="height: 370px; width: 100%;"></div><br><br>

 <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
 </body>
 </html>                              