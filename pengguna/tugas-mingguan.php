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
    require_once('../layout/menu-tepi-guru.php');
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>LAPORAN GURU BERTUGAS MINGGUAN</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Bertugas</li>
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

        <!-- bahagian 1-->
        <div class="row">
          <!-- Boleh tambah apa2 kat sini --->
        </div>
         <!-- bahagian 2-->
        <div class="row">
           <!-- Boleh tambah apa2 kat sini --->
        </div>

              <!-- /.card-header -->
            <div class="card-body">

              <form method="post" name="submit" onsubmit="return checkpass();" enctype="multipart/form-data">

              <div class="mb-3 row">
                  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Minggu :</label>
                  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                  <select name="minggu" id="minggu" class="form-control">
                    <option value="">Sila pilih</option>
                    <?php
                                                  $sn1 = "SELECT *
                                                          FROM minggu
                                                          WHERE id_status=1";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                    <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['minggu'];?> </option>
                    <?php
                                                  }
                                              ?>
                  </select>
                        </div>
                    </div>


                <div class="mb-3 row">
                      <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Tarikh Laksana :</label>
                      <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10 mb-3">
                      <input class="form-control" id="tarikh" name="tarikh" type="date" placeholder="" required />
                  </div>
                  </div>

                  <div class="mb-3 row">
                  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Unit / Bidang :</label>
                  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                  <select name="unit" id="unit" class="form-control">
                    <option value="">Sila pilih</option>
                    <?php
                                                  $sn1 = "select *
                                                          from tb3_unitopr
                                                          ";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                    <option value="<?php echo $rw1['unitOPR'];?>"> <?php echo $rw1['unitOPR'];?> </option>
                    <?php
                                                  }
                                              ?>
                  </select>
                        </div>
                    </div>


<!--   <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Unit / Bidang :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
      <input class="form-control" id="unit" name="unit" type="text" placeholder="" style="" required />
    </div>
  </div> -->
 
  <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Program / Aktiviti :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
      <input class="form-control" id="program" name="program" type="text" placeholder="" required />
    </div>
  </div>

  <div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Personalia :</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
  <select name="personalia" id="personalia" class="form-control">
    <option value="">Sila pilih</option>
    <?php
                                  $sn1 = "SELECT fullname
                                          from pengguna
                                          WHERE status='1' AND role='2'
                                          order by fullname asc";
                                  $rsn1 = mysqli_query($sambung, $sn1);
                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                              ?>
    <option value="<?php echo $rw1['fullname'];?>"> <?php echo $rw1['fullname'];?> </option>
    <?php
                                  }
                              ?>
  </select>
</div>
</div>
  
<!--  <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Personalia :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
      <input class="form-control" id="personalia" name="personalia" type="text" placeholder="" required />
    </div>
  </div> -->
  
  <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Kumpulan Sasaran :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
      <input class="form-control" id="kumpulan" name="kumpulan" type="text" placeholder="" required />
    </div>
  </div>


  <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Fokus / Objektif :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10 mb-3">
      <input class="form-control" id="objektif" name="objektif" type="text" placeholder="" style="" required />
      <input class="form-control" id="objektifDummy" name="objektifDummy" type="hidden" placeholder="" required /><!-- pakai input ni untuk save-->
    </div>
  </div>

  <div class="mb-3 row">
    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Impak Program :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10 mb-3">
      <input class="form-control" id="impak" name="impak" type="text" placeholder="" style="" required />
      <input class="form-control" id="impakDummy" name="impakDummy" type="hidden" placeholder="" required /><!-- pakai input ni untuk save-->
    </div>
  </div>

  <div class="mb-3 row">   
<label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Isu / Maklumbalas :</label>
<div class="col-sm-7 col-md-8 col-lg-9 col-xl-10 mb-3">
<input class="form-control" id="isu" name="isu" type="text" placeholder="" required /><!-- basically input ni xpkai..just untuk papar ck editor je-->
<input class="form-control" id="isuDummy" name="isuDummy" type="hidden" placeholder="" required /><!-- pakai input ni untuk save-->

<div class="mb-2 row">  
<label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Gambar 1 :</label>
<input type="file" name="gambar1" required> <br><br>
</div>

<div class="mb-2 row">  
<label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Gambar 2 :</label>
<input type="file" name="gambar2" required> <br><br>
</div>

<div class="mb-2 row">  
<label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Gambar 3 :</label>
<input type="file" name="gambar3" required> <br><br>
</div>



    <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Disediakan oleh :</label>
    <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10 mb-3">
      <?php //var_dump($_SESSION); ?>
      <input value="<?php echo $_SESSION['fullname']; ?>" class="form-control" id="fullname" name="fullname" type="text" placeholder="" readonly /> 
    </div>
    <td colspan="4" style="text-align:center ;"><button type="submit" class="btn btn-primary btn-block" name="submit">Hantar Laporan Aktiviti</button></td>

  </div>
</div>
</div>
</div>
</div>
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
