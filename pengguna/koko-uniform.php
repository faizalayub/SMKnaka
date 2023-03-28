<?php
    session_start();

    require_once('../panggil-database.php');

  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | Unit Beruniform</title>

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
            <h1>Senarai Ahli Beruniform</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Badan Uniform</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='3'
                                                AND id_status ='1'");
                                $jumlahpelajar=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-primary">
              <div class="inner">
                <p>KADET POLIS</p>
              </div>
              <a href="lapor-koko-kadet-polis.php" class="small-box-footer">
                <img src="../dist/img/koko/kadetpolis.png" alt="" width="100" height="100"></i><h3>
                  <?php echo $jumlahpelajar;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='4'
                                                AND id_status ='1'");
                                $jumlahpelajar1=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-success">
              <div class="inner">
                <p>KADET REMAJA SEKOLAH</p>
              </div>
              <a href="lapor-koko-kadet-krs.php" class="small-box-footer"><img src="../dist/img/koko/krs.png" alt="" width="100" height="100"></i><h3><?php echo $jumlahpelajar1;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='2'
                                                AND id_status ='1'");
                                $jumlahpelajar2=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-orange">
              <div class="inner">
                <p>KADET BOMBA & PENYELAMAT</p>
              </div>
              <a href="lapor-koko-kadet-polis.php" class="small-box-footer"><img src="../dist/img/koko/bomba.png" alt="" width="80" height="100"></i><h3><?php echo $jumlahpelajar2;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='6'
                                                AND id_status ='1'");
                                $jumlahpelajar3=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-secondary">
              <div class="inner">
                <p>PENGAKAP</p>
              </div>
              <a href="lapor-koko-kadet-polis.php" class="small-box-footer"><img src="../dist/img/koko/pengakap.png" alt="" width="100" height="100"></i><h3><?php echo $jumlahpelajar3;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
        </div>

                <!-- Small boxes (Stat box) -->
                <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='5'
                                                AND id_status ='1'");
                                $jumlahpelajar4=mysqli_num_rows($query);
            ?>
                <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-fuchsia">
              <div class="inner">
                <p>PUTERI ISLAM</p>
              </div>
              <a href="lapor-koko-kadet-polis.php" class="small-box-footer"><img src="../dist/img/koko/pislam.png" alt="" width="100" height="100"></i><h3><?php echo $jumlahpelajar4;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
          <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='7'
                                                AND id_status ='1'");
                                $jumlahpelajar5=mysqli_num_rows($query);
            ?>
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <p>SILAT GAYONG</p>
              </div>
              <a href="lapor-koko-kadet-krs.php" class="small-box-footer"><img src="../dist/img/koko/silat.png" alt="A description of the image" width="100" height="100"></i><h3><?php echo $jumlahpelajar5;?></h3></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='1'
                                                AND id_status ='1'");
                                $jumlahpelajar6=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-danger">
              <div class="inner">
                <p>BULAN SABIT MERAH</p>
              </div>
              <a href="lapor-koko-kadet-krs.php" class="small-box-footer"><img src="../dist/img/koko/bsmm.png" alt="" width="100" height="100"></i><h3><?php echo $jumlahpelajar6;?></h3></a>
            </div>
            </div>

            <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='100'
                                                AND id_status ='1'");
                                $jumlahpelajar7=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-indigo">
              <div class="inner">
                <p>MURID TIADA UNIT</p>
              </div>
              <a href="lapor-koko-kadet-krs.php" class="small-box-footer"><img src="../dist/img/koko/kemaskini.png" alt="" width="100" height="100"></i><h3><?php echo $jumlahpelajar7;?></h3></a>
            </div>
            </div>
            </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- card -->
            <div class="card">
              <div class="card-header">
              <?php
                $query=mysqli_query($sambung,"SELECT id FROM maklumat_murid
                                              WHERE id_uniform='100'
                                                AND id_status ='1'");
                                $jumlahpelajar7=mysqli_num_rows($query);
            ?>
              <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-info"><img src="../dist/img/koko/kemaskini.png" alt="" width="50" height="50"></span>

              <div class="info-box-content">
                <span class="info-box-text">Kadet Polis</span>
                <span class="info-box-number"><h3><?php echo $jumlahpelajar7;?></h3></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                  <tr>
                <th>#</th>
                <th>Nama Murid</th>
                <th>NO IC</th>
                <th>Kelas</th>
                <th>Uniform</th>
              </tr>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                            $i = 1; 
                            $query = "SELECT b.fullname, a.id_pengguna, a.id_kelabP, a.id_kelasLengkap, c.keterangan, e.jenis_uniform, b.`status`, b.role, b.username 
                            FROM maklumat_murid AS a
                            INNER JOIN pengguna AS b
                            ON b.id=a.id_pengguna
                            INNER JOIN kelas_lengkap AS c
                            ON c.id=a.id_kelasLengkap
                            INNER JOIN unit_uniform AS e
                            ON e.id=a.id_kelabP
                            WHERE status='1'
                            AND role='3'
                            ORDER BY id_kelasLengkap ASC";
                            $query_run = mysqli_query($sambung, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $baca)
                            {
            ?>
             <tr>
                <td><?php echo $i++; ?></td>
                <td><?= $baca['fullname']; ?></td>
                <td><?= $baca['username']; ?></td>
                <td><?= $baca['keterangan']; ?></td>
                <td><?= $baca['jenis_uniform']; ?></td> 
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
