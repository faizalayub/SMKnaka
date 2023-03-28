<?php
    session_start();
    require_once('../panggil-database.php');

    $tajuk   = $_POST['tajuk'];
    $sesi   = $_POST['sesi'];

        // Masukkan rekod ke dalam jadual 'pengguna'
        $sn1 = "INSERT INTO sukan_tajuk (tajuk, sesi, id_status) 
                VALUES ('$tajuk', '$sesi','1')";
        mysqli_query($sambung, $sn1) or die(mysqli_error($sambung));
        
        
        // Beritahu pengguna bahawa data telah berjaya dimasukkan
        echo "<script>alert('You have successfully inserted the data');</script>";
        
        // Redirect ke halaman profil guru
        header("location: ../pengguna/profile-view.php?id=$id");
    
?>