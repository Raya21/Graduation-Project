<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
    echo "Database connection failed";
}

$fname = $_POST['fname'];
$id = $_POST['id'];
$bdate = $_POST['birthofdate'];
$bplace = $_POST['birthplace'];
$city = $_POST['city'];

$sql = "INSERT INTO personinfo ()"
?>