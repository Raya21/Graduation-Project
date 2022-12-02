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
$id = $_GET['id'];
$query = "SELECT email from contactus WHERE id=$id";
$result = mysqli_query($conn,$query);
while($row = $result->fetch_assoc()) {
    $email = $row['email'];
}
$sql = "SELECT * from contactus WHERE email = '$email'";
$result1 = mysqli_query($conn,$sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Messages</title>
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
            height: 1200px;
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
            top: -30px;
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
        table {
            border: 1px solid;
            border-collapse: collapse;
            width: 100%;
            text-align: center;
            color: white;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

    </style>
</head>
<body>
<div class="scholar">
    <h1>Message to this Email</h1>
</div>
<div class="mane">
    <form action="read.php" method="get">
        <div style="padding: 50px; overflow-x: auto;">
            <table>
                <tr>
                    <td>User ID</td>
                    <td>Username</td>
                    <td>Email</td>
                    <td>Subject</td>
                    <td>Message</td>
                    <td>Read</td>
                    <td>Reply</td>
                </tr>

                <tr>

                    <?php
                    while ($row = mysqli_fetch_assoc($result1)){
                    ?>
                    <td><?php echo $i=$row['id'];?></td>
                    <td><?php echo $row['username'];?></td>
                    <td><a href="msgofemail.php?id=<?php echo $i?>" style="color: white" name="em"><?php echo $row['email'];?></a></td>
                    <td><?php echo $row['topic'];?></td>
                    <td><?php echo $row['message'];?></td>
                    <td><a href="read.php?id=<?php echo $i?>" ><i class="fa-solid fa-eye" style="color: white"></i></a></td>
                    <td><a href="reply.php?id=<?php echo $i?>" ><i class="fa-solid fa-message" style="color: white"></i></a></td>
                </tr>
                <?php
                }
                ?>

            </table>
        </div>
    </form>
    <a class="aback" href="messages.php">Back</a>
</div>
</body>
</html>
