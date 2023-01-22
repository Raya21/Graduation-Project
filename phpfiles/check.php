<?php
$mydb = mysqli_connect("localhost","root","","handinhand2");

if(!$mydb){
    echo "Database connection failed";
}
$username = $_POST['username'];
$select = $mydb->query("SELECT * FROM users WHERE username = '".$username."'");
$count = mysqli_num_rows($select);
$data = mysqli_fetch_assoc($select);

$idData = $data['id'];
$userData = $data['username'];
if(count==1){
    $url = 'http://'.$_SERVER['SERVER_NAME'].'/handinhand/changepass.php?id='.$idData.'&username='.$userData; //path for changepass in htdocs
    echo json_encode($url);
}else{
    echo json_encode("INVALIDUSER");
}