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

<?php
    session_start();
    require_once('../panggil-database.php');
?>

</head>
<body>

<?php
$q = intval($_GET['q']);


$sql="SELECT *
        FROM kokurikulum a
        INNER JOIN kelab_persatuan b
        ON b.id_kokurikulum=a.id
        INNER JOIN sukan_permainan c
        ON c.id_kokurikulum=a.id
        INNER JOIN unit_uniform d
        ON d.id_kokurikulum=a.id
        INNER JOIN rumah_sukan e
        ON e.id_kokurikulum=a.id
      WHERE a.id = '".$q."'";
$result = mysqli_query($con,$sql);

echo '<div class="form-group">';
    echo '<label>Kelas</label>';
    echo '<select name="kelas" class="form-control" onchange="panggilPelajar(this.value)">';
    echo '<option> Pilih Kelas </option>';
    while($row = mysqli_fetch_array($result)) {
    ?>
    <option value="<?php echo $row['kelas']; ?>"> <?php echo $row['kelas']; ?> </option>
    <?php
    }  
    echo "</select>";  
echo '</div>';

mysqli_close($con);
?>
</body>
</html>