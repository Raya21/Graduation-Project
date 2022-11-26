<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
  echo "Database connection failed";
}
$BrothersData=json_decode($_POST['BrothersData']);
$userId= $_POST['userId'];
$numFamilyMem = 1;
$numMemDiseases = 1;
$familyIncome = "1";

$familyAssistance = "f";
$cardNumber = 3;
$familyHousing = "r";
$monthlyRent = "44";

$familyResidence="kk";
$numPrivate = 7;
$numPublic = 9;
$numCommercial = 7;

$studentHousingFee= 55;
$smoke = "l";
$numUniversityStu= 1;

$StudentName;
$RegistrationNumber;
$CollegeName;
$UniversityName;

$objects;


 $i=0;
  foreach($BrothersData as $key => $value){
    $i=0;
    foreach($value as $k => $v){
     $objects[$i]=$v;
     $i++;
   }
$sql = "SELECT * FROM brothersdata WHERE BrotherId='".$objects[0]."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if ($count == 1) {

  $update = "UPDATE brothersdata SET BrotherId='".$objects[0]."',
  StudentName='".$objects[1]."',
  RegistrationNumber='".$objects[2]."',
  CollegeName='".$objects[3]."',
  UniversityName='".$objects[4]."'
  WHERE BrotherId='".$objects[0]."'";
  $query = mysqli_query($mydb,$update);

}
else{
  $insert = "INSERT INTO brothersdata(BrotherId,
  StudentName,
  RegistrationNumber,
  CollegeName,
  UniversityName)
  VALUES('".$objects[0]."',
  '".$objects[1]."',
  '".$objects[2]."',
  '".$objects[3]."',
  '".$objects[4]."')";
  $query = mysqli_query($mydb,$insert);
}


 }

$sql2 = "SELECT studentIdCard FROM familydatas1 WHERE userId='".$userId."'";
$IdCard = mysqli_query($mydb,$sql2);
$row = $IdCard->fetch_assoc();
 
$sql = "SELECT * FROM familydatas3 WHERE userId='".$userId."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);

if($count == 1)
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


else{
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