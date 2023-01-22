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

if(isset($_POST['btn_search1'])){
    $search1 = $_POST['search1'];

    $sql = "SELECT COUNT(*) FROM loan_request WHERE lname='$search1'";

    if ($result=mysqli_query($conn,$sql))
    {
        // Return the number of rows in result set
        $rowcount=mysqli_num_rows($result);
        // printf("Result set has %d rows.\n",$rowcount);
        // Free result set
        mysqli_free_result($result);
    }

}
$query1 = "SELECT * FROM loan_request";

// Execute the query and store the result set
$result1 = mysqli_query($conn, $query1);

if ($result1)
{
    // it return number of rows in the table.
    $row1 = mysqli_num_rows($result1);

    /*if ($row)
    {
        printf("Number of row in the table : " . $row);
    }*/
    // close the result.
    mysqli_free_result($result1);
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
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['lname', 'No. of requests'],
                <?php
                $percent = $row1 - $rowcount;
                echo "['".$search1."',".$rowcount."],";
                echo "['Others',".$percent."],";
                ?>
            ]);

            var options = {

                title:  "No. of loan requests"
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }



    </script>


</head>
<body>
<div class="scholar">
    <h1>Dashboard</h1>
</div>
<div class="mane">
    <?php
    $query = "SELECT * FROM loans";

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
    <script>
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart1);

        function drawChart1() {

            var data = google.visualization.arrayToDataTable([
                ['Loan', 'No. of loans'],
                <?php
                echo "['No. of loans',".$row."],";
                ?>
            ]);

            var options = {

                title:  "No. of loans= "+<?php echo $row;?>
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

            chart.draw(data, options);
        }
    </script>
    <div id="piechart1" width="600" height="300" style="background-color: #f00;"></div>
    <form action="" method="post">
        <h3 class="sid">Loan Name:</h3>
        <input type="text" name="search1" class="searchtxt" >
        <input type="submit" name="btn_search1" value="Search" class="search">
    </form>
    <div id="piechart" width="600" height="300" style="background-color: #f00;"></div>
</div>
<div class="mane">
</body>
</html>
