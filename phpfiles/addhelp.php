<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$typed = $_POST['typed'];
$money = $_POST['money'];
$thingname = $_POST['thingname'];
$cost = $_POST['cost'];
$post = $_POST['post'];
$sql = "SELECT username FROM users WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);
if($count>0){

   if($typed == 'money'){
       while ($row = $result->fetch_assoc()) {

           $insert = "INSERT INTO add_help(email,username,typed,money,thingname,cost,remaining,post)VALUES('".$email."','".$row['username']."','".$typed."','".$money."','-',0,'".$money."','".$post."')";
           $query = mysqli_query($mydb,$insert);
           if ($query) {
               echo json_encode("Success");
           }
       }
   }else if($typed == 'physical'){
       while ($row = $result->fetch_assoc()) {

           $insert = "INSERT INTO add_help(email,username,typed,money,thingname,cost,remaining,post)VALUES('".$email."','".$row['username']."','".$typed."',0,'".$thingname."','".$cost."','".$cost."','".$post."')";
           $query = mysqli_query($mydb,$insert);
           if ($query) {
               echo json_encode("Success");
           }
       }
   }
}
else{
    echo json_encode("Failed");
}