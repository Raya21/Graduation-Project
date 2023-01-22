<?php
$mydb= mysqli_connect("localhost","root","","handinhand2");

if(!$mydb)
{
    echo "Database connection failed";
}
$email = $_POST['email'];
$scyoe = $_POST['yearofEn'];
$school = $_POST['school'];
$grade = $_POST['grade'];
$university = $_POST['university'];
$college = $_POST['college'];
$department = $_POST['department'];
$gpa = $_POST['gpa'];
$uniyoe = $_POST['yearofEnUni'];
$uniid = $_POST['uniid'];
$branch = $_POST['branch'];
$degree = $_POST['degree'];
$academicyear = $_POST['acadmicyear'];
$flag3 = true;

$sql = "SELECT * FROM edu_info WHERE email='".$email."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE edu_info SET schoolyoe='".$scyoe."', school='".$school."', grade='".$grade."', branch='".$branch."', unidegree='".$degree."', university='".$university."', college='".$college."', department='".$department."', academicyear='".$academicyear."', gpa='".$gpa."', uniid='".$uniid."', uniyoe='".$uniyoe."', flag3='".$flag3."' WHERE email='".$email."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO edu_info(email,schoolyoe,school,grade,branch,unidegree,university,college,department,academicyear,gpa,uniid,uniyoe,flag3)VALUES('".$email."','".$scyoe."','".$school."','".$grade."','".$branch."','".$degree."','".$university."','".$college."','".$department."','".$academicyear."','".$gpa."','".$uniid."','".$uniyoe."', '".$flag3."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>