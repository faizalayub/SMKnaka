
<?php
    session_start();
    require_once('../panggil-database.php');
    
    $id_pengguna = $_POST['id_pengguna'];
    $id_kelasLengkap = $_POST['id_kelasLengkap'];
    $prevPage = $_POST['from'];
        
    $sn1 = "UPDATE pengguna SET status = 2 WHERE id=" . $id_pengguna;
    $sn2 = "UPDATE maklumat_murid SET id_status = 2 WHERE id_pengguna=" . $id_pengguna;
    //echo  $sn1;
    if ($sambung->query($sn1) === TRUE && $sambung->query($sn2) === TRUE) {
        if($prevPage == "senarai-kemaskini-kelas"){
            header('location: ../pengguna/senarai-kemaskini-kelas.php?id=' . $id_kelasLengkap);
        }
    } else { 
        echo 'Check code semula';
    }
    echo  $id_pengguna;
?>
