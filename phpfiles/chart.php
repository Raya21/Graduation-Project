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
$sql = "SELECT * FROM scholarship_request ";
if ($result=mysqli_query($conn,$sql))
{
    // Return the number of rows in result set
    $rowcount=mysqli_num_rows($result);
    printf("Result set has %d rows.\n",$rowcount);
    // Free result set
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
            background-color: purple;
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
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['sname', 'No. of requests'],
                <?php
                $sql1 = "SELECT * FROM scholarship_request";
                $fire = mysqli_query($conn,$sql1);
                while($result = mysqli_fetch_assoc($fire)){
                    echo "['".$result['sname']."',".$rowcount."],";
                }
                ?>
            ]);

            var options = {
                title: 'Scholarchips'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }

    </script>

</head>
<body>
<div class="scholar">
    <h1>Charts</h1>
</div>
<div class="mane">
    <div id="piechart" width="600" height="300" style="background-color: #f00;"></div>
</div>

</body>
</html>

