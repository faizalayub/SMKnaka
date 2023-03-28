<?php
    require_once('../../panggil-database.php');
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
$q = intval($_GET['q']);

$sql = "SELECT *
FROM kelas_lengkap
WHERE id_tingkatan = '$q'";

$result = mysqli_query($sambung,$sql);

echo '<div class="form-group">';
    echo '<label>Kelas</label>';
    echo '<select name="kelas" class="form-control" onchange="panggilSubjek1(this.value)">';
    echo '<option> Pilih Kelas </option>';
    while($baca = mysqli_fetch_array($result)) {
    ?>
    <option value="<?php echo $baca['id']; ?>"> <?php echo $baca['keterangan']; ?> </option>
    <?php
    }  
    echo "</select>";  
echo '</div>';

mysqli_close($sambung);
?>
</body>
</html>