<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}

$email = $_POST['email'];
$tphone = $_POST['TPhone'];
$mphone = $_POST['MPhone'];
$flag2 = true;

$sql = "SELECT * FROM contact_info WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE contact_info SET tphone='".$tphone."', mphone='".$mphone."', flag2='".$flag2."' WHERE email='".$email."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO contact_info(email,tphone,mphone,flag2)VALUES('".$email."','".$tphone."','".$mphone."', '".$flag2."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>