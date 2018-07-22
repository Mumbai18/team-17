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
    <caption class="title">Donor List</caption>
    <thead>
    <tr>
        <th>Name</th>
        <th>Pan No</th>
        <th>Phone No</th>
        <th>Address</th>
        <th>Payment amt</th>
        <th>Mode of payment</th>

    </tr>
    </thead>
    <tbody>

    <?php
    include_once('connection.php');
    session_start();

    if($stmt = $connection->prepare("SELECT name,pan_no,phone_no,address,payment_amt,mode_of_payment FROM donor")) {
        $stmt->execute();
        $stmt->bind_result($name, $pan_no, $phone_no,$address,$payment_amt,$mode_of_payment);

        while ($stmt->fetch()) {
            // Because $name and $countryCode are passed by reference, their value
            // changes on every iteration to reflect the current row

            echo "<tr><td>";
            echo "$name</td><td>";
            echo "$pan_no</td><td>";
            echo "$phone_no</td><td>";
            echo "$address</td><td>";
            echo "$payment_amt</td><td>";
            echo "$mode_of_payment</td></tr>";

        }
        $stmt->close();
    }
    ?>
    </tbody>


</table>
</body>
</html>
