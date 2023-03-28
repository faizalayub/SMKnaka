<?php
session_start();
require_once('../panggil-database.php');

$id = $_POST['id_pengguna']; // or retrieve from query string parameter if passed as such

$id_kelabP  = $_POST['id_kelabP'];
$id_sukanP  = $_POST['id_sukanP'];
$id_uniform  = $_POST['id_uniform'];
$id_rumah_sukan  = $_POST['id_rumah_sukan'];

// retrieve the row from the database with the specified id
$sn1 = "SELECT * FROM maklumat_murid WHERE id_pengguna = $id";
$result = $sambung->query($sn1);

if ($result->num_rows > 0) {
  $row1 = $result->fetch_assoc();

  // construct the option element with the id and fullname values
  $option_value = $row1['id'] . '-' . $row1['fullname'];
  $option_element = "<option value=\"$option_value\"></option>";

  // update the row in the database with the new value
  $sn2 = "UPDATE maklumat_murid SET id_kelabP = '$id_kelabP',
                                    id_sukanP = '$id_sukanP',
                                    id_uniform = '$id_uniform',
                                    id_rumah_sukan = '$id_rumah_sukan'
                                    WHERE id = $id";
  if ($sambung->query($sn2) === TRUE) {
    header('location: ../pengguna/senarai-guru-kelas.php');
  } else {
    echo 'Check code semula';
  }
} else {
  echo 'Record not found';
}
?>



