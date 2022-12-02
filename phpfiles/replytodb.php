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

$to_email = $_POST['em'];
$from_email = $_POST['emf'];
$subject = $_POST['sub'];
$msg = $_POST['msg'];

$sql = "INSERT INTO reply_msg (to_email, from_email, subject, message) VALUES ('".$to_email."','".$from_email."','".$subject."','".$msg."')";
if (mysqli_query($conn, $sql)) {
    echo '<script>alert("Message replied")</script>';
    header('Location: messages.php');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
