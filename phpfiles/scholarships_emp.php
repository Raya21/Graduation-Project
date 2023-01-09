<?php
/// We need to use sessions, so you should always start sessions using the below code.
session_start();
// If the user is not logged in redirect to the login page...
if (!isset($_SESSION['loggedin'])) {
    header('Location: Admin.php');
    exit;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Scholarships's Employee</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap">
    <style>
        iframe{
            margin-left: 150px;
            margin-top: 20px;
            border: none;
            border-radius: 20px;
            width: 1000px;
            height: 1200px;
        }
        nav{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 40px;
            padding-left: 15%;
            padding-right: 30%;
        }
    </style>
</head>
<body>
<div class="hero">
    <nav>
        <h2 class="logo">Hand <br><span style="padding-left: 25px">In</span><br> Hand</h2>
        <ul>
            <li><a href="scholarship.html" target="_myiframe">Scholarships</a></li>
            <li><a href="getscholars.php" target="_myiframe">Make an appointment</a></li>
            <li><a href="showdata.php" target="_myiframe">Users Info.</a></li>
            <li><a href="chart.php" target="_myiframe">Dashboard</a></li>

        </ul>
    </nav>
    <iframe src="" name="_myiframe" id="1"></iframe>
</div>
</body>
</html>
