<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}
$scyoe = $_POST['yearofEn'];
$id = $_POST['id'];
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

$sql = "SELECT * FROM edu_info WHERE id='".$id."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE edu_info SET schoolyoe='".$scyoe."', school='".$school."', grade='".$grade."', branch='".$branch."', unidegree='".$degree."', university='".$university."', college='".$college."', department='".$department."', academicyear='".$academicyear."', gpa='".$gpa."', uniid='".$uniid."', uniyoe='".$uniyoe."' WHERE id='".$id."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO edu_info(id,schoolyoe,school,grade,branch,unidegree,university,college,department,academicyear,gpa,uniid,uniyoe)VALUES('".$id."','".$scyoe."','".$school."','".$grade."','".$branch."','".$degree."','".$university."','".$college."','".$department."','".$academicyear."','".$gpa."','".$uniid."','".$uniyoe."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>