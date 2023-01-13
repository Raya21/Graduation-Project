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
$email = $_POST['email'];
//$email = "testinghih@gmail.com";
$alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
$pass = array(); //remember to declare $pass as an array
$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
for ($i = 0; $i < 8; $i++) {
    $n = rand(0, $alphaLength);
    $pass[] = $alphabet[$n];
}
$sql = "SELECT * FROM users WHERE email='".$email."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);
if ($count == 1) {
    $newpass = implode($pass);
    $update = "UPDATE users SET  password='".$newpass."' WHERE email='".$email."'";
    $query = mysqli_query($conn,$update);
    $new = "The new password is ".implode($pass);
    echo json_encode($new);
}else{
    echo json_encode("Faild");
}