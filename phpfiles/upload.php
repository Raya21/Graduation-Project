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
//image 1
echo $_POST['email'];
$email1 = $_POST['email'];
$image1 = $_FILES['image']['name'];
$imagePath1 = 'uploads/'.$image1;
$tmp_name1 = $_FILES['image']['tmp_name'];
//image 2
$email2 = $_POST['email'];
$image2 = $_FILES['image']['name'];
$imagePath2 = 'uploads/'.$image2;
$tmp_name2 = $_FILES['image']['tmp_name'];
//image 3
$email3 = $_POST['email'];
$image3 = $_FILES['image']['name'];
$imagePath3 = 'uploads/'.$image3;
$tmp_name3 = $_FILES['image']['tmp_name'];
//image 4
$email4 = $_POST['email'];
$image4 = $_FILES['image']['name'];
$imagePath4 = 'uploads/'.$image4;
$tmp_name4 = $_FILES['image']['tmp_name'];
//image 5
$email5 = $_POST['email'];
$image5 = $_FILES['image']['name'];
$imagePath5 = 'uploads/'.$image5;
$tmp_name5 = $_FILES['image']['tmp_name'];
//image 6
$email6 = $_POST['email'];
$image6 = $_FILES['image']['name'];
$imagePath6 = 'uploads/'.$image6;
$tmp_name6 = $_FILES['image']['tmp_name'];
//image 7
$email7 = $_POST['email'];
$image7 = $_FILES['image']['name'];
$imagePath7 = 'uploads/'.$image7;
$tmp_name7 = $_FILES['image']['tmp_name'];
//image 8
$email8 = $_POST['email'];
$image8 = $_FILES['image']['name'];
$imagePath8 = 'uploads/'.$image8;
$tmp_name8 = $_FILES['image']['tmp_name'];
//image 9
$email9 = $_POST['email'];
$image9 = $_FILES['image']['name'];
$imagePath9 = 'uploads/'.$image9;
$tmp_name9 = $_FILES['image']['tmp_name'];
//image 10
$email10 = $_POST['email'];
$image10 = $_FILES['image']['name'];
$imagePath10 = 'uploads/'.$image10;
$tmp_name10 = $_FILES['image']['tmp_name'];
move_uploaded_file($tmp_name1,$imagePath1);
move_uploaded_file($tmp_name2,$imagePath2);
move_uploaded_file($tmp_name3,$imagePath3);
move_uploaded_file($tmp_name4,$imagePath4);
move_uploaded_file($tmp_name5,$imagePath5);
move_uploaded_file($tmp_name6,$imagePath6);
move_uploaded_file($tmp_name7,$imagePath7);
move_uploaded_file($tmp_name8,$imagePath8);
move_uploaded_file($tmp_name9,$imagePath9);
move_uploaded_file($tmp_name10,$imagePath10);
$conn->query("INSERT INTO attachs (email,image) VALUES ('".$email1."','".$image1."'),('".$email2."','".$image2."'),('".$email3."','".$image3."'),('".$email4."','".$image4."'),('".$email5."','".$image5."'),('".$email6."','".$image6."'),('".$email7."','".$image7."'),('".$email8."','".$image8."'),('".$email9."','".$image9."'),('".$email10."','".$image10."')");