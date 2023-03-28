<?php
    session_start();
    require_once('../panggil-database.php');
  ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | Daftar Murid</title>

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
    <!-- /.Main Sidebar Container -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Daftar Guru Baharu</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
                <li class="breadcrumb-item active">Daftar</li>
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
              <div class="col-md-8">
                <!-- form start -->
                <div class="card-body">
                  <form action="../add/tambah-guru-baru.php" method="post">
                    <div class="form-group">
                      <label for="nama murid">Nama Penuh Guru</label>
                      <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Huruf Besar" required>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label>No Kad Pengenalan</label>
                          <input type="text" class="form-control" name="username" placeholder="" required>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <div class="form-group">
                            <label for="password">Katalaluan</label>
                            <input type="text" class="form-control" name="password" id="password" placeholder="password" required>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label>Email</label>
                          <input type="text" class="form-control" name="email" placeholder="" required>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label>Gred Jawatan</label>
                          <select class="form-control" name="gred" required>
                            <?php
                              $sql1 = "SELECT * FROM gred ORDER BY jenis_gred";
                              $qry1 = mysqli_query($sambung, $sql1);
                              
                              while ($row1 = mysqli_fetch_assoc($qry1)) {
                                  ?>
                            <option value="<?php echo $row1['id']; ?>"><?php echo $row1['jenis_gred']; ?></option>
                            <?php
                              }
                              ?>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label>Jawatan Guru</label>
                          <select class="form-control" name="jawatan" required>
                            <?php
                              $sql1 = "SELECT * FROM jawatan ORDER BY jenis_jawatan";
                              $qry1 = mysqli_query($sambung, $sql1);
                              
                              while ($row1 = mysqli_fetch_assoc($qry1)) {
                                  ?>
                            <option value="<?php echo $row1['id']; ?>"><?php echo $row1['jenis_jawatan']; ?></option>
                            <?php
                              }
                              ?>
                          </select>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label>No Telefon</label>
                          <input type="text" class="form-control" name="contactno" placeholder="" required>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="row">
                  <div class="col-sm-6">
                    <!-- select -->
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-user-plus"></i> Daftar Guru Baru</button>
            </div>
            </form>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
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
    $(function() {
      $("#example1").DataTable({
        "responsive": true,
        "lengthChange": false,
        "autoWidth": false,
        "buttons": ["copy", "excel", "pdf", "print", ]
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