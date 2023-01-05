<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$help = $_POST['help'];
$sql = "SELECT username FROM users WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);
if($count>0){

    while ($row = $result->fetch_assoc()) {

        $insert = "INSERT INTO add_help(email,username,help)VALUES('".$email."','".$row['username']."','".$help."')";
        $query = mysqli_query($mydb,$insert);
        if ($query) {
            echo json_encode("Success");
        }
    }
}
else{
    echo json_encode("Failed");
}