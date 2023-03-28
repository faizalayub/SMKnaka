<?php
    require_once('panggil-database.php');
  ?>
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
        width: 100%;
        border-collapse: collapse;
        }

        table, td, th {
        border: 1px solid black;
        padding: 5px;
        }

        th {text-align: left;}
    </style>
</head>
<body>

<?php
$q = $_GET['q'];

$sql = "SELECT * 
FROM maklumat_murid a
JOIN pengguna AS b ON a.id_pengguna = b.id
JOIN kelas_lengkap as C ON a.id_kelasLengkap = c.id
WHERE a.id_kelasLengkap = '$q'
ORDER BY b.fullname ASC";

$result = mysqli_query($sambung,$sql);
$i = 1;
echo "<table class='table table-responsive table-bordered'>
<tr>
    <th>#</th>
    <th><input type = 'button' id = 'btnGet' value = 'Get' /></th>
    <th>NAMA MURID</th>
    <th>KELAS</th>
</tr>";
while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $i++ . "</td>";
  echo "<td><input type='checkbox' name='id_pengguna[]' value='" . $row['id'] . "' class='myCheck' ></td>";
  echo "<td>" . $row['fullname'] . "</td>";
  echo "<td>" . $row['keterangan'] . "</td>";
  echo "</tr>";
}
echo "</table>";
mysqli_close($sambung);
?>
</body>
</html>