<?php
$mydb= mysqli_connect("localhost","root","","handinhand2");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$help = $_POST['help'];
$id = $_POST['id'];
$sql = "SELECT * FROM add_help WHERE help='".$help."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    $delete = "DELETE FROM add_help WHERE help='".$help."'";
    $query = mysqli_query($mydb,$delete);
    if($query){
        echo json_encode("Success");
    }


}
else{
    echo json_encode("Failed");
}