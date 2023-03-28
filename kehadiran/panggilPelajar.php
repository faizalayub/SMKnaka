<?php
    require_once('../panggil-database.php');
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

$sql = "SELECT b.id , b.fullname, c.keterangan
FROM maklumat_murid a
JOIN pengguna AS b ON a.id_pengguna = b.id
JOIN kelas_lengkap as c ON a.id_kelasLengkap = c.id
WHERE a.id_kelasLengkap = '$q'
AND b.status =1
ORDER BY b.fullname ASC";

$result = $sambung->query($sql);

$i = 1;

echo "<table class='table table-responsive table-bordered'>
<tr>
    <th>#</th>
    <th><input type = 'button' id = 'btnGet' value = 'Tanda' /></th>
    <th>NAMA TIDAK HADIR</th>
    <th>KELAS</th>
</tr>";

while($row = $result->fetch_assoc()) {
  echo "<tr>";
  echo "<td>" . $i++ . "</td>";
  echo "<td><input type='checkbox' name='id_pengguna[]' value='" . $row['id'] . "' class='myCheck' ></td>";
  echo "<td>" . $row['fullname'] . "</td>";
  echo "<td>" . $row['keterangan'] . "</td>";
  echo "</tr>";
}
echo "</table>";
$sambung->close();
?>
</body>
</html>