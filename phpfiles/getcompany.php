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
$sql = "SELECT * FROM jscompanies";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    $data[]=$row;
}
echo json_encode($data);