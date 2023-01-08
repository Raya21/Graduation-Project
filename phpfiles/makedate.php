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
$sname = $_GET['sname'];
$fname = $_GET['fname'];
$email = $_GET['email'];
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
            background-color: white;
            background-size: cover;
            background-position: center;
            font-family: sans-serif;
            margin-top: 0px;
            max-width: 100vw;
            overflow-x: hidden;
        }
        .mane{
            background-color: rgb(0,0,0,0.5);
            width: 800px;
            height: 400px;
            margin: auto;
        }
        .scholar{
            width: 800px;
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
        .date{
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
        .datetxt{
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
        .snamelabel{
            position: relative;
            color: #e5e5e5;
            text-transform: capitalize;
            font-size: 16px;
            left: -110px;
            top: 50px;
        }
        .fnamelabel{
            position: relative;
            color: #e5e5e5;
            text-transform: capitalize;
            font-size: 16px;
            left: -110px;
            top: 70px;
        }
        .datelabel{
            position: relative;
            color: #e5e5e5;
            text-transform: capitalize;
            font-size: 16px;
            left: -110px;
            top: 90px;
        }
        .snametxt{
            position: relative;
            left: 350px;
            top: 50px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .fnametxt{
            position: relative;
            left: 350px;
            top: 70px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .datetxt{
            position: relative;
            left: 350px;
            top: 90px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
            width: 300px;
        }
        .date{
            position: relative;
            left: 350px;
            top: 120px;
            margin-bottom: 20px;
            line-height: 40px;
            border-radius: 6px;
            padding: 0 22px;
            font-size: 16px;
            color: white;
            width: 200px;
        }
    </style>
</head>
<body>
<div class="scholar">
    <h1>Make an appointment</h1>
</div>
<div class="mane">
    <form action="" method="post">
        <div id="sname">
            <input type="text" value="<?php echo $sname?>" class="snametxt">
            <label class="snamelabel">Scholarship Name</label>
        </div>
        <div id="fname">
            <input type="text" value="<?php echo $fname?>" class="fnametxt">
            <label class="fnamelabel">Student Name</label>
        </div>
       <div id="date">
           <input type="datetime-local" name="datee" class="datetxt">
           <label class="datelabel">Date</label>
       </div>
        <input type="submit" name="btn_date1" value="Make Date" class="date">
    </form>
        <?php
        if(isset($_POST['btn_date1'])){
                $date = $_POST['datee'];
                $select = "SELECT * FROM makedate WHERE email='".$email."' AND sname='".$sname."'";
                $result = mysqli_query($conn,$select);
                $count  = mysqli_num_rows($result);
                if ($count == 1) {
                    $update = "UPDATE makedate SET  sname='".$sname."', fname='".$fname."', datetime='".$date."' WHERE email='".$email."'";
                    if (mysqli_query($conn, $update)) {
                        echo '<script>alert("The date has been modified")</script>';
                        echo '<script>window.location.assign("makedatescholar.php")</script>';
                    } else {
                        echo "Error: " . $update . "<br>" . mysqli_error($conn);
                    }
                }else {

                    $sql = "INSERT INTO makedate (email,sname, fname, datetime) VALUES ('$email','$sname','$fname','$date')";
                    if (mysqli_query($conn, $sql)) {
                        echo '<script>alert("An appointment has been booked")</script>';
                        echo '<script>window.location.assign("makedatescholar.php")</script>';
                    } else {
                        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                    }
                }
                mysqli_close($conn);
        }
                ?>

</div>
</body>
</html>