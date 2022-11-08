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

$sname = $_POST["s_name"];
$slink = $_POST["linkk"];
$desc = $_POST["desc"];

$sql = "INSERT INTO scholarships (sname, slink, description) VALUES ('$sname', '$slink','$desc')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("New record created successfully")</script>';
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);

?>

