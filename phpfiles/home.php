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
$email = $_POST['email'];
$query = "SELECT college, gpa FROM edu_info WHERE email LIKE '%$email%'";
$res = $conn->query($query);
if($res->num_rows>0){
    while ($row = $res->fetch_assoc()){
        if($row['gpa'] == 4){
            $coll = $row['college'];
            $sql = "SELECT * FROM scholarships WHERE college LIKE '%$coll%' AND gpa = 4 ";
            $result = $conn->query($sql);
            $list = $conn->fetch_all();
            $conn->free_result();
            echo json_encode($list);
        }
    }
}



