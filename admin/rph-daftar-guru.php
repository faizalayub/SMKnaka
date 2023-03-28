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
            <h1>Senarai Subjek</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Senarai Subjek</li>
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
              <form action="../add/tambah-guru-subjek.php" method="post">
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
                                              ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['fullname'];?> </option>
                            <?php
                                                  }
                                              ?>
                          </select>
                    </div>
                    <div class="form-group">
                      <label for="nama murid">Kelas</label>
                      <select name="id_kelas" id="kelas" class="form-control">
                            <?php
                                                  $sn1 = "SELECT id, keterangan
                                                  FROM kelas_lengkap
                                                  ORDER BY keterangan ASC";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['keterangan'];?> </option>
                            <?php
                                                  }
                                              ?>
                          </select>   
                    </div>
                    <div class="form-group">
                      <label for="subjek">Subjek</label>
                      <select name="id_subjek" id="subjek" class="form-control">
                            <?php
                                                  $sn1 = "SELECT *
                                                  FROM rph_subjek
                                                  ORDER BY subjek ASC";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['subjek'];?> </option>
                            <?php
                                                  }
                                              ?>
                          </select>                    </div>
                </div>
              </div>
            <div class="col-lg-3">
              <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-user-plus"></i> Daftar Guru Subjek Baru</button>
            </div>
            </form>
                </button></a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>#</th>
                    <th>Nama Guru</th>
                    <th>Kelas</th>
                    <th>Subjek</th>
                    <th>Tindakan</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                            $i = 1; 
                            $query = "SELECT a.id, b.fullname, c.keterangan, d.subjek 
                            FROM rph_guru_subjek AS a
                            INNER JOIN pengguna AS b
                            ON b.id=a.id_pengguna
                            INNER JOIN kelas_lengkap AS c
                            ON c.id=a.id_kelas
                            INNER JOIN rph_subjek AS d
                            ON d.id=a.id_subjek
                            ORDER BY id_pengguna ASC";
                            
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
                        <td><?= $baca['subjek']; ?></td>
                        <td>
                        <a href="update-guru-subjek.php?id=<?= $baca['id']; ?>" class="btn btn-info btn-sm">Edit</a>
                        <a href="../delete/delete-guru-subjek.php?id=<?= $baca['id']; ?>" class="btn btn-danger btn-sm">Hapus</a>
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
</body>
</html>
