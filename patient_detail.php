<html>
<head>
    <title>Displaying MySQL Data in HTML Table</title>
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
    </style>
</head>
<body>
<h1>Table 1</h1>
<table class="data-table">
    <caption class="title">Paitent Details</caption>
    <thead>
    <tr>
        <th>Name</th>
        <th>Phone No</th>
        <th>Age</th>
        <th>Hospital</th>
        <th>Cancer Type</th>
        <th>address</th>


        <th>Date of Registration</th>
        <th>Last Modified</th>
        <th>Gender</th>
        <th>File No</th>
        <th>Follow Up</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <?php
    include_once('connection.php');
    session_start();
    $patient_id = $_SESSION['pid'];
    // echo "<table>";
    if($stmt = $connection->prepare("SELECT * FROM patient WHERE id = ?")) {

        $stmt->bind_param("s", $patient_id);
        $stmt->execute();
        $stmt->bind_result($id, $name, $hospital, $age, $type_of_cancer, $address, $date_of_reg, $last_modified, $gender, $file_no, $phone_no, $follow_up, $password, $email);

        while ($stmt->fetch()) {
            // Because $name and $countryCode are passed by reference, their value
            // changes on every iteration to reflect the current row

            echo "<tr><td>";
            echo "$name</td><td>";
            echo "$phone_no</td><td>";

            echo "$age</td><td>";
            echo "$hospital</td><td>";
            echo "$type_of_cancer</td><td>";
            echo "$address</td>";
            echo "<td>";
            echo "$date_of_reg</td><td>";
            echo "$last_modified</td><td>";
            echo "$gender</td><td>";
            echo "$file_no</td><td>";
            echo "$follow_up<br></td></tr>";
        }
    }
    ?>
    </tbody>

</table>

<table class="data-table">
    <caption class="title">Patient History</caption>
    <thead>
    <tr>

    <th>Volunteer Name</th>
    <th>Phone No</th>
    <th>Skills</th>

        <th>Service</th>
    </tr>

    </thead>
    <tbody>
<!--    --><?php
//$patient_id =session_id();
$patient_id=1;
if($stmt = $connection->prepare("SELECT volunteer_id,sub_program_id FROM patient_volunteer_relation WHERE patient_id = ?")) {
    $stmt->bind_param("i", $patient_id);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($volunteer_id,$sub_program_id);
    $i=0;
    while ($stmt->fetch()) {
    

        if($stmt1 = $connection->prepare("SELECT volunteer_name,phone_no,skills FROM volunteer WHERE id = ?")){
            $stmt1->bind_param("i", $volunteer_id);
            $stmt1->execute();
            $stmt1->bind_result($name, $phone_no, $skills);
            while($stmt1->fetch()){
                echo "<tr><td>";
                echo "$name</td><td>";
                echo "$phone_no</td><td>";
                echo "$skills</td><td>";

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


    ?>
    </tbody>

</table>
</body>
</html>
