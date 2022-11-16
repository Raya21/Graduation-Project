<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$fname = $_POST['fname'];
$id = $_POST['id'];
$birthdate = $_POST['birthdate'];
$birthplace = $_POST['birthplace'];
$city = $_POST['city'];
$income = $_POST['income'];
$gender = $_POST['gender'];
$socialstatus = $_POST['socialstatus'];

$sql = "SELECT * FROM person_info WHERE id='".$id."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE person_info SET  email='".$email."', fname='".$fname."', birthdate='".$birthdate."', birthplace='".$birthplace."', city='".$city."', income='".$income."', gender='".$gender."', socialstatus='".$socialstatus."' WHERE id='".$id."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO person_info(id,email,fname,birthdate,birthplace,city,income,gender,socialstatus)VALUES('".$id."','".$email."','".$fname."','".$birthdate."','".$birthplace."','".$city."','".$income."','".$gender."','".$socialstatus."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>