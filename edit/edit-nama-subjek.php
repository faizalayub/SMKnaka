<?php
// connect to database
$dbname		= 'dbsmkn';
$host		= 'localhost';
$dbuser		= 'root';
$dbpass		= 'root';
$sambung = new mysqli($host, $dbuser, $dbpass, $dbname);

// check connection
if ($sambung->connect_error) {
	die("Connection failed: " . $sambung->connect_error);
}

// get form data
$id = $_POST['id'];
$sub = $_POST['subjek'];
$ring = $_POST['ringkasan'];

// update 'subjek' table
$sql = "UPDATE rph_subjek SET subjek='$sub', ringkasan='$ring' WHERE id=$id";
if ($sambung->query($sql) === TRUE) {
	// show window notification
	echo "<script>alert('Record updated successfully.');</script>";
	
	// redirect to index.php
	header("Location: ../admin/rph-daftar-subjek.php");
	exit();
} else {
	echo "Error updating record: " . $sambung->error;
}

// close connection
$sambung->close();
?>
