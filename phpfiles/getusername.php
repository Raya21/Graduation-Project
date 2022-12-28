<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$sql = "SELECT username FROM users WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count>0){

    while ($row = $result->fetch_assoc()) {

        echo json_encode($row['username']);
    }
}else{
    echo json_encode("Error");

}
//".$email."
