<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}

$email = $_POST['email'];
$image = $_FILES['image']['name'];

//$imagePath = 'ProfileImages/'.$image;
$imagePath ='C:/Users/HP/AndroidStudioProjects/swproject/lib/ProfileImages/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagePath);

$sql = "SELECT * FROM profileimages WHERE  email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1)
{

    $update = "UPDATE profileimages SET image='".$image."' WHERE email='".$email."'";
    $query = mysqli_query($mydb,$update);

}
else if($count==0)
{
    $mydb->query("INSERT INTO profileimages (email,image) VALUES ('".$email."','".$image."')");
}
