<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$help = $_POST['help'];
$insert = "INSERT INTO add_help(email,help)VALUES('".$email."','".$help."')";
$query = mysqli_query($mydb,$insert);
if ($query) {
    echo json_encode("Success");
}else{
    echo json_encode("Failed");
}