<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$password = $_POST['password'];
$username = $_POST['username'];

$sql = "SELECT * FROM users WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    echo json_encode("Error");
}else{
    $insert = "INSERT INTO users(username,password,email)VALUES('".$username."','".$password."','".$email."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}


?>