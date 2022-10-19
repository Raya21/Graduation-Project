<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
    echo "Database connection failed";
}

$email = $_POST['email'];
$oldpassword = $_POST['oldpassword'];
$newpassword = $_POST['newpassword'];

$sql = "SELECT * FROM users WHERE email='".$email."' AND password='".$oldpassword."'";

$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if(count==1){
    $update = "UPDATE users SET password='".$newpassword."' WHERE email='".$email."'";
    $query = mysqli_query($mydb,$update);
    if($query) {
        echo json_encode("Success");
    }
}else{
    echo json_encode("Error");
}

?>