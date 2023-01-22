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

$to_email = $_POST['em'];
$from_email = $_POST['emf'];
$subject = $_POST['sub'];
$msg = $_POST['msg'];

$sql = "INSERT INTO reply_msg (to_email, from_email, subject, message) VALUES ('".$to_email."','".$from_email."','".$subject."','".$msg."')";
if (mysqli_query($conn, $sql)) {
    echo '<script>alert("Message replied")</script>';
    header('Location: messages.php');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

///send notifications

$body="Your message has been answered by one of the  officials on the subject of"." ".$subject;
$insert = "INSERT INTO notifications(email,title,body)VALUES('".$to_email."','".$subject."','".$body."')";
$query = mysqli_query($conn,$insert);

$sql3 = "SELECT device_token FROM users WHERE email='".$to_email."'";
$result3 = mysqli_query($conn,$sql3);
$count3=mysqli_num_rows($result3);

if($count3==1)
{
    while ($row = $result3->fetch_assoc())
    {
        define('API_ACCESS_KEY','AAAABfxoZzc:APA91bGhxYZjDZovXtxArnUSlNerOkvh0xDJSJBXr1Ai5l0AF2E5ZsA79KiLHZJBt71hx1AHncCg1JGsWrtXGGF-dzLJD8zN4-iCCNtFMvq5tLOTmww2ZbnFQxf9sLDU8Cjy5QXP-58X');
    $fcmUrl = 'https://fcm.googleapis.com/fcm/send';
    $token=$row['device_token'];
$notification = [
    'title' =>$subject,
    'body' => $body,
    'icon' =>'myIcon', 
    'sound' => 'mySound'
];
$extraNotificationData = ["message" => $notification,"moredata" =>'dd'];

$fcmNotification = [
    //'registration_ids' => $tokenList, //multple token array
    'to'        => $token, //single token
    'notification' => $notification,
    'data' => $extraNotificationData
];

$headers = [
    'Authorization: key=' . API_ACCESS_KEY,
    'Content-Type: application/json'
];


$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,$fcmUrl);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
$result = curl_exec($ch);
curl_close($ch);


echo $result; 
    }
    
}







