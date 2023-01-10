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

$lname = $_POST["l_name"];
$start_date = $_POST["start_date"];
$end_date = $_POST["end_date"];

$desc = $_POST["desc"];
$cond = $_POST["quali"];
$percent = $_POST["percent"];
//$college = $_POST['college'];
$gpa = $_POST['gpa'];

$attachments="";
$college="";

foreach ($_POST['attachment'] as $value) {
    $attachments=$attachments.$value;
    $attachments=$attachments.",";

  }

  foreach ($_POST['college'] as $value) {
    $college=$college.$value;
    $college=$college.",";

  }
$sql = "INSERT INTO loans (lname,start_date,end_date,description, conditions, percentage, college, gpa, attachments) VALUES ('$lname','$start_date','$end_date ', '$desc','$cond','$percent','$college','$gpa','$attachments')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("New record created successfully")</script>';
    header('Location: loans.html');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);

?>

