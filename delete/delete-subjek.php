<!DOCTYPE html>
<html>
<head>
	<title>Delete Subject</title>
</head>
<body>
	<h1>Delete Subject</h1>
	<?php
		// Check if ID parameter is set
		if (isset($_GET['id'])) {
			// Get ID parameter value
			$id = $_GET['id'];
			// Connect to database
			$conn = mysqli_connect('localhost', 'root', 'root', 'dbsmkn');
			if (!$conn) {
				die('Could not connect to database: ' . mysqli_error());
			}
            // Delete row from subjek table
            $sql = "DELETE FROM rph_subjek WHERE id = $id";
            if (mysqli_query($conn, $sql)) {
                echo "Subject with ID $id has been deleted successfully.";
                // Redirect back to index.php after deletion
                header("Refresh: 3; url=../admin/rph-daftar-subjek.php");
                exit();
            } else {
                echo "Error deleting subject: " . mysqli_error($conn);
            }
            // Close database connection
			mysqli_close($conn);
		} else {
			// Display form to enter ID
			echo '<form method="get" action="delete.php">';
			echo '<label for="id">Subject ID:</label>';
			echo '<input type="text" name="id" id="id">';
			echo '<input type="submit" value="Delete">';
			echo '</form>';
		}
	?>
</body>
</html>