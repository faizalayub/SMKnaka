<?php
session_start();

require_once('../panggil-database.php');

$id = $_GET['id'];
$status = $_GET['status'];

$sn1 = "UPDATE pengguna SET status = '$status' WHERE id = '$id'";

if ($sambung->query($sn1) === TRUE) {
  header('location: ../pengguna/senarai-kemaskini-kelas.php?id=' . $id);
} else {
  echo 'Check code semula';
}
?>