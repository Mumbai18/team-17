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


$stmt=$connection->prepare('SELECT name from product');

$dataPoints2 = array();
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
		text: "Top 10 Google Play Categories - till 2017"
	},
	axisY: {
		title: "Number of Apps",
		includeZero: false
	},
	data: [{
		type: "column",
		dataPoints: <?php echo json_encode($dataPoints1, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();


 }
 </script>
 </head>
 <body>
 <div id="chartContainer" style="height: 370px; width: 50%; align:left"></div>
 <diaav id="barChartContainer" style="height: 370px; width: 100%;"></div>
 <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
 </body>
 </html>                              