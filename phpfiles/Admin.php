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
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap">
</head>
<body>
<div class="hero">
    <nav>
        <h2 class="logo">Hand <span>In</span> Hand</h2>
        <ul>
            <li><a href="scholarship.html">Scholarships</a></li>
            <li><a href="student.html">Outstanding students</a></li>
            <li><a href="messages.php">Messages</a></li>
        </ul>
    </nav>
</div>
</body>
</html>
