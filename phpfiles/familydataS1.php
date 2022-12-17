<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
  echo "Database connection failed";
}

$studentIdCard= $_POST['studentIdCard'];
$studentName = $_POST['studentName'];
$studentNumber = $_POST['studentNumber'];

$fatherName = $_POST['fatherName'];
$fatherIdCard = $_POST['fatherIdCard'];
$fatherCareerStatus = $_POST['fatherCareerStatus'];
$fatherWorkPlace = $_POST['fatherWorkPlace'];
$fatherJob = $_POST['fatherJob'];
$fatherWorkNature = $_POST['fatherWorkNature'];
$fatherJobDesc = $_POST['fatherJobDesc'];

$motherName = $_POST['motherName'];
$motherIdCard = $_POST['motherIdCard'];
$motherCareerStatus = $_POST['motherCareerStatus'];
$motherWorkPlace = $_POST['motherWorkPlace'];
$motherJob = $_POST['motherJob'];
$motherWorkNature = $_POST['motherWorkNature'];
$motherJobDesc = $_POST['motherJobDesc'];

$hwName = $_POST['hwName'];
$hwIdCard = $_POST['hwIdCard'];
$hwCareerStatus = $_POST['hwCareerStatus'];
$hwWorkPlace = $_POST['hwWorkPlace'];
$hwJob = $_POST['hwJob'];
$hwWorkNature = $_POST['hwWorkNature'];
$hwJobDesc = $_POST['hwJobDesc'];

$studentSocialSit = $_POST['studentSocialSit'];
$parentsSocialSit = $_POST['parentsSocialSit'];
$userId = $_POST['userId'];

$sql = "SELECT * FROM familydatas1 WHERE  userId='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($hwIdCard==NULL)
$hwIdCard = 0;

if ($count == 1) {
    $update = "UPDATE familydatas1 SET  studentIdCard='".$studentIdCard."', 
    studentName='".$studentName."',
    studentNumber='".$studentNumber."', 

     fatherName='".$fatherName."', 
     fatherIdCard='".$fatherIdCard."', 
     fatherCareerStatus='".$fatherCareerStatus."',
     fatherWorkPlace='".$fatherWorkPlace."', 
     fatherJob='".$fatherJob."',
     fatherWorkNature='".$fatherWorkNature."', 
     fatherJobDesc='".$fatherJobDesc."',

     motherName='".$motherName."', 
     motherIdCard='".$motherIdCard."', 
     motherCareerStatus='".$motherCareerStatus."',
     motherWorkPlace='".$motherWorkPlace."', 
     motherJob='".$motherJob."',
     motherWorkNature='".$motherWorkNature."', 
     motherJobDesc='".$motherJobDesc."',

     hwName='".$hwName."', 
     hwIdCard='".$hwIdCard."', 
     hwCareerStatus='".$hwCareerStatus."',
     hwWorkPlace='".$hwWorkPlace."', 
     hwJob='".$hwJob."',
     hwWorkNature='".$hwWorkNature."', 
     hwJobDesc='".$hwJobDesc."',

     studentSocialSit='".$studentSocialSit."', 
     parentsSocialSit='".$parentsSocialSit."',
     userId='".$userId."'
     
     
     WHERE  userId='".$userId."'";


    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}

else{
    $insert = "INSERT INTO familydatas1(
    studentIdCard,
    studentName,
    studentNumber,

    fatherName,
    fatherIdCard,
    fatherCareerStatus,
    fatherWorkPlace,
    fatherJob,
    fatherWorkNature,
    fatherJobDesc,

    motherName,
    motherIdCard,
    motherCareerStatus,
    motherWorkPlace,
    motherJob,
    motherWorkNature,
    motherJobDesc,

    hwName,
    hwIdCard,
    hwCareerStatus,
    hwWorkPlace,
    hwJob,
    hwWorkNature,
    hwJobDesc,

    studentSocialSit,
    parentsSocialSit,
    userId


    )VALUES('".$studentIdCard."',
    '".$studentName."',
    '".$studentNumber."',

    '".$fatherName."',
    '".$fatherIdCard."',
    '".$fatherCareerStatus."',
    '".$fatherWorkPlace."',
    '".$fatherJob."',
    '".$fatherWorkNature."',
    '".$fatherJobDesc."',

    '".$motherName."',
    '".$motherIdCard."',
    '".$motherCareerStatus."',
    '".$motherWorkPlace."',
    '".$motherJob."',
    '".$motherWorkNature."',
    '".$motherJobDesc."',

    
    '".$hwName."',
    '".$hwIdCard."',
    '".$hwCareerStatus."',
    '".$hwWorkPlace."',
    '".$hwJob."',
    '".$hwWorkNature."',
    '".$hwJobDesc."',

    '".$studentSocialSit."',
    '".$parentsSocialSit."',
    '".$userId."'

    )";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}


?>