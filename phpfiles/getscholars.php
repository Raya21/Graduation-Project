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
    <title>Make an appointment</title>
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
        .search{
            position: relative;
            top: -50px;
            left: 600px;
            background-color: black;
            display: block;
            margin: 20px 0 0 20px;
            text-align: center;
            border-radius: 12px;
            border: 2px solid mediumpurple;
            padding: 14px 45px;
            outline: none;
            color: white;
            cursor: pointer;
            font-size: medium;
        }
        .searchtxt{
            position: relative;
            left: 320px;
            top: 10px;
            line-height: 20px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 250px;
            height: 35px;
        }
        h3{
            color: white;
            margin-top: 20px;
            margin-left: 100px;
        }
        .sid{
            position: relative;
            left: 30px;
            top: 40px;
            color: white;


        }
    </style>
</head>
<body>
<div class="scholar">
    <h1>Make an appointment</h1>
</div>
<div class="mane">
    <form action="" method="post">
        <h3 class="sid">Scholarship Name:</h3>
        <input type="text" name="search1" class="searchtxt">
        <input type="submit" name="btn_search1" value="Search" class="search">
    </form>
    <?php
    if(isset($_POST['btn_search1'])){

    ?>
    <div style="padding: 50px; overflow-x: auto;">

        <table>
            <?php
            $search1 = $_POST['search1'];
            $sh = mysqli_query($conn,"SELECT * FROM scholarships WHERE sname LIKE '%$search1%'");
            while($row=mysqli_fetch_assoc($sh)){
            ?>
            <tr>
                <td>Scholarship ID</td>
                <td>Scholarship Name</td>
            </tr>
            <form action="">
                <tr>
                    <td><?php echo $i=$row['scholarship_id'];?></td>
                    <td><a href="makedatescholar.php?sid=<?php echo $i?>" style="color: white" name="em"><?php echo $row['sname'];?></a></td>
                </tr>
            </form>
        </table>
        <?php
        }
        }
        ?>
    </div>

</div>
</body>
</html>