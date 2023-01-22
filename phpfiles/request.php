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
$sql = "SELECT person_info.id, person_info.fname, person_info.city, edu_info.uniid, edu_info.gpa  FROM person_info, edu_info WHERE person_info.email='".$email."' AND edu_info.email='".$email."'";
$result = $conn->query($sql);
//$result = mysqli_query($conn,$sql);
//$count  = mysqli_num_rows($result);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $insert = "INSERT INTO loan_request(id,fname,email,city,uniid,gpa)VALUES('".$row['id']."','".$row['fname']."','".$email."','".$row['city']."','".$row['uniid']."','".$row['gpa']."')";
        $query = $conn->query($insert);

    }
}
if ($query) {
    echo json_encode("Success");
}
else {
    echo json_encode("Failed");
}
/*
if ($count == 1) {
    $insert = "INSERT INTO loan_request(id,schoolyoe,school,grade,branch,unidegree,university,college,department,academicyear,gpa,uniid,uniyoe)VALUES('".$id."','".$scyoe."','".$school."','".$grade."','".$branch."','".$degree."','".$university."','".$college."','".$department."','".$academicyear."','".$gpa."','".$uniid."','".$uniyoe."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}else{
    echo json_encode("Failed");
}*/