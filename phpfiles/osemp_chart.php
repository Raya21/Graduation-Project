<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand2";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


$query = "SELECT * FROM outstanding_students";

// Execute the query and store the result set
$result = mysqli_query($conn, $query);

if ($result)
{
    // it return number of rows in the table.
    $row = mysqli_num_rows($result);

    /*if ($row)
    {
        printf("Number of row in the table : " . $row);
    }*/
    // close the result.
    mysqli_free_result($result);
}
?>
<html>
<head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: rgb(0,0,0,0.5);
            background-size: cover;
            background-position: center;
            font-family: sans-serif;
            margin-top: 0px;
            max-width: 100vw;
            overflow-x: hidden;
        }
        .mane{
            background-color: rgb(0,0,0,0.5);
            width: 1000px;
            height: auto;
            margin: auto;
        }
        .scholar{
            width: 1000px;
            background-color: rgb(0,0,0,6);
            margin: auto;
            color: #FFFFFF;
            padding: 10px 0px 10px 0px;
            text-align: center;
            border-radius: 15px 15px 0px 0px;
        }
        .search{
            position: relative;
            top: -20px;
            left: 600px;
            background-color: black;
            display: block;
            margin: 20px 0 0 20px;
            text-align: center;
            border-radius: 12px;
            border: 2px solid mediumpurple;
            padding: 14px 45px;
            outline: none;
            color: white;
            cursor: pointer;
            font-size: medium;
        }
        .searchtxt{
            position: relative;
            left: 330px;
            top: 40px;
            line-height: 20px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 250px;
            height: 35px;
        }
        h3{
            color: white;
            margin-top: 10px;
            margin-left: 100px;
        }
        .sid{
            position: relative;
            left: 30px;
            top: 70px;
            color: white;


        }

    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart1);

        function drawChart1() {

            var data = google.visualization.arrayToDataTable([
                ['outstanding students', 'No. of outstanding students'],
                <?php
                echo "['No. of outstanding students',".$row."],";
                ?>
            ]);

            var options = {

                title:  "No. of outstanding students= "+<?php echo $row;?>
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

            chart.draw(data, options);
        }


    </script>


</head>
<body>
<div class="scholar">
    <h1>Dashboard</h1>
</div>
<div class="mane">
    <div id="piechart1" width="600" height="300" style="background-color: #f00;"></div>

</div>
<div class="mane">
</body>
</html>
