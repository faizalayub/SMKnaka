<?php
session_start();

require_once('../panggil-database.php');

$fullname   = $_GET['fullname'];
$jenis_sesi = $_GET['jenis_sesi'];
$id         = $_GET['id'];

$sn1 = "UPDATE guru_kelas SET id_pengguna = '$fullname', 
                                id_sesi = '$jenis_sesi' 
                                WHERE id = $id";

if ($sambung->query($sn1) === TRUE) {
    header('location: ../pengguna/senarai-kemaskini-kelas.php?id=' . $jenis_sesi);
} else { 
    echo 'Check code semula';
}
?>
