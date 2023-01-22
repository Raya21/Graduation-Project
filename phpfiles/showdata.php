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
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Users Info.</title>
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
            width: 500px;
            text-align: center;
            color: white;
            margin-top: 10px;
            margin-left: 200px;
        }

        th, td {
            text-align: left;
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
            left: 300px;
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
    <h1>Users Info.</h1>
</div>
<div class="mane">
    <a href="searchforidbyuname.php" style="color: white; font-size: 20px;"><i class='far fa-hand-point-right' style='font-size:20px;color:white; padding-left: 200px; padding-top: 20px'></i>Click here to search for student's ID Card</a>
    <form action="" method="post">
        <h3 class="sid">Student ID Card:</h3>
        <input type="text" name="search" class="searchtxt">
        <input type="submit" name="btn_search" value="Search" class="search">
    </form>
    <?php
    if(isset($_POST['btn_search'])){

    ?>
        <div style="padding: 50px; overflow-x: auto;">
            <h3>Student Information:</h3>
            <table>
                <?php
                $search = $_POST['search'];
                $sh = mysqli_query($conn,"SELECT * FROM familydatas1 WHERE studentIdCard LIKE '%$search%'");
                while($row=mysqli_fetch_assoc($sh)){
                ?>
                <tr>
                    <td>Student ID Card</td>
                    <td><?php echo $row['studentIdCard'];?></td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td><?php echo $row['userId'];?></td>
                </tr>
                <tr>
                    <td>Student Name</td>
                    <td><?php echo $row['studentName'];?></td>
                </tr>
                <tr>
                    <td>Student Number</td>
                    <td><?php echo $row['studentNumber'];?></td>
                </tr>

            </table>
            <h3>Father Information:</h3>
            <table>
                <tr>
                    <td>Father Name</td>
                    <td><?php echo $row['fatherName'];?></td>
                </tr>
                <tr>
                    <td>Father ID Card</td>
                    <td><?php echo $row['fatherIdCard'];?></td>
                </tr>
                <tr>
                    <td>Father Career Status</td>
                    <td><?php echo $row['fatherCareerStatus'];?></td>
                </tr>
                <tr>
                    <td>Father Work Place</td>
                    <td><?php echo $row['fatherWorkPlace'];?></td>
                </tr>
                <tr>
                    <td>Father Job</td>
                    <td><?php echo $row['fatherJob'];?></td>
                </tr>
                <tr>
                    <td>Father Work Nature</td>
                    <td><?php echo $row['fatherWorkNature'];?></td>
                </tr>
                <tr>
                    <td>Father Job Desc</td>
                    <td><?php echo $row['fatherJobDesc'];?></td>
                </tr>

            </table>
            <h3>Mother Information:</h3>
            <table>
                <tr>
                    <td>Mother Name</td>
                    <td><?php echo $row['motherName'];?></td>
                </tr>
                <tr>
                    <td>Mother ID Card</td>
                    <td><?php echo $row['motherIdCard'];?></td>
                </tr>
                <tr>
                    <td>Mother Career Status</td>
                    <td><?php echo $row['motherCareerStatus'];?></td>
                </tr>
                <tr>
                    <td>Mother Work Place</td>
                    <td><?php echo $row['motherWorkPlace'];?></td>
                </tr>
                <tr>
                    <td>Mother Job</td>
                    <td><?php echo $row['motherJob'];?></td>
                </tr>
                <tr>
                    <td>Mother Work Nature</td>
                    <td><?php echo $row['motherWorkNature'];?></td>
                </tr>
                <tr>
                    <td>Mother Job Desc</td>
                    <td><?php echo $row['motherJobDesc'];?></td>
                </tr>

            </table>
            <h3>Husband/Wife Information:</h3>
            <table>
                <tr>
                    <td>Husband/Wife Name</td>
                    <td><?php echo $row['hwName'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife ID Card</td>
                    <td><?php echo $row['hwIdCard'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife Career Status</td>
                    <td><?php echo $row['hwCareerStatus'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife Work Place</td>
                    <td><?php echo $row['hwWorkPlace'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife Job</td>
                    <td><?php echo $row['hwJob'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife Work Nature</td>
                    <td><?php echo $row['hwWorkNature'];?></td>
                </tr>
                <tr>
                    <td>Husband/Wife Job Desc</td>
                    <td><?php echo $row['hwJobDesc'];?></td>
                </tr>
            </table>
            <h3>Social Situation:</h3>
            <table>
                <tr>
                    <td>Student Social Situation</td>
                    <td><?php echo $row['studentSocialSit'];?></td>
                </tr>
                <tr>
                    <td>Parents Social Situation</td>
                    <td><?php echo $row['parentsSocialSit'];?></td>
                </tr>
            </table>
            <?php
            }
            ?>
            <?php
            $search = $_POST['search'];
            $sh1 = mysqli_query($conn,"SELECT * FROM familydatas2 WHERE studentIdCard LIKE '%$search%'");
            while($row=mysqli_fetch_assoc($sh1)){
                ?>
                <h3>The funder of university costs:</h3>
            <table>
                <tr>
                    <td>Relative Relation</td>
                    <td><?php echo $row['relativeRelation'];?></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><?php echo $row['name'];?></td>
                </tr>
                <tr>
                    <td>ID Number</td>
                    <td><?php echo $row['idNumber'];?></td>
                </tr>
                <tr>
                    <td>Work Place</td>
                    <td><?php echo $row['workPlace'];?></td>
                </tr>
                <tr>
                    <td>Job</td>
                    <td><?php echo $row['job'];?></td>
                </tr>
                <tr>
                    <td>Note</td>
                    <td><?php echo $row['note'];?></td>
                </tr>

            </table>

        <?php
        }
        ?>
            <?php
            $search = $_POST['search'];
            $sh2 = mysqli_query($conn,"SELECT * FROM familydatas3 WHERE studentIdCard LIKE '%$search%'");
            while($row=mysqli_fetch_assoc($sh2)){
                ?>
            <table>
                <tr>
                    <td>Family Members Number</td>
                    <td><?php echo $row['numFamilyMem'];?></td>
                </tr>
                <tr>
                    <td>Number of member diseases</td>
                    <td><?php echo $row['numMemDiseases'];?></td>
                </tr>
                <tr>
                    <td>Family Income</td>
                    <td><?php echo $row['familyIncome'];?></td>
                </tr>
                <tr>
                    <td>Family Assistance</td>
                    <td><?php echo $row['familyAssistance'];?></td>
                </tr>
                <tr>
                    <td>Card Number</td>
                    <td><?php echo $row['cardNumber'];?></td>
                </tr>
                <tr>
                    <td>Family Housing</td>
                    <td><?php echo $row['familyHousing'];?></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>Monthly Rent</td>
                    <td><?php echo $row['monthlyRent'];?></td>
                </tr>
                <tr>
                    <td>FamilyResidence</td>
                    <td><?php echo $row['familyResidence'];?></td>
                </tr>
                <tr>
                    <td>Number of vehicles (Private)</td>
                    <td><?php echo $row['numPrivate'];?></td>
                </tr>
                <tr>
                    <td>Number of vehicles (Public)</td>
                    <td><?php echo $row['numPublic'];?></td>
                </tr>
                <tr>
                    <td>Number of vehicles (Commercial)</td>
                    <td><?php echo $row['numCommercial'];?></td>
                </tr>
                <tr>
                    <td>Student Housing Fee</td>
                    <td><?php echo $row['studentHousingFee'];?></td>
                </tr>
                <tr>
                    <td>Smoke</td>
                    <td><?php echo $row['smoke'];?></td>
                </tr>
                <tr>
                    <td>Number University Student</td>
                    <td><?php echo $row['numUniversityStu'];?></td>
                </tr>
            </table>

            <?php
            }
            ?>
            <h3>Undergraduate fraternity data:</h3>
            <table>
                <tr>
                    <td>Brother ID</td>
                    <td>Student Name</td>
                    <td>Registration Number</td>
                    <td>College Name</td>
                    <td>University Name</td>
                </tr>
            <?php
            $search = $_POST['search'];
            $sh2 = mysqli_query($conn,"SELECT * FROM brothersdata WHERE userIdCard LIKE '%$search%'");
            while($row=mysqli_fetch_assoc($sh2)){
                ?>
                    <tr>
                        <td><?php echo $row['BrotherId'];?></td>
                        <td><?php echo $row['StudentName'];?></td>
                        <td><?php echo $row['RegistrationNumber'];?></td>
                        <td><?php echo $row['CollegeName'];?></td>
                        <td><?php echo $row['UniversityName'];?></td>
                    </tr>

            <?php
            }
            ?>
            </table>
                <?php
            }
            ?>
        </div>
</div>
</body>
</html>