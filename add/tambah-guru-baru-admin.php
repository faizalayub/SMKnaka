<?php
    session_start();
    require_once('../panggil-database.php');

    $fullname   = $_POST['fullname'];
    $username   = $_POST['username'];
    $password   = $_POST['password'];
    $email      = $_POST['email'];
    $id_gred    = $_POST['gred'];
    $id_jawatan = $_POST['jawatan'];
    $contactno  = $_POST['contactno'];

    // Semak jika pengguna telah berdaftar
    $semak = "SELECT * FROM pengguna WHERE username = '$username'";
    $resultSemak = $sambung->query($semak);

    if ($resultSemak->num_rows > 0) { 
        echo '<div style="color:red;"><center> <h1> Maaf! No. Kad Pengenalan ini telah berdaftar <br> Sila Semak Semula!</h1> <br>';
        echo '<a href="../pengguna/daftar-guru-baru1.php"> Daftar semula </a></center></div>';
        exit;
    } else {
        // Masukkan rekod ke dalam jadual 'pengguna'
        $sn1 = "INSERT INTO pengguna (fullname, email, username, password, role, status) 
                VALUES ('$fullname', '$email', '$username', '$password', '2', '1')";
        mysqli_query($sambung, $sn1) or die(mysqli_error($sambung));
        
        // Dapatkan ID pengguna yang baru sahaja ditambah
        $id = mysqli_insert_id($sambung);
        
        // Masukkan rekod ke dalam jadual 'maklumat_guru'
        $sn2 = "INSERT INTO maklumat_guru (id_pengguna, id_gred, id_jawatan, contactno, image, id_status) 
                VALUES ('$id', '$id_gred', '$id_jawatan', '$contactno', 'noimage.png', '1')";
        mysqli_query($sambung, $sn2) or die(mysqli_error($sambung));
        
        // Beritahu pengguna bahawa data telah berjaya dimasukkan
        echo "<script>alert('You have successfully inserted the data');</script>";
        
        // Redirect ke halaman profil guru
        header("location: ../admin/profile-view.php?id=$id");
    }
?>