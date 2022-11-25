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

// Get reference to uploaded image
$image_file = $_FILES["image"];
$image_name = $_FILES["image"]["name"];

// Image not defined, let's exit
if (!isset($image_file)) {
    die('No file uploaded.');
}

// Move the temp image file to the images/ directory
move_uploaded_file(
// Temp image location
    $image_file["tmp_name"],

    // New image location, __DIR__ is the location of the current PHP file
    __DIR__ . "/images/" . $image_file["name"]
);
$name = $_POST["fname"];
$desc = $_POST["desc"];

$sql = "INSERT INTO outstanding_students (fname, description, image) VALUES ('$name', '$desc', 'images/$image_name')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("New record created successfully")</script>';
    header('Location: student.html');
} else {
    echo '<script>alert("Error student did not added")</script>';
    header('Location: student.html');
}

mysqli_close($conn);

?>

