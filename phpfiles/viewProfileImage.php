<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}

$email = $_POST['email'];
$result = $mydb->query("SELECT * FROM profileimages WHERE  email='".$email."'");
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