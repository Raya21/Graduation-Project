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
$num_attach=$_POST['num_attach'];
$loan_id = $_POST['loan_id'];
$email1 = $_POST['email'];
$lname = $_POST['lname'];
$image = $_FILES['image']['name'];
$attach_name = $_POST['attach_name'];
 


$sql2="SELECT * FROM loan_attachs WHERE email='".$email1."' AND loan_id='".$loan_id."'";
$result2 = $conn->query($sql2);
$count  = mysqli_num_rows($result2);

if($count!=$num_attach)
{   
    $imagePath = 'luploads/'.$image;
    $tmp_name = $_FILES['image']['tmp_name'];
    move_uploaded_file($tmp_name,$imagePath);
    $conn->query("INSERT INTO loan_attachs (loan_id,email,lname,image,attach_name) VALUES ('".$loan_id."','".$email1."','".$lname."','".$image."','".$attach_name."')");
    echo json_encode("success");
}

else{
    echo json_encode("already attached");
}



?>