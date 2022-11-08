<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}

$id = $_POST['id'];
$tphone = $_POST['TPhone'];
$mphone = $_POST['MPhone'];


$sql = "SELECT * FROM contact_info WHERE id='".$id."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE contact_info SET tphone='".$tphone."', mphone='".$mphone."' WHERE id='".$id."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO contact_info(id,tphone,mphone)VALUES('".$id."','".$tphone."','".$mphone."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>