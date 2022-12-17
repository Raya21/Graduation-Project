<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
  echo "Database connection failed";
}

$userId = $_POST['userId'];
$image = $_FILES['image']['name'];

//$imagePath = 'ProfileImages/'.$image;
$imagePath ='C:/Users/Msys/StudioProjects/Graduation-Project-aya2/lib/ProfileImages/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagePath);

$sql = "SELECT * FROM profileimages WHERE  id='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count==1)
{

    $update = "UPDATE profileimages SET image='".$image."' WHERE id='".$userId."'";
    $query = mysqli_query($mydb,$update);

}
else if($count==0)
{
  $mydb->query("INSERT INTO profileimages (id,image) VALUES ('".$userId."','".$image."')");
}




?>