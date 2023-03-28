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
            <h1>Pengurusan Kelas</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Pengurusan kelas</li>
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

        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM maklumat_murid
                where id_tingkatan='1'
                AND id_status='1'
                ");
                $jumlahpelajar=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-info">
              <div class="inner">
              <h3><?php echo $jumlahpelajar;?></h3>

                <p>Tingkatan 1</p>
              </div>
              <div class="icon">
                <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM maklumat_murid
                where id_tingkatan='2'
                ");
                $jumlahpelajar2=mysqli_num_rows($query);
            ?>
            <div class="small-box bg-info">
              <div class="inner">
              <h3><?php echo $jumlahpelajar2;?></h3>

                <p>Tingkatan 2</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM maklumat_murid
                where id_tingkatan='3'
                ");
                $jumlahpelajar3=mysqli_num_rows($query);
            ?>

            <div class="small-box bg-info">
              <div class="inner">
              <h3><?php echo $jumlahpelajar3;?></h3>

                <p>Tingkatan 3</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM maklumat_murid
                where id_tingkatan='4'
                ");
                $jumlahpelajar4=mysqli_num_rows($query);
            ?>

            <div class="small-box bg-success">
              <div class="inner">
              <h3><?php echo $jumlahpelajar4;?></h3>

                <p>Tingkatan 4</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <?php
                $query=mysqli_query($sambung,"SELECT id 
                FROM maklumat_murid
                where id_kelasLengkap='5'
                ");
                $jumlahpelajar5=mysqli_num_rows($query);
            ?>

            <div class="small-box bg-success">
              <div class="inner">
              <h3><?php echo $jumlahpelajar5;?></h3>

                <p>Tingkatan 5</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>53<sup style="font-size: 20px">%</sup></h3>

                <p>Tingkatan 6A</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>44</h3>

                <p>Tingkatan 6B</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>65</h3>

                <p>PPKI</p>
              </div>
              <div class="icon">
              <i class="fas fa-user-graduate"></i>
              </div>
            </div>
          </div>

            </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>KELAS</th>
                        <th>PAPARAN</th>
                        <th>TINDAKAN</th>
                        <th>PUKAL</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                            $i = 1; 
                            $query = "SELECT c.fullname, b.keterangan, d.jenis_sesi, a.id_kelasLengkap
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
                        <td><b><?= $baca['keterangan']; ?></b></td>
                        <td><a href="senarai-kelas-lengkap.php?id=<?= $baca['id_kelasLengkap']; ?>" class="btn btn-info btn-sm">Lihat Kelas</a></td>
                        <td><a href="senarai-kemaskini-kelas.php?id=<?= $baca['id_kelasLengkap']; ?>" class="btn btn-warning btn-sm">Kemaskini Individu</a></td>
                        <td><a href="senarai-kemaskini-kelas-pukal.php?id=<?= $baca['id_kelasLengkap']; ?>" class="btn btn-primary btn-sm">Kemaskini Pukal</a></td>
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
