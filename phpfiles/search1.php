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
$sname = $_POST['query'];
$sql = "SELECT * FROM scholarships WHERE sname LIKE '%$sname%'";
$res = $conn->query($sql);
while ($row = $res->fetch_assoc()){
    $data[] = $row;
}
echo json_encode($data);