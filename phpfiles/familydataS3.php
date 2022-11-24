<?php
$mydb = mysqli_connect("localhost","root","","handinhand");

if(!$mydb){
  echo "Database connection failed";
}

$userId= $_POST['userId'];
$numFamilyMem = $_POST['numFamilyMem'];
$numMemDiseases = $_POST['numMemDiseases'];
$familyIncome = $_POST['familyIncome'];

$familyAssistance = $_POST['familyAssistance'];
$cardNumber = $_POST['cardNumber'];
$familyHousing = $_POST['familyHousing'];
$monthlyRent = $_POST['monthlyRent'];

$familyResidence= $_POST['familyResidence'];
$numPrivate = $_POST['numPrivate'];
$numPublic = $_POST['numPublic'];
$numCommercial = $_POST['numCommercial'];

$studentHousingFee= $_POST['studentHousingFee'];
$smoke = $_POST['smoke'];
$numUniversityStu= $_POST['numUniversityStu'];

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