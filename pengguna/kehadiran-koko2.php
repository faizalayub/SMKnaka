<?php
    session_start();

    require_once('../panggil-database.php');

    if (isset($_GET['n'])){
      $n = $_GET['n'];
  } else {
      $n = 0;
  }
  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | SPDS KOKU</title>

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
            <h1>Senarai Kehadiran Aktiviti Kokurikulum</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Kehadiran Koku</li>
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
              <form action="" class="form-group" method="post">
                  <div class="row">
                    <div class="col-md-10">
                      <?php
                        // paparkan cuma tahun
                        $sn2 = "SELECT tahun FROM kehadiran_koko
                        GROUP BY tahun
                        ORDER BY tahun DESC";
                        $rsn2 = $sambung->query($sn2);

                    ?>
                      <label for="">Carian Mengikut Tahun</label>
                      <select name="carian" id="" class="form-control">
                        <option value=""> </option>
                        <?php
                            while ($rwn1 = $rsn2->fetch_assoc()) {
                        ?>
                        <option value="<?php echo $rwn1['tahun']; ?>"> <?php echo $rwn1['tahun']; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="col-md-2">
                      <br><br>
                   <!---   <button class="btn btn-primary" type="submit" name="btnSaring" style="margin-top:5px;">
                        Saring
                      </button> -->
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-10">
                      <?php
                        // paparkan bulan
                        $sn2 = "SELECT id,kategori_koko
                        FROM kokurikulum ";
                        $rsn2 = $sambung->query($sn2);

                    ?>
                      <label for="">Kategori Kokurikulum</label>
                      <select name="carian" id="" class="form-control">
                        <option value=""> </option>
                        <?php
                            while ($rwn1 = $rsn2->fetch_assoc()) {
                        ?>
                        <option value="<?php echo $rwn1['id']; ?>"> <?php echo $rwn1['kategori_koko']; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                    <div >
                      <br>
                     <button class="btn btn-primary" type="submit" name="btnSaring" style="margin-top:5px;">
                        Saring
                      </button> 
                    </div>
                  </div>
                </form>

              </div>
              <!-- /.card-header -->
              <div class="card-body">
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card-body">
            
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
