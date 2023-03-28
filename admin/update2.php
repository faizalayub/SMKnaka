<!DOCTYPE html>
<html>
<head>
	<title>Update Subjek</title>
</head>
<body>
	<h1>Update Subjek</h1>
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

	// get id from URL
	$id = $_GET['id'];

	// retrieve data from 'subjek' table
	$sql = "SELECT * FROM rph_subjek WHERE id=$id";
	$result = $sambung->query($sql);

	// display data in form
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$sub = $row['subjek'];
		$ring = $row['ringkasan'];
		echo "<form method='post' action='../edit/edit-nama-subjek.php'>";
		echo "<input type='hidden' name='id' value='$id'>";
		echo "Subjek: <input type='text' name='subjek' value='$sub'><br>";
        echo "Subjek: <input type='text' name='ringkasan' value='$ring'><br>";
		echo "<input type='submit' value='Update'>";
		echo "</form>";
	} else {
		echo "No data found.";
	}

	// close connection
	$sambung->close();
	?>
</body>
</html>