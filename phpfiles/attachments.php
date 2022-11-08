<?php
$mydb= mysqli_connect("localhost","root","","handinhand");

if(!$mydb)
{
    echo "Database connection failed";
}

$id = $_POST['id'];
$idcard = $_POST['idcard'];
$hightranscript = $_POST['hightranscript'];
$studentcard = $_POST['studentcard'];
$lastsemtranscript = $_POST['lastsemtranscript'];
$stucertificate = $_POST['stucertificate'];
$fatheridandfammem = $_POST['fatheridandfammem'];
$medicalreport = $_POST['medicalreport'];
$socialafairs = $_POST['socialafairs'];
$legalforhouserented = $_POST['legalforhouserented'];
$salaryslip = $_POST['salaryslip'];
$deathcertificate = $_POST['deathcertificate'];
$stufamuni = $_POST['stufamuni'];

$sql = "SELECT * FROM attachments WHERE id='".$id."'";
$result = mysqli_query($mydb,$sql);
$count  = mysqli_num_rows($result);



if ($count == 1) {
    $update = "UPDATE attachments SET idcard='".$idcard."', hightranscript='".$hightranscript."', studentcard='".$studentcard."', lastsemtranscript='".$lastsemtranscript."', stucertificate='".$stucertificate."', fatheridandfammem='".$fatheridandfammem."', medicalreport='".$medicalreport."', socialafairs='".$socialafairs."', legalforhouserented='".$legalforhouserented."', salaryslip='".$salaryslip."', deathcertificate='".$deathcertificate."', stufamuni='".$stufamuni."' WHERE id='".$id."'";
    $query = mysqli_query($mydb,$update);
    echo json_encode("Updated");
}else{
    $insert = "INSERT INTO attachments(id,idcard,hightranscript,studentcard,lastsemtranscript,stucertificate,fatheridandfammem,medicalreport,socialafairs,legalforhouserented,salaryslip,deathcertificate,stufamuni)VALUES('".$id."','".$idcard."','".$hightranscript."','".$studentcard."','".$lastsemtranscript."','".$stucertificate."','".$fatheridandfammem."','".$medicalreport."','".$socialafairs."','".$legalforhouserented."','".$salaryslip."','".$deathcertificate."','".$stufamuni."')";
    $query = mysqli_query($mydb,$insert);
    if ($query) {
        echo json_encode("Success");
    }
}
?>