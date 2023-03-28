<?php
session_start();

require_once('../panggil-database.php');

$subjek = $_POST['subjek'];
$ringkasan = $_POST['ringkasan'];

// Check if data already exists in table
$sql_check = "SELECT COUNT(*) AS count FROM rph_subjek WHERE subjek = '$subjek'";
$result_check = $sambung->query($sql_check);
$row_check = $result_check->fetch_assoc();
$count = $row_check['count'];

if ($count > 0) {
  echo '<script>alert("Subjek ini telah ada di dalam rekod terdahulu.");</script>';
  header('Refresh: 1;url=' . $_SERVER['HTTP_REFERER']);
  exit();
} else {
  // Insert data into table
  $sql_insert = "INSERT INTO rph_subjek (subjek, ringkasan) VALUES ('$subjek', '$ringkasan')";
  if ($sambung->query($sql_insert) === TRUE) {
    echo '<script>alert("Subjek Berjaya di daftarkan.");</script>';
    header('Refresh: 1;url=' . $_SERVER['HTTP_REFERER']);
  } else { 
    echo 'Error inserting data: ' . $sambung->error;
  }
}
?>


<?php
//session_start();

//require_once('../panggil-database.php');

//$subjek = $_POST['subjek'];
//$ringkasan = $_POST['ringkasan'];

// Check if data already exists in table
//$sql_check = "SELECT COUNT(*) AS count FROM rph_subjek WHERE subjek = '$subjek'";
//$result_check = $sambung->query($sql_check);
//$row_check = $result_check->fetch_assoc();
//$count = $row_check['count'];

//if ($count > 0) {
////  echo 'Subjek ini telah ada di dalam rekod terdahulu.';
 // header('Refresh: 3;url=' . $_SERVER['HTTP_REFERER']);
 // exit();
//} else {
  // Insert data into table
//  $sql_insert = "INSERT INTO rph_subjek (subjek, ringkasan) VALUES ('$subjek', '$ringkasan')";
////  if ($sambung->query($sql_insert) === TRUE) {
 //   header('Refresh: 1;url=' . $_SERVER['HTTP_REFERER']);
 //   echo 'Subjek Berjaya di daftarkan.';
 // } else { 
 //   echo 'Error inserting data: ' . $sambung->error;
 // }
//}

?>




//<?php
//       session_start();
//
//    require_once('../panggil-database.php');
//
//    $subjek        = $_POST['subjek'];
//    $ringkasan        = $_POST['ringkasan'];
//    
//    $sn1 = "INSERT INTO rph_subjek (subjek,ringkasan)
//                        VALUES ('$subjek','$ringkasan')";
//    if ($sambung->query($sn1) === TRUE) {
//        header('location: ../admin/rph-daftar-subjek.php');
//    } else { 
//        echo 'Check code semula';
//    }
   

   ?>