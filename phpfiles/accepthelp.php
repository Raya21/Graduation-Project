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
$query = "SELECT * from add_help WHERE accept='not accept'";
$result = mysqli_query($conn,$query);
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
            background-color: rgb(0,0,0,0.5);
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
            height: auto;
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
    <h1>Donation Requests</h1>
</div>
<div class="mane">
    <form action="accept.php" method="get">
        <div style="padding: 50px; overflow-x: auto;">
            <table>
                <tr>
                    <td>Donation ID</td>
                    <td>Email</td>
                    <td>Username</td>
                    <td>typed</td>
                    <td>The amount of money</td>
                    <td>Thing name</td>
                    <td>The cost</td>
                    <td>Post</td>
                    <td>Accept</td>
                </tr>
                <tr>

                    <?php
                    while ($row = mysqli_fetch_assoc($result)){
                    ?>
                    <td><?php echo $j=$row['id'];?></td>
                    <td><?php echo $row['email'];?></td>
                    <td><?php echo $row['username'];?></td>
                    <td><?php echo $i=$row['typed'];?></td>
                    <td><?php echo $row['money'];?></td>
                    <td><?php echo $row['thingname'];?></td>
                    <td><?php echo $i=$row['cost'];?></td>
                    <td><?php echo $row['post'];?></td>
                    <td><a href="accept.php?id=<?php echo $j;?>" ><i class="fa-solid fa-check" style="color: white"></i></a></td>
                </tr>
                <?php
                }
                ?>

            </table>
        </div>
    </form>
</div>
</body>
</html>
