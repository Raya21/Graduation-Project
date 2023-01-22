<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "handinhand2";




// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . mysqli_connect_error());
}
$email = $_POST['email'];
echo $email;
$sql = "SELECT person_info.id, person_info.fname, person_info.city, contact_info.mphone, edu_info.university FROM person_info, contact_info, edu_info WHERE person_info.email='".$email."' AND contact_info.email='".$email."'";
//$result = $conn->query($sql);
if ($result = $conn->query($sql)) {
    // output data of each row
    if($row = $result->fetch_assoc()) {
        $insert = "INSERT INTO donors(email,id,fname,mphone,city,university)VALUES('".$email."','".$row['id']."','".$row['fname']."','".$row['mphone']."','".$row['city']."','".$row['university']."')";
        $query = $conn->query($insert);
        if ($query) {
            echo json_encode("Success");
        }
    }
}

else {
    echo json_encode("Failed");
}