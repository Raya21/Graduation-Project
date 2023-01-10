<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="styles/style1.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap">
    <style>
        input[type="submit"]{
            border: none;
            outline: none;
            background: rebeccapurple;
            padding: 11px 25px;
            width: 100px;
            margin-top: 20px;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
        }
        input[type="submit"]:active{
            opacity: 0.8;
        }
        .box{
            position: relative;
            width: 500px;
            height: 570px;
            background: #1c1c1c;
            border-radius: 8px;
            overflow: hidden;
        }
        .box::before{
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 500px;
            height: 570px;
            background: linear-gradient(0deg,transparent,rebeccapurple,rebeccapurple);
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
        }
        .box::after{
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 500px;
            height: 570px;
            background: linear-gradient(0deg,transparent,rebeccapurple,rebeccapurple);
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
            animation-delay: -3s;
        }
    </style>
</head>
<body>
<?php
$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'handinhand';
// Try and connect using the info above.
$con = mysqli_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS, $DATABASE_NAME);
if ( mysqli_connect_errno() ) {
    // If there is an error with the connection, stop the script and display the error.
    exit('Failed to connect to MySQL: ' . mysqli_connect_error());
}

if (isset($_REQUEST['username'])) {
    // removes backslashes
    $username = stripslashes($_REQUEST['username']);
    //escapes special characters in a string
    $username = mysqli_real_escape_string($con, $username);
    $email    = stripslashes($_REQUEST['email']);
    $email    = mysqli_real_escape_string($con, $email);
    $password = stripslashes($_REQUEST['password']);
    $password = mysqli_real_escape_string($con, $password);
    $create_datetime = date("Y-m-d H:i:s");
    if(isset($_POST['lemployee'])){
        $query    = "INSERT into `employee_requests` (username, password, email, emp_type, created_at)
                     VALUES ('$username', '$password', '$email', 'loans employee','$create_datetime')";
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo '<script>alert("Please wait the admin to accept your request")</script>';
            header('Location: admin_login.html');
        } else {
            header('Location: admin_signup.php');
        }
    }else if(isset($_POST['osemployee'])){
        $query    = "INSERT into `employee_requests` (username, password, email, emp_type, created_at)
                     VALUES ('$username', '$password', '$email', 'outstanding student employee','$create_datetime')";
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo '<script>alert("Please wait the admin to accept your request")</script>';
            header('Location: admin_login.html');
        } else {
            header('Location: admin_signup.php');
        }
    }
    else if(isset($_POST['memployee'])){
        $query    = "INSERT into `employee_requests` (username, password, email, emp_type, created_at)
                     VALUES ('$username', '$password', '$email', 'messages employee','$create_datetime')";
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo '<script>alert("Please wait the admin to accept your request")</script>';
            header('Location: admin_login.html');
        } else {
            header('Location: admin_signup.php');
        }
    }
    else if(isset($_POST['semployee'])){
        $query    = "INSERT into `employee_requests` (username, password, email, emp_type, created_at)
                     VALUES ('$username', '$password', '$email', 'scholarships employee','$create_datetime')";
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo '<script>alert("Please wait the admin to accept your request")</script>';
            header('Location: admin_login.html');
        } else {
            header('Location: admin_signup.php');
        }
    }
    else{
        echo '<script>alert("Please choose one type of employee")</script>';
        header('Location: admin_login.html');
    }

} else {
?>
<div class="box">
    <div class="form">
        <h2>Sign Up</h2>
        <form action="" method="post">
            <div class="inputBox">
                <input type="text" required="required" name="username">
                <span>Username</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="email" required="required" name="email">
                <span>Email</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="password" required="required" name="password">
                <span>Password</span>
                <i></i>
            </div>
            <input type="radio" name="lemployee" value="lemployee" style="color: #8f8f8f; margin-top: 20px">
            <label for="lemployee" style="color: #8f8f8f; margin-top: 20px"> Sign up as loans staff</label><br>
            <input type="radio" name="semployee" value="semployee">
            <label for="semployee" style="color: #8f8f8f; margin-top: 10px"> Sign up as scholarships staff</label><br>
            <input type="radio" name="osemployee" value="osemployee">
            <label for="osemployee" style="color: #8f8f8f; margin-top: 10px"> Sign up as outstanding students staff</label><br>
            <input type="radio" name="memployee" value="memployee">
            <label for="memployee" style="color: #8f8f8f; margin-top: 10px"> Sign up as messages staff</label><br>
            <input type="submit" value="Sign Up">
        </form>
    </div>
</div>
    <?php
}
?>
</body>
</html>
