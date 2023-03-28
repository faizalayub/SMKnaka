<?php
       session_start();

       require_once('../panggil-database.php');
    // Get ID parameter value
    $id = $_POST['id'];
    // Get form data
    $id_pengguna = $_POST['id_pengguna'];
    $id_kelas = $_POST['id_kelas'];
    $id_subjek = $_POST['id_subjek'];
    // Update record in database
    $sql = "UPDATE rph_guru_subjek SET id_pengguna='$id_pengguna', id_kelas='$id_kelas', id_subjek='$id_subjek' WHERE id=$id";
    if ($sambung->query($sql) === TRUE) {
        echo 'Record updated successfully.';
    } else {
        echo 'Error updating record: ' . $sambung->error;
    }
?>
