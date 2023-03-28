<?php
    session_start();

    require_once('../panggil-database.php');

  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PROUD | Minit Curai</title>

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
            <h1>Minit Curai</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item"><a href="minit-curai.php">Minit Curai</a></li>
              <li class="breadcrumb-item active">Lihat</li>
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
              <marquee behavior="scroll" direction="up" scrollamount="1"
    onmouseover="this.stop();"
    onmouseout="this.start();">
    <?php
        $id = $_GET['id'];
        $query = mysqli_query($sambung, "SELECT a.id, a.tajuk, a.tarikh, a.masa, a.tempat, a.pegawai, a.kandungan, a.id_pengguna, b.id, b.fullname  
                                        FROM tb_minitcurai AS a
                                        INNER JOIN pengguna AS b
                                        ON b.id=a.id_pengguna 
                                        WHERE a.id='$id'");
        while ($result = mysqli_fetch_array($query)) {
            echo "<h4 class='mt-4'>Tajuk : " . $result['tajuk'] . "</h4>";
        }
    ?>
</marquee>


              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <?php 
                  $id=$_GET['id'];
                  $query=mysqli_query($sambung,"SELECT a.id, a.tajuk, a.tarikh, a.masa, a.tempat, a.pegawai, a.kandungan, a.id_pengguna, b.id, b.fullname  
                                          FROM tb_minitcurai AS a
                                          INNER JOIN pengguna AS b
                                          ON b.id=a.id_pengguna 
                                          where a.id='$id'");
                  while($result=mysqli_fetch_array($query))
                  {?>
                        <h4 class="mt-4">Tajuk : <?php echo $result['tajuk'];?></h4>
                        <div class="card mb-4">
                     
                            <div class="card-body">
                                <table class="table table-bordered">
                                   <tr>
                                    <th>Tarikh</th>
                                    <td><?php echo date('d-m-Y', strtotime($result['tarikh'])); ?></td>
                                   </tr>
                                   <tr>
                                       <th>Masa</th>
                                       <td><?php echo $result['masa'];?></td>
                                   </tr>
                                   <tr>
                                       <th>Tajuk</th>
                                       <td colspan="3"><?php echo $result['tajuk'];?></td>
                                   </tr>
                                     <tr>
                                       <th>Tempat</th>
                                       <td colspan="3"><?php echo $result['tempat'];?></td>
                                   </tr>
                                      
                                   <tr>
                                       <th>Pegawai Hadir</th>
                                       <td colspan="10"><?php echo $result['pegawai'];?></td>
                                   </tr>
                                     
                                   <tr>
                                       <th>Kandungan</th>
                                       <td colspan="10"><?php echo $result['kandungan'];?></td>
                                   </tr>
                                        <tr>
                                       <th>Guru Pelapor</th>
                                       <td colspan="3"><?php echo $result['fullname'];?></td>
                                   </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                      <?php } ?>


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
      "buttons": ["pdf", "print",]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
  });
</script>
</body>
</html>
