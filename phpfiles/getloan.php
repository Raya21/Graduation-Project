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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Loan Request</title>
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

        h3{
            color: white;
            margin-top: 20px;
            margin-left: 100px;
        }

    </style>
</head>
<body>
<div class="scholar">
    <h1>Loan Requests</h1>
</div>
<div class="mane">

    <div style="padding: 50px; overflow-x: auto;">

        <table>
            <?php
            $id = $_GET['lid'];
            $sh = mysqli_query($conn,"SELECT * FROM loan_request WHERE loan_id LIKE '%$id%'");
            while($row=mysqli_fetch_assoc($sh)){
            ?>
            <tr>
                <td>Loan ID</td>
                <td>Loan Name</td>
                <td>Student ID</td>
                <td>Student Name</td>
                <td>Email</td>
                <td>City</td>
                <td>University ID Number</td>
                <td>GPA</td>
            </tr>
            <form action="">
                <tr>
                    <td><?php echo $row['loan_id'];?></td>
                    <td><?php echo $i=$row['lname'];?></td>
                    <td><?php echo $row['id'];?></td>
                    <td><?php echo $j=$row['fname'];?></td>
                    <td><?php echo $k=$row['email'];?></td>
                    <td><?php echo $row['city'];?></td>
                    <td><?php echo $row['uniid'];?></td>
                    <td><?php echo $row['gpa'];?></td></tr>
            </form>
        </table>
        <?php
        }
        ?>
    </div>

</div>
</body>
</html>