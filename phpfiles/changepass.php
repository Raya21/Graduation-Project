<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
    echo "Database connection failed";
}
$id = $_GET['id'];
$username = $_GET['username'];

$select = $mydb->query("SELECT * FROM users WHERE id= '".$id."'AND username= '".$username."'");
$count = mysqli_num_rows($select);

$newPass = rand(11111,99999);
if($count == 1){
    $update = $mydb->query("UPDATE users SET password = '".$newPass."' WHERE id = '".$id."' AND username = '".$username."'");
    if($update){
        echo json_decode($newPass);
    }
}