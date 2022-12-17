<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
  echo "Database connection failed";
}

$userId = $_POST['userId'];
$result = $mydb->query("SELECT * FROM profileimages WHERE  id='".$userId."'");
$list = array();

$count  = mysqli_num_rows($result);
if($count==1)
{
  while($rowdata= $result->fetch_assoc())
{
    $list[]=$rowdata;
}

echo json_encode($list);
}

else if($count==0)
{
  $list[]="nopic.png";
  echo json_encode($list);
  
}



?>