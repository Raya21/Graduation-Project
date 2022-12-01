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
$fname = $_POST['query'];
$sql = "SELECT * FROM outstanding_students WHERE fname LIKE '%$fname%'";
$res = $conn->query($sql);
while ($row = $res->fetch_assoc()){
    $data[] = $row;
}
echo json_encode($data);