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
$email1 = $_POST['email'];
$sname = $_POST['sname'];
$image = $_FILES['image']['name'];
$imagePath = 'suploads/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];
move_uploaded_file($tmp_name,$imagePath);
$conn->query("INSERT INTO scholarship_attachs (email,sname,image) VALUES ('".$email1."','".$sname."','".$image."')");
