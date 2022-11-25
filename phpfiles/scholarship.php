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
$desc = $_POST["desc"];
$quali = $_POST["quali"];
$percent = $_POST["percent"];
$attach = $_POST['attach'];

$sql = "INSERT INTO scholarships (sname, description, qualifications, percentage, attachments) VALUES ('$sname', '$desc','$quali','$percent','$attach')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("New record created successfully")</script>';
    header('Location: scholarship.html');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);

?>

