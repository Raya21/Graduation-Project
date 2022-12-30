<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
//echo $_POST['email'];
$email = $_POST['email'];
$list = array();

$sql = "SELECT * FROM reply_msg WHERE to_email='".$email."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);


if($count==1){
    while ($row = $result->fetch_assoc()) {
        $list[]=$row;
        echo json_encode($list);

    }
}

else if($count==0)
{
    $list[]="No data";
    echo json_encode($list);

}
