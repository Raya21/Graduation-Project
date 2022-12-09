<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
  echo "Database connection failed";
}
$BrothersData=json_decode($_POST['BrothersData']);
$userId= $_POST['userId'];
$numFamilyMem =  $_POST['numFamilyMem'];;
$numMemDiseases =  $_POST['numMemDiseases'];;
$familyIncome =  $_POST['familyIncome'];;

$familyAssistance =  $_POST['familyAssistance'];;
$cardNumber =  $_POST['cardNumber'];;
$familyHousing =  $_POST['familyHousing'];;
$monthlyRent =  $_POST['monthlyRent'];;

$familyResidence= $_POST['familyResidence'];;
$numPrivate =  $_POST['numPrivate'];;
$numPublic =  $_POST['numPublic'];;
$numCommercial =  $_POST['numCommercial'];;

$studentHousingFee=  $_POST['studentHousingFee'];;
$smoke =  $_POST['smoke'];;
$numUniversityStu=  $_POST['numUniversityStu'];;


$objects;




$sql2 = "SELECT studentIdCard FROM familydatas1 WHERE userId='".$userId."'";
$IdCard = mysqli_query($mydb,$sql2);
$row = $IdCard->fetch_assoc();
 
$i=0;
foreach($BrothersData as $key => $value){
  $i=0;
  foreach($value as $k => $v){
   $objects[$i]=$v;
   $i++;
 }
$sql = "SELECT * FROM brothersdata WHERE BrotherId='".$objects[0]."'AND userId='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if ($count == 1) {

$update = "UPDATE brothersdata SET 
userId='".$userId."',
userIdCard='".$row["studentIdCard"]."', 
BrotherId='".$objects[0]."',
StudentName='".$objects[1]."',
RegistrationNumber='".$objects[2]."',
CollegeName='".$objects[3]."',
UniversityName='".$objects[4]."'
WHERE BrotherId='".$objects[0]."'AND userId='".$userId."'";
$query = mysqli_query($mydb,$update);

}
else{
$insert = "INSERT INTO brothersdata(
userId,
userIdCard,
BrotherId,
StudentName,
RegistrationNumber,
CollegeName,
UniversityName)
VALUES(
'".$userId."',
'".$row["studentIdCard"]."',
'".$objects[0]."',
'".$objects[1]."',
'".$objects[2]."',
'".$objects[3]."',
'".$objects[4]."')";
$query = mysqli_query($mydb,$insert);
}


}

$sql = "SELECT * FROM familydatas3 WHERE userId='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count2  = mysqli_num_rows($result);


if($count2 == 1)
{   
    $update = "UPDATE familydatas3 SET  studentIdCard='".$row["studentIdCard"]."', 
    userId='".$userId."',
    numFamilyMem='".$numFamilyMem."', 
    numMemDiseases='".$numMemDiseases."', 
    familyIncome='".$familyIncome."', 

    familyAssistance='".$familyAssistance."',
    cardNumber='".$cardNumber."', 
    familyHousing='".$familyHousing."',
    monthlyRent='".$monthlyRent."',

    familyResidence='".$familyResidence."',
    numPrivate='".$numPrivate."', 
    numPublic='".$numPublic."',
    numCommercial='".$numCommercial."',
     
    studentHousingFee='".$studentHousingFee."', 
    smoke='".$smoke."',
    numUniversityStu='".$numUniversityStu."'

     WHERE userId='".$userId."'";


    $query = mysqli_query($mydb,$update);

    echo json_encode("Updated");
}


else if($count2 == 0){

    $insert = "INSERT INTO familydatas3(
    studentIdCard,
    userId,
    numFamilyMem,
    numMemDiseases,
    familyIncome,

    familyAssistance,
    cardNumber,
    familyHousing,
    monthlyRent,

    familyResidence,
    numPrivate,
    numPublic,
    numCommercial,

    studentHousingFee,
    smoke,
    numUniversityStu


    )VALUES('".$row["studentIdCard"]."',
    '".$userId."',
    '".$numFamilyMem."',
    '".$numMemDiseases."',
    '".$familyIncome."',

    '".$familyAssistance."',
    '".$cardNumber."',
    '".$familyHousing."',
    '".$monthlyRent."',

    
    '".$familyResidence."',
    '".$numPrivate."',
    '".$numPublic."',
    '".$numCommercial."',

    '".$studentHousingFee."',
    '".$smoke."',
    '".$numUniversityStu."'


    )";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}   



?>