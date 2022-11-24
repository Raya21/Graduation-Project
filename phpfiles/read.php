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
$message = $_GET['message'];
$sql = "SELECT * FROM contactus WHERE message='".$message."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $update = "UPDATE contactus SET status='read' WHERE message='".$message."'";
    $query = mysqli_query($conn,$update);
    if($query){
        echo 'hi';
    }
}