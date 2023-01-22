<?php
$mydb = mysqli_connect("localhost","root","","handinhand2");

if(!$mydb){
  echo "Database connection failed";
}

$name= $_POST['name'];
$idNumber = $_POST['idNumber'];
$note = $_POST['note'];

$relativeRelation = $_POST['relativeRelation'];
$workPlace = $_POST['workPlace'];
$job = $_POST['job'];
$userId = $_POST['userId'];


$sql2 = "SELECT studentIdCard FROM familydatas1 WHERE userId='".$userId."'";
$IdCard = mysqli_query($mydb,$sql2);
$row = $IdCard->fetch_assoc();
 
$sql = "SELECT * FROM familydatas2 WHERE userId='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($idNumber==NULL)
$idNumber = 0;


if($count == 1)
{
    
    $update = "UPDATE familydatas2 SET  studentIdCard='".$row["studentIdCard"]."', 
    relativeRelation='".$relativeRelation."',
    name='".$name."', 

    idNumber='".$idNumber."', 
    workPlace='".$workPlace."', 
    job='".$job."',
    note='".$note."', 
    userId='".$userId."'
     
     WHERE userId='".$userId."'";


    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}


else{
    $insert = "INSERT INTO familydatas2(
    studentIdCard,
    relativeRelation,
    name,

    idNumber,
    workPlace,
    job,
    note,
    userId

    )VALUES('".$row["studentIdCard"]."',
    '".$relativeRelation."',
    '".$name."',

    '".$idNumber."',
    '".$workPlace."',
    '".$job."',
    '".$note."',
    '".$userId."'
    )";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}   



?>