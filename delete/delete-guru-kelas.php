<?php
include('../panggil-database.php');
$id = $_GET ['id'];

$query=mysqli_query($sambung,"DELETE FROM guru_kelas WHERE id='$id_pengguna'");
header('location: ../admin/senarai-guru-kelas.php');
?>

