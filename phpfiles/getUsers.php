<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . mysqli_connect_error());
}
$sql = "SELECT * FROM users";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    $data[]=$row;
}
echo json_encode($data);