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
$id = $_GET['id'];
$sql = "SELECT * FROM employee_requests WHERE id='".$id."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);

if($count==1){
    while ($row = $result->fetch_assoc()) {

            $insert = "INSERT into `admins` (username, password, email, created_at, admin_employee)
                     VALUES ('".$row['username']."', '".$row['password']."', '".$row['email']."', '".$row['created_at']."','". $row['emp_type']."')";
            $query = mysqli_query($conn,$insert);
            if ($query) {
                $delete = "DELETE FROM `employee_requests` WHERE id='$id'";
                $query1 = mysqli_query($conn,$delete);
                if($query1){
                    header('Location: employeereq.php');
                }
            }

    }
}