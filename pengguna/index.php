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
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
  <!--  <img class="animation__shake" src="../dist/img/logo.png" alt="AdminLTELogo" height="60" width="60">-->
    <img src="../dist/img/hello.gif" alt="" height="150" width="150">
  </div>

  <!-- Navbar -->
  <?php
    require_once('../layout/navbar.php');
  ?>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <?php
      if ($_SESSION['role'] < 1){
        echo 'Sila login untuk masuk ke page ini';
        header ('Refresh: 3; URL = ../index.php');
        exit;
      }

      if ($_SESSION['role'] == 2) {
        require_once('../layout/menu-tepi-guru.php');
      }
      
      if ($_SESSION['role'] == 3) {
        require_once('../layout/menu-tepi-murid.php');
      }

    ?>
  <!-- /.Main Sidebar Container -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard </li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                                                FROM pengguna
                                                WHERE role ='3'
                                                AND status ='1'");
                                $jumlahpelajar=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-info">
              <div class="inner">
                <h3><?php echo $jumlahpelajar;?></h3>

                <p>Jumlah Murid</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                                                FROM pengguna
                                                WHERE role ='2'
                                                AND status ='1'");
                                    $jumlahguru=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-success">
              <div class="inner">
                <h3><?php echo $jumlahguru;?></h3>

                <p>Jumlah Guru</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
              $query=mysqli_query($sambung,"SELECT id 
              FROM pengguna
              WHERE status ='1'");
              $jumlahpengguna=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><?php echo $jumlahpengguna;?></h3>

                <p>Jumlah Warga SMKN</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM pengguna
                WHERE role ='4'
                AND status ='1'");
                $jumlahakp=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-warning">
              <div class="inner">
                <h3><?php echo $jumlahakp;?></h3>

                <p>Jumlah AKP</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row --> 
        <?php
        if (($_SESSION['role'] == 1) || ($_SESSION['role'] == 2)){
        ?>
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-12 ">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-body">

              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
            <?php } ?>
            <!-- DIRECT CHAT -->
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <!-- Conversations are loaded here -->
                <iframe src="https://calendar.google.com/calendar/embed?src=unitkosmkn%40gmail.com&ctz=Asia%2FKuala_Lumpur" style="border: 0" width="100%" height="600" frameborder="0" scrolling="no"></iframe>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              </div>
              <!-- /.card-footer-->
            </div>
          </section>
          <section class="col-lg-14">
              </div>
            </div>

                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
            </div>
            <!-- /.card -->
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
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
<!-- jQuery UI 1.11.4 -->
<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="../plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="../plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard.js"></script>
</body>
</html>
