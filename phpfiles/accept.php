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
$id = $_GET['id'];
echo $id;
$sql = "SELECT * FROM add_help WHERE id='".$id."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $update = "UPDATE add_help SET accept='accept' WHERE id='".$id."'";
    $query = mysqli_query($conn,$update);
    if($query){
        header('Location: accepthelp.php');
    }
}