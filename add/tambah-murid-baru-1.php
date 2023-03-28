<?php
    session_start();
    require_once('../panggil-database.php');

    $fullname = $_POST['fullname'];
    $username = $_POST['username'];
    $id_kelasLengkap = $_POST['kelas'];
    $jantina = $_POST['jantina'];
    $kaum = $_POST['kaum'];
    $agama = $_POST['agama'];

    // Semak jika pengguna telah berdaftar
    $semak = "SELECT * FROM pengguna WHERE username = '$username'";
    $resultSemak = $sambung->query($semak);

    if ($resultSemak->num_rows > 0) { 
        echo '<div style="color:red;"><center> <h1> Maaf! No. Kad Pengenalan ini telah berdaftar <br> Sila Semak Semula!</h1> <br>';
        echo '<a href="../pengguna/daftar-murid-baru.php"> Daftar semula </a></center></div>';
        exit;
    } else {
        // Masukkan rekod ke dalam jadual 'pengguna'
        $sn1 = "INSERT INTO pengguna (fullname, username, password) VALUES ('$fullname', '$username', '$username')";
        mysqli_query($sambung, $sn1) or die(mysqli_error($sambung));
        
        // Dapatkan ID pengguna yang baru sahaja ditambah
        $id = mysqli_insert_id($sambung);
        
        // Masukkan rekod ke dalam jadual 'maklumat_murid'
        $sn2 = "INSERT INTO maklumat_murid (id_pengguna, id_kelasLengkap, id_jantina, id_kaum, id_agama, id_sesi, image, alamat) 
        VALUES ('$id', '$id_kelasLengkap', '$jantina', '$kaum', '$agama', '2', 'noimage.png', 'KEMASKINI ALAMAT')";
        mysqli_query($sambung, $sn2) or die(mysqli_error($sambung));
        
        // Beritahu pengguna bahawa data telah berjaya dimasukkan
        echo "<script>alert('You have successfully inserted the data');</script>";
        
        // Redirect ke halaman profil murid
        header("location: ../pengguna/profile-murid-view.php?id=$id");
    }
?>