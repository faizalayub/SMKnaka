<?php
       session_start();

    require_once('../panggil-database.php');

    $id_pengguna        = $_GET['id_pengguna'];
    $id_kelasLengkap    = $_GET['id_kelasLengkap'];
  
    
    $sn1 = "UPDATE info_murid SET id_kelasLengkap = $id_kelasLengkap
                        WHERE id_pengguna = $id_pengguna";
    if ($sambung->query($sn1) === TRUE) {
        header('location: ../pengguna/senarai-kemaskini-kelas.php?id');
    } else { 
        echo 'Check code semula';
    }
   


        
   //$query=mysqli_query($sambung,"INSERT INTO guru_kelas (id_pengguna, id_kelasLengkap, id_sesi') VALUES('$id_pengguna','$id_kelasLengkap', '$id_sesi')");
   // header('location: ../admin/senarai-guru-kelas.php');
    

   ?>