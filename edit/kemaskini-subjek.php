<?php
session_start();
require_once('../panggil-database.php');

// Assuming you want to update the row with id=1
$id = $_GET['id'];
$subjek = $_GET['subjek'];
$ringkasan = $_GET['ringkasan'];

// Retrieve the existing row with the specified id
$query = "SELECT * FROM rph_subjek WHERE id = $id AND id_status='1'";
$query_run = mysqli_query($sambung, $query);

if(mysqli_num_rows($query_run) > 0) {
    $data = mysqli_fetch_assoc($query_run);
    $subjek = $data['subjek'];
    $ringkasan = $data['ringkasan'];
    
    // Update the row with the new values
    $sn1 = "UPDATE rph_subjek SET subjek='$subjek', ringkasan='$ringkasan' WHERE id=$id";
    
    if ($sambung->query($sn1) === TRUE) {
        header('location: ../admin/rph-daftar-subjek.php');
        exit();
    } else { 
        echo 'Check code semula';
    }
}
?>
