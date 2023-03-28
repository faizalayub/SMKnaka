<?php
// connect to the database
$conn = mysqli_connect("localhost", "root", "root", "dbsmkn");

// check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// get form data
$tajuk = $_POST['tajuk'];
$sesi = $_POST['sesi'];

// insert data into table
$sql = "INSERT INTO sukan_daftar_nama_kejohanan (tajuk, sesi) VALUES ('$tajuk', '$sesi')";

if (mysqli_query($conn, $sql)) {
    // show success message
    echo "Record added successfully.";

    // return to index.php after 2 seconds
    header("Refresh: 2; URL=../admin/index.php");
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// close the database connection
mysqli_close($conn);
?>