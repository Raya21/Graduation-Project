<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand2";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$id = $_GET['id'];
echo $id;
$sql = "SELECT * FROM contactus WHERE id='".$id."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $update = "UPDATE contactus SET status='not read' WHERE id='".$id."'";
    $query = mysqli_query($conn,$update);
    if($query){
        header('Location: messages.php');
    }
}