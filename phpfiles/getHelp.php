<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand2";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
//echo $_POST['email'];
$sql = "SELECT * FROM add_help WHERE accept='accept' AND remaining!=0";
$result = $conn->query($sql);
$count  = mysqli_num_rows($result);

if($count>0)
{
    while($row = $result->fetch_assoc()){
        $data[]=$row;
    }
    echo json_encode($data);
}
else{
    $data[]="noData";
    echo json_encode($data);
}

