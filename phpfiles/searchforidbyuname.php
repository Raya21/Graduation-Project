<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Users Info.</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <script src="https://kit.fontawesome.com/9c69e75105.js" crossorigin="anonymous"></script>
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
        form{
            padding: 10px;
        }
        table {
            border: 1px solid;
            border-collapse: collapse;
            width: 500px;
            text-align: center;
            color: white;
            margin-top: 10px;
            margin-left: 200px;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }
        .search{
            position: relative;
            top: -10px;
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
            left: 300px;
            top: 50px;
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
            margin-top: 20px;
            margin-left: 100px;
        }
        .sid{
            position: relative;
            left: 30px;
            top: 80px;
            color: white;


        }

    </style>
</head>
<body>
<div class="scholar">
    <h1>Users Info.</h1>
</div>
<div class="mane">
    <a href="showdata.php" style="color: white; font-size: 20px;"><i class='far fa-hand-point-right' style='font-size:20px;color:white; padding-left: 200px; padding-top: 20px'></i>Click here to go back</a>
    <form action="" method="post">
        <h3 class="sid">Student Name:</h3>
        <input type="text" name="search1" class="searchtxt">
        <input type="submit" name="btn_search1" value="Search" class="search">
    </form>
    <?php
    if(isset($_POST['btn_search1'])){

    ?>
    <div style="padding: 50px; overflow-x: auto;">

        <table>
            <?php
            $search1 = $_POST['search1'];
            $sh = mysqli_query($conn,"SELECT person_info.fname, familydatas1.studentIdCard FROM person_info, familydatas1 WHERE person_info.fname LIKE '%$search1%' AND familydatas1.studentName LIKE '%$search1%'");
            while($row=mysqli_fetch_assoc($sh)){
            ?>
            <tr>
                <td>Student Name</td>
                <td>Student ID Card</td>
            </tr>
            <tr>
                <td><?php echo $row['fname'];?></td>
                <td><?php echo $row['studentIdCard'];?></td>
            </tr>
            <?php
            }
            ?>
        </table>
        <?php

        }
        ?>
    </div>
</div>
</body>
</html>