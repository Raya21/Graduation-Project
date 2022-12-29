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

$sql = "SELECT college, gpa FROM edu_info WHERE email='".$email."'";
$result = mysqli_query($conn,$sql);
$count  = mysqli_num_rows($result);
$count2 =0;

if($count==1){
    while ($row = $result->fetch_assoc()) {


        $sql2 = "SELECT * FROM scholarships WHERE college='".$row['college']."' AND gpa <= '".$row['gpa']."' ";
        $result2 = mysqli_query($conn,$sql2);
        $count2=mysqli_num_rows($result2);

        if($count2>0)
        {
            while($rowdata= $result2->fetch_assoc())
            {
                $list[]=$rowdata;
            }

            echo json_encode($list);
        }

        else if($count2==0)
        {
            $list[]="No data";
            echo json_encode($list);

        }
    }
}

else if($count==0)
{
    $list[]="No data";
    echo json_encode($list);

}
