<?php/*
   include('../panggil-database.php');

   $fullname = $_GET ['fullname'];
   $username = $_GET ['username'];
   $password = $_GET ['password'];

$query=mysqli_query($sambung,"INSERT INTO pengguna (fullname, username, password) VALUES('', '$fullname','$username', '$password')");
header('location: ../admin/senarai-murid-baru.php');
*/
?>


<?php
       session_start();

    require_once('../panggil-database.php');

    $fullname     = $_GET['fullname'];
    $username     = $_GET['username'];
    $password     = $_GET['password'];
   
    /*
    $sn1 = "INSERT INTO guru_kelas (id_pengguna, nama_tingkatan, nama_kelas)
                        VALUES ('$id_pengguna', '$nama_tingkatan', '$nama_kelas')";
    if ($sambung->query($sn1) === TRUE) {
        header('location: ../admin/senarai-guru-kelas.php');
    } else { 
        echo 'Check code semula';
    }
    */


        
   $query=mysqli_query($sambung,"INSERT INTO pengguna (fullname, username, password, role, status) VALUES('$fullname','$username', '$password','3','9')");
    header('location: ../admin/senarai-murid-baru.php');
    

   ?>