<?php
    session_start();

    require_once('../panggil-database.php');

  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | SPDS</title>

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
  <link rel="stylesheet" href="../plugins//sweetalert2/sweetalert2.min.css">
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
    require_once('../layout/menu-tepi-admin.php');
  ?>
  <!-- /.Main Sidebar Container -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Senarai Guru Kelas</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Guru Kelas</li>
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
              <div class="card-header">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">
                  Tambah Guru Kelas
                </button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>NAMA GURU</th>
                        <th>KELAS</th>
                        <th>SESI</th>
                        <th>STATUS</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                            $i = 1; 
                            $query = "SELECT c.fullname, b.keterangan, d.jenis_sesi
                            FROM guru_kelas AS a
                            INNER JOIN kelas_lengkap AS b
                            ON b.id=a.id_kelasLengkap
                            INNER JOIN pengguna AS c
                            ON c.id=a.id_pengguna
                            INNER JOIN sesi AS d
                            ON d.id=a.id_sesi
                            ORDER BY b.keterangan ASC";
                            $query_run = mysqli_query($sambung, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $baca)
                                {
                                    ?>
                      <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?= $baca['fullname']; ?></td>
                        <td><?= $baca['keterangan']; ?></td>
                        <td><?= $baca['jenis_sesi']; ?></td>
                        <td>
                         <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-lg-edit">Edit</button>
                         <!--- <a href="edit-pengguna.php?id=<?= $baca['id']; ?>" class="btn btn-success btn-sm">Edit</a>  --->
                          <form action="../delete/delete-guru-kelas.php" method="POST" class="d-inline">
                            <button type="submit" name="delete-guru-kelas" value="<?=$baca['id'];?>" class="btn btn-danger btn-sm">Padam</button>
                          </form>
                        </td>
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
    
    <!-- /.modal -->

      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Tambah Guru Kelas</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form method="get" action="../add/tambah-guru-kelas.php">
            <div class="modal-body">
            <div class="form-row">
              <div class="col">
                <select name="id_pengguna" id="id_pengguna" class="form-control" required>
                  <option value="">Pilih Guru</option>
                  <?php
                                                $sn1 = "SELECT id, fullname
                                                        FROM pengguna
                                                        WHERE role='2'
                                                        AND status='1'
                                                        ORDER BY fullname ASC
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['fullname'];?> </option>
                  <?php
                                                }
                                            ?>
                </select>
              </div>
              <div class="col">
              <select name="id_kelasLengkap" id="id_kelasLengkap" class="form-control"required>
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
              </div>
              <div class="col">
                <select name="id_sesi" id="id_sesi" class="form-control"required>
                  <option value="">Pilih Sesi</option>
                  <?php
                                                $sn1 = "SELECT id, jenis_sesi
                                                        FROM sesi
                                                        WHERE id_status='1'
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_sesi'];?> </option>
                  <?php
                    }
                  ?>
                </select>              </div>
            </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
              <button type="submit" class="btn btn-primary" onclick="tambah_pengguna()" >Tambah Guru Kelas</button>
            </div>
          </div>
          </form>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
          <!-- modal edit-->

      <div class="modal fade" id="modal-lg-edit">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Kemaskini Guru Kelas</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form method="get" action="../edit/guru_kelas.php">
            <div class="modal-body">
            <div class="form-row">
              <div class="col">
                <select name="fullname" id="fullname" class="form-control" required>
                  <option value="">Pilih Guru</option>
                  <?php
                                                $sn1 = "SELECT id, fullname
                                                        FROM pengguna
                                                        WHERE role='2'
                                                        AND status='1'
                                                        ORDER BY fullname ASC
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                  <option value="<?php echo $rw1['fullname'];?>"> <?php echo $rw1['fullname'];?> </option>
                  <?php
                                                }
                                            ?>
                </select>
              </div>
              <div class="col">
              <select name="id_kelasLengkap" id="id_kelasLengkap" class="form-control"required>
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
              </div>
              <div class="col">
                <select name="jenis_sesi" id="jenis_sesi" class="form-control"required>
                <option value="">Pilih Sesi</option>
                  <?php
                                                $sn1 = "SELECT id, jenis_sesi
                                                        FROM sesi
                                                        WHERE id_status='1'
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_sesi'];?> </option>
                  <?php
                    }
                  ?>
                </select>              </div>
            </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
              <button type="submit" class="btn btn-primary" >Kemaskini Guru Kelas</button>
            </div>
          </div>
          </form>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal edit -->

      
      
      
      
      
      
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
<!-- sweetalert2 -->
<script src="../plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "excel", "pdf", "print",]
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
<script>
  function tambah_pengguna(){
   // alert('OK');
   //window.location=("..add/tambah-guru-kelas.php?id=");
   Swal.fire(
  'BERJAYA!',
  'Data Ditambah!',
  'success'
)
  }
</script>
</body>
</html>
