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
$loan_id=$_POST['loan_id'];
$email = $_POST['email'];
$lname = $_POST['lname'];


$sql2="SELECT * FROM loan_request WHERE email='".$email."' AND loan_id='".$loan_id."'";
$result2 = $conn->query($sql2);
$count  = mysqli_num_rows($result2);

if($count==0)
{
    $sql = "SELECT person_info.id, person_info.fname, person_info.city, edu_info.uniid, edu_info.gpa  FROM person_info, edu_info WHERE person_info.email='".$email."' AND edu_info.email='".$email."'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $insert = "INSERT INTO loan_request(loan_id,lname,id,fname,email,city,uniid,gpa)VALUES('".$loan_id."','".$lname."','".$row['id']."','".$row['fname']."','".$email."','".$row['city']."','".$row['uniid']."','".$row['gpa']."')";
            $query = $conn->query($insert);

        }

        if ($query) {
            echo json_encode("Success");
        }
        else {
            echo json_encode("Failed");
        }
    }

    else{
        echo json_encode("no profile data");
    }
}

else
{
    echo json_encode("submitted before");
}