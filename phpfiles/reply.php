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

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reply To Message</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <script src="https://kit.fontawesome.com/9c69e75105.js" crossorigin="anonymous"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: purple;
            background-size: cover;
            background-position: center;
            font-family: sans-serif;
            margin-top: 0px;
            max-width: 100vw;
            overflow-x: hidden;
        }
        .mane{
            background-color: rgb(0,0,0,0.5);
            width: 1000px;
            height: 600px;
            margin: auto;
        }
        .scholar{
            width: 1000px;
            background-color: rgb(0,0,0,6);
            margin: auto;
            color: #FFFFFF;
            padding: 10px 0px 10px 0px;
            text-align: center;
            border-radius: 15px 15px 0px 0px;
        }
        form{
            padding: 10px;
        }
        .aback{
            position: relative;
            top: 50px;
            left: 400px;
            font-size: 15px;
            background-color: black;
            display: block;
            margin: 20px 0 0 20px;
            text-align: center;
            border-radius: 12px;
            border: 2px solid mediumpurple;
            padding: 14px 65px;
            outline: none;
            color: white;
            cursor: pointer;
            width: 180px;
            height: 45px;

        }
        .emaillabel{
            position: relative;
            color: #E5E5E5;
            text-transform: capitalize;
            font-size: 14px;
            left: 200px;
            top: -15px;
        }
        .email{
            position: relative;
            left: 200px;
            top: 50px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .emaillabelf{
            position: relative;
            color: #E5E5E5;
            text-transform: capitalize;
            font-size: 14px;
            left: 200px;
            top: 10px;
        }
        .emailf{
            position: relative;
            left: 200px;
            top: 75px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .sublabel{
            position: relative;
            color: #E5E5E5;
            text-transform: capitalize;
            font-size: 14px;
            left: 200px;
            top: 40px;
        }
        .sub{
            position: relative;
            left: 200px;
            top: 105px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .msg{
            position: relative;
            left: 200px;
            top: 140px;
            line-height: 20px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
            height: 150px;
        }
        .msglabel{
            position: relative;
            color: #E5E5E5;
            text-transform: capitalize;
            font-size: 14px;
            left: 200px;
            top: -35px;
        }
        button{
            position: relative;
            top: 125px;
            left: 100px;
            background-color: black;
            display: block;
            margin: 20px 0 0 20px;
            text-align: center;
            border-radius: 12px;
            border: 2px solid mediumpurple;
            padding: 14px 65px;
            outline: none;
            color: white;
            cursor: pointer;
        }
        button:hover{
            color: mediumpurple;
        }
    </style>
</head>
<body>
<?php
$id = $_GET['id'];
$query = "SELECT email, topic from contactus WHERE id=$id";
$result = mysqli_query($conn,$query);
while($row = $result->fetch_assoc()) {
    $email = $row['email'];
    $subject = $row['topic'];
}
?>
<div class="scholar">
    <h1>Reply To Message</h1>
</div>
<div class="mane">
    <form action="replytodb.php" method="post">
        <div id="email">
            <input class="email" type="text" name="em" value=<?php echo $email; ?>><br>
            <label class="emaillabel">To</label>
        </div>
        <div id="email1">
            <input class="emailf" type="text" name="emf" value="handinhand@gmail.com"><br>
            <label class="emaillabelf">From</label>
        </div>
        <div id="sub">
            <input class="sub" type="text" name="sub" value=<?php echo $subject; ?>><br>
            <label class="sublabel">Subject</label>
        </div>
        <div id="msg">
            <textarea name="msg" class="msg"></textarea><br>
            <label class="msglabel">Message</label>
        </div>
        <button type="submit">Save</button>
    </form>
    <a class="aback" href="messages.php">Back</a>
</div>
</body>
</html>


