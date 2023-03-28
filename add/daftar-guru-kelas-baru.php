<?php
       session_start();

    require_once('../panggil-database.php');

    $id_pengguna        = $_POST['fullname'];
    $id_kelasLengkap    = $_POST['kelas_lengkap'];
    $id_sesi            = $_POST['jenis_sesi'];
   
    
    $sn1 = "INSERT INTO guru_kelas (id_pengguna, id_kelasLengkap, id_sesi)
                        VALUES ('$id_pengguna', '$id_kelasLengkap', '$id_sesi')";
    if ($sambung->query($sn1) === TRUE) {
        header('location: ../pengguna/senarai-guru-kelas.php');
    } else { 
        echo 'Check code semula';
    }
   

   ?>