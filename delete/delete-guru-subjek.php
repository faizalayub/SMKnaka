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
    $sql = "DELETE FROM rph_guru_subjek WHERE id = $id";
    if (mysqli_query($conn, $sql)) {
      echo "<script>alert('Data berhasil dihapus dari rekod.');</script>";
      // Redirect back to index.php after deletion
      echo "<script>setTimeout(\"location.href = '../admin/rph-daftar-guru.php';\",1500);</script>";
    } else {
      echo "<script>alert('Error deleting data: " . mysqli_error($conn) . "');</script>";
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