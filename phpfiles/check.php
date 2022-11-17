<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
    echo "Database connection failed";
}
$email = $_POST['email'];
$select = $mydb->query("SELECT * FROM users WHERE email = '".$email."'");
$count = mysqli_num_rows($select);
$data = mysqli_fetch_assoc($select);

$idData = $data['id'];
$userData = $data['username'];
if($count==1){
    $url = 'http://'.$_SERVER['SERVER_NAME'].'/handinhand/forget_password.php?id='.$idData.'&username='.$userData; //path for changepass in htdocs
    echo json_encode($url);
}else{
    echo json_encode("INVALIDUSER");
}