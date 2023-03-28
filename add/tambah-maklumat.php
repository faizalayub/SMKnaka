<?php
    session_start();
    require_once('../panggil-database.php');

    // Retrieve data from form
    $maklumat = $_POST['maklumat'];

    // Insert data into table with timestamp
    $sql = "INSERT INTO makluman (maklumat, id_status, created_at) VALUES ('$maklumat', '1', NOW())";

    if (mysqli_query($sambung, $sql)) {
        mysqli_close($sambung);
        echo "<script>alert('Data inserted successfully'); window.location.href='../pengguna/makluman2.php';</script>";
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($sambung);
        mysqli_close($sambung);
    }
?>
