<?php
    require_once('../panggil-database.php');

    session_start();

    $tingkatan  = $_POST['tingkatan'];
    $kelas      = $_POST['kelas'];
    $tarikh     = strtotime($_POST['tarikh']);

    //echo 'Tarikh: ' . $tarikh;

    $id_pengguna = $_POST['id_pengguna'];

    $jumPelajar = count($id_pengguna);

    $tingkatan  = $_POST['tingkatan'];
    $kelas      = $_POST['kelas'];
    $tarikh     = strtotime($_POST['tarikh']);

    //echo 'Tarikh: ' . $tarikh;

    $id_pengguna = $_POST['id_pengguna'];

    $jumPelajar = count($id_pengguna);

    for ($i=0; $i<$jumPelajar; ++$i){
        $sn1 = "insert into kehadiran_harian(id_pengguna,id_tingkatan,id_kelas,tarikh) values ('$id_pengguna[$i]','$tingkatan','$kelas','$tarikh')";
        if($sambung->query($sn1)){
            $_SESSION['success'] = 'Kehadiran direkodkan!';
            header('location: /kehadiran/kehadiran-harian.php');
        }else{
            var_dump("insert into kehadiran_harian(id_pengguna,id_tingkatan,id_kelas,tarikh) values ('$id_pengguna[$i]','$tingkatan','$kelas','$tarikh')");
            die();
        };

        

    }
  ?>