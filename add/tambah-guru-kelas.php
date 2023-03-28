<?php
       session_start();

    require_once('../panggil-database.php');

    $id_pengguna        = $_GET['id_pengguna'];
    $id_kelasLengkap    = $_GET['id_kelasLengkap'];
    $id_sesi            = $_GET['id_sesi'];
   
    
    $sn1 = "INSERT INTO guru_kelas (id_pengguna, id_kelasLengkap, id_sesi)
                        VALUES ('$id_pengguna', '$id_kelasLengkap', '$id_sesi')";
    if ($sambung->query($sn1) === TRUE) {
        header('location: ../admin/senarai-guru-kelas.php');
    } else { 
        echo 'Check code semula';
    }
   


        
   //$query=mysqli_query($sambung,"INSERT INTO guru_kelas (id_pengguna, id_kelasLengkap, id_sesi') VALUES('$id_pengguna','$id_kelasLengkap', '$id_sesi')");
   // header('location: ../admin/senarai-guru-kelas.php');
    

   ?>