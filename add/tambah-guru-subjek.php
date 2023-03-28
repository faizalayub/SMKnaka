<?php
  session_start();

  require_once('../panggil-database.php');

  $id_pengguna = $_POST['id_pengguna'];
  $id_kelas = $_POST['id_kelas'];
  $id_subjek = $_POST['id_subjek'];

  // Check if data already exists in table
  $sql_check = "SELECT COUNT(*) AS count FROM rph_guru_subjek WHERE id_pengguna = '$id_pengguna' AND id_kelas = '$id_kelas' AND id_subjek = '$id_subjek'";
  $result_check = $sambung->query($sql_check);
  $row_check = $result_check->fetch_assoc();
  $count = $row_check['count'];

  if ($count > 0) {
    echo '<script>alert("Data ini sudah ada di dalam rekod terdahulu.");</script>';
    header('Refresh: 3;url=' . $_SERVER['HTTP_REFERER']);
    exit();
  } else {
    // Insert data into table
    $sql_insert = "INSERT INTO rph_guru_subjek (id_pengguna, id_kelas, id_subjek) VALUES ('$id_pengguna', '$id_kelas', '$id_subjek')";
    if ($sambung->query($sql_insert) === TRUE) {
      echo '<script>alert("Data berhasil ditambahkan ke dalam rekod.");</script>';
      header('Refresh: 1;url=' . $_SERVER['HTTP_REFERER']);
    } else { 
      echo 'Error inserting data: ' . $sambung->error;
    }
  }
?>
