<?php
$mydb= mysqli_connect("localhost","root","","handinhand2");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$oldhelp = $_POST['oldhelp'];
$help = $_POST['help'];
$id = $_POST['id'];
$sql = "SELECT * FROM add_help WHERE help='".$oldhelp."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $update = "UPDATE add_help SET help='.$help.' WHERE id='".$id."'";
    $query = mysqli_query($mydb,$update);
    if($query){
        echo json_encode("Success");
    }
}
else{
    echo json_encode("Failed");
}