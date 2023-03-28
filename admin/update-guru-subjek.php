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
    // Retrieve existing data from rph_guru_subjek table
    $sql_select = "SELECT * FROM rph_guru_subjek WHERE id = $id";
    $result_select = mysqli_query($conn, $sql_select);
    $row_select = mysqli_fetch_assoc($result_select);
    // Close database connection
    mysqli_close($conn);
  } else {
    header('location: ../admin/rph-daftar-guru.php');
    exit();
  }
?>

<form action="../edit/simpan-guru-subjek.php" method="post">
  <input type="hidden" name="id" value="<?php echo $row_select['id']; ?>">
  <div class="form-group">
    <label for="nama murid">Nama Guru</label>
    <select name="id_pengguna" id="id_pengguna" class="form-control">
      <?php
        $sn1 = "SELECT *
                FROM pengguna
                WHERE status=1
                AND role=2
                ORDER BY fullname ASC";
        $rsn1 = mysqli_query($sambung, $sn1);
        while ($rw1 = mysqli_fetch_array($rsn1)){
          $selected = ($rw1['id'] == $row_select['id_pengguna']) ? 'selected' : '';
      ?>
          <option value="<?php echo $rw1['id']; ?>" <?php echo $selected; ?>> <?php echo $rw1['fullname']; ?> </option>
      <?php
        }
      ?>
    </select>
  </div>
  <div class="form-group">
    <label for="nama murid">Kelas</label>
    <select name="id_kelas" id="kelas" class="form-control">
      <?php
        $sn2 = "SELECT id, keterangan
                FROM kelas_lengkap
                ORDER BY keterangan ASC";
        $rsn2 = mysqli_query($sambung, $sn2);
        while ($rw2 = mysqli_fetch_array($rsn2)){
          $selected = ($rw2['id'] == $row_select['id_kelas']) ? 'selected' : '';
      ?>
          <option value="<?php echo $rw2['id']; ?>" <?php echo $selected; ?>> <?php echo $rw2['keterangan']; ?> </option>
      <?php
        }
      ?>
    </select>   
  </div>
  <div class="form-group">
    <label for="subjek">Subjek</label>
    <select name="id_subjek" id="subjek" class="form-control">
    <?php
        $sn1 = "SELECT * FROM rph_subjek ORDER BY subjek ASC";
        $rsn1 = mysqli_query($sambung, $sn1);
        while ($rw1 = mysqli_fetch_array($rsn1)){
            $selected = ($rw1['id'] == $row_select['id_subjek']) ? 'selected' : '';
            echo "<option value='{$rw1['id']}' $selected>{$rw1['subjek']}</option>";
        }
    ?>
</
