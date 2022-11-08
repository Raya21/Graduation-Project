<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
    echo "Database connection failed";
}

$email = $_POST['email'];
$oldpassword = $_POST['password'];
$newpassword = $_POST['npassword'];

$sql = "SELECT * FROM admins WHERE email='".$email."' AND password='".$oldpassword."'";

$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $update = "UPDATE admins SET password='".$newpassword."' WHERE email='".$email."'";
    $query = mysqli_query($mydb,$update);
    if($query) {
        echo '<script>alert("Password changed")</script>';
    }
}else{
    echo '<script>alert("Error")</script>';
}

?>