<?php
$mydb= mysqli_connect("localhost","root","","handinhand2");

if(!$mydb)
{
    echo "Database connection failed";
}
$donoremail = $_POST['donoremail'];
$donateID = $_POST['donateID'];
$email = $_POST['email'];
$original = $_POST['original'];
$remaining = $_POST['remaining'];
$todonate = $_POST['todonate'];
$newremaining = $remaining - $todonate;

$insert = "INSERT INTO donations (id,donorEmail,donatedmoney) VALUES('".$donateID."','".$donoremail."','".$todonate."')";
$query1 = mysqli_query($mydb,$insert);
if($query1){
    $update = "UPDATE add_help SET remaining='".$newremaining."' WHERE id='".$donateID."'";
    $query = mysqli_query($mydb,$update);
    if($query){
        echo json_encode("Success");
    }
}
else{
    echo json_encode("Failed");
}