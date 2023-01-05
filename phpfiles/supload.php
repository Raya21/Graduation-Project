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
$scholarship_id = $_POST['scholarship_id'];
$email1 = $_POST['email'];
$sname = $_POST['sname'];
$image = $_FILES['image']['name'];
$attach_name = $_POST['attach_name'];



$sql2="SELECT * FROM scholarship_attachs WHERE email='".$email1."' AND scholarship_id='".$scholarship_id."'";
$result2 = $conn->query($sql2);
$count  = mysqli_num_rows($result2);

if($count==0)
{
    $imagePath = 'suploads/'.$image;
    $tmp_name = $_FILES['image']['tmp_name'];
    move_uploaded_file($tmp_name,$imagePath);
    $conn->query("INSERT INTO scholarship_attachs (scholarship_id,email,sname,image,attach_name) VALUES ('".$scholarship_id."','".$email1."','".$sname."','".$image."','".$attach_name."')");
}

else{
    echo json_encode("already attached");
}



?>