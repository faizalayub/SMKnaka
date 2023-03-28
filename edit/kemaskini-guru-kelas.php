<?php
session_start();
require_once('../panggil-database.php');

$fullname = $_POST['fullname'];
$id = $_POST['id'];

// retrieve the row from the database with the specified id
$sn1 = "SELECT * FROM guru_kelas WHERE id = $id";
$result = $sambung->query($sn1);

if ($result->num_rows > 0) {
  $row1 = $result->fetch_assoc();

  // construct the option element with the id and fullname values
  $option_value = $row1['id'] . '-' . $row1['fullname'];
  $option_element = "<option value=\"$option_value\"></option>";

  // update the row in the database with the new value
  $sn2 = "UPDATE guru_kelas SET id_pengguna = '$fullname' WHERE id = $id";
  if ($sambung->query($sn2) === TRUE) {
    header('location: ../pengguna/senarai-guru-kelas.php');
  } else {
    echo 'Check code semula';
  }
} else {
  echo 'Record not found';
}
?>


