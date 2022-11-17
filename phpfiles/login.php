<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
  echo "Database connection failed";
}

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE email='".$email."' AND password='".$password."'";

$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
  $sql2 = "SELECT id FROM users WHERE email='".$email."' AND password='".$password."'";
  $id = mysqli_query($mydb,$sql2);
while ($row = $id->fetch_assoc()) {
    echo json_encode(array("message"=>"Success","id"=>$row['id']));
}


}else{
  echo json_encode("Error");
}

?>