<?php
$mydb= mysqli_connect("localhost","root","","handinhand2");

if(!$mydb)
{
    echo "Database connection failed";
}

$email=$_POST['email'];
$topic = $_POST['topic'];
$message = $_POST['message'];
$date= date("Y/m/d");

$sql = "SELECT username FROM users WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$row = mysqli_fetch_assoc($result);


$insert = "INSERT INTO contactus(username,email,topic,message,date)VALUES('".$row["username"]."','".$email."','".$topic."','".$message."','".$date."')";
$query = mysqli_query($mydb,$insert);
if ($query) {
    echo json_encode("Success");
}



?>