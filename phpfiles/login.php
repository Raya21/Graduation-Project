<?php
$mydb = mysqli_connect("localhost","root","","handinhand2");

if(!$mydb){
  echo "Database connection failed";
}

$email = $_POST['email'];
$password = $_POST['password'];
$device_token= $_POST['device_token'];

$sql = "SELECT * FROM users WHERE email='".$email."' AND password='".$password."'";

$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
  //echo json_encode("Success");
  $update = "UPDATE users SET device_token='".$device_token."' WHERE email='".$email."'";
  $query = mysqli_query($mydb,$update);
  
  $sql2 = "SELECT id FROM users WHERE email='".$email."' AND password='".$password."'";
  $id = mysqli_query($mydb,$sql2);
while ($row = $id->fetch_assoc()) {

    echo json_encode(array("message"=>"Success","id"=>$row['id']));
}



}else{
  //echo json_encode("Error");
  echo json_encode(array("message"=>"Error"));
}

?>