<?php
    session_start();

    require_once('../panggil-database.php');

  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | Senarai Nama Murid</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="../dist/img/logo.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  <!-- Navbar -->
  <?php
    require_once('../layout/navbar.php');
  ?>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <!-- Main Sidebar Container -->
  <?php
    require_once('../layout/menu-tepi-guru.php');
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Kemaskini</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item"><a href="senarai-guru-kelas.php">Guru Kelas</a></li>
              <li class="breadcrumb-item active">Kemaskini Pukal</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- card -->
            <div class="card">
              <?php 
                $id_kelas = $_GET['id'];
                $queryDetailClass = "SELECT kelas_lengkap.keterangan,pengguna.fullname FROM kelas_lengkap  
                  INNER JOIN guru_kelas ON kelas_lengkap.id = guru_kelas.id_kelasLengkap 
                  INNER JOIN pengguna ON guru_kelas.id_pengguna = pengguna.id
                  WHERE kelas_lengkap.id =" . $id_kelas;
                $query_runDetailClass = mysqli_query($sambung, $queryDetailClass);
                if(mysqli_num_rows($query_runDetailClass) > 0)
                {
                    foreach($query_runDetailClass as $detailClass)
                    {
                      $className = $detailClass['keterangan'];
                      $classTeacher = $detailClass['fullname'];
                    }
                }
              ?>
              <div class="card-header">
                  Nama Kelas :<b> <?php echo $className ?> </b>
                  <br></br>
                  Nama Guru Kelas : <b><?php echo $classTeacher ?></b>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <p><b>1. Sila Pilih Kelas Baharu</b></p>
                <p><b>2. Sila Pilih Nama Murid</b></p>
                <p><b>3. Klik Tukar Kelas</b></p>
                <form method="post" action="../edit/tukar-kelas-pukal.php">
                            <div class="modal-body">
                            <div class="form-row">
                              <div class="col">
                                <select name="id_kelasLengkap" id="id_kelasLengkap" class="form-control" >
                                  <option value="">Pilih Kelas</option>
                                  <?php
                                                                $sn1 = "SELECT id, keterangan
                                                                        FROM kelas_lengkap
                                                                        ";
                                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                                            ?>
                                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['keterangan'];?> </option>
                                  <?php
                                                                }
                                                            ?>
                                </select>
                                <input type="hidden" name="kelas_lama" value="<?= $id_kelas; ?>">
                              </div>
                            </div>
                            </div>
                        </td>
                        <td>
                          <button type="submit" class="btn btn-danger" >Tukar Kelas</button>
                
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>PILIH</th>
                        <th>NAMA PELAJAR</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php     
                            $id_kelas = $_GET['id'];
                            $i = 1; 
                            $query = "SELECT *,b.id as id FROM maklumat_murid AS a 
                                      JOIN pengguna AS b ON a.id_pengguna = b.id
                                      JOIN kelas_lengkap AS c ON c.id=a.id_kelasLengkap
                                      WHERE a.id_kelasLengkap = '$id_kelas'";
                            $query_run = mysqli_query($sambung, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $baca)
                                {
                                    ?>
                      <tr>
                        <td><?php echo $i++; ?></td>
                        <td><input type="checkbox" id="id_pengguna" name="pelajar[]" value="<?= $baca['id']; ?>"></td>
                        <td><?= $baca['fullname']; ?></td>
         
                      </tr>
                      <?php
                                }
                            }
                            else
                            {
                                echo "<h5> No Record Found </h5>";
                            }
                        ?>
                       
                  </tbody>
                </table>
                </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<!--- FOOTER --->
<?php
    require_once('../layout/footer.php');
  ?>
<!--- /.FOOTER --->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../plugins/jszip/jszip.min.js"></script>
<script src="../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": []
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>
