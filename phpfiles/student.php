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

$image = $_FILES['image']['name'];

//$imagePath = 'ProfileImages/'.$image;
//$imagePath ='C:/Users/HP/AndroidStudioProjects/swproject/lib/studentImages/'.$image;

$imagePath ='C:/Users/Msys/Desktop/Graduation-Project/lib/studentImages/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagePath);

$name = $_POST["fname"];
$desc = $_POST["desc"];

$sql = "INSERT INTO outstanding_students (fname, description, image) VALUES ('".$name."', '".$desc."', '".$image."')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("New record created successfully")</script>';
    header('Location: student.html');
} else {
    echo '<script>alert("Error student did not added")</script>';
    header('Location: student.html');
}

mysqli_close($conn);

?>
