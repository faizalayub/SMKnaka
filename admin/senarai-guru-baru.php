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
            <h1>Senarai Guru</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
              <li class="breadcrumb-item active">Senarai Guru</li>
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
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>#</th>
                    <th>Nama Pengguna</th>
                    <th>Role</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                            $i = 1; 
                            $query = "SELECT * 
                            FROM pengguna AS a
                            INNER JOIN role AS b
                            ON b.id=a.role
                            WHERE status='9'
                            ";
                            $query_run = mysqli_query($sambung, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $baca)
                                {
                  ?>
                      <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?= $baca['fullname']; ?></td>
                        <td><?= $baca['role']; ?></td>
                        <td><div class="form-check">
                              <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">
                              KEMASKINI
                            </button>
                        </div>
                        </td>


                   <!---     <td> <form method="get" action="../edit/tukar-status.php">
                          <div class="modal-body">
                          <div class="form-row">
                            <div class="col">
                              <select name="status" id="status" class="form-control" >
                                <option value="">Pilih Kelas</option>
                                <?php
                                /*                            $sn1 = "SELECT id, jenis_status
                                                                      FROM status
                                                                      ";
                                                              $rsn1 = mysqli_query($sambung, $sn1);
                                                              while ($rw1 = mysqli_fetch_array($rsn1)){
                                                          ?>
                                <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_status'];?> </option>
                                <?php
                                                              }
                               */                           ?>
                              </select>
                            </div>
                          </div>
                          </div>
                        </td>  --->
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
  <?php
                            $i = 1; 
                            $query = "SELECT * 
                            FROM pengguna AS a
                            INNER JOIN role AS b
                            ON b.id=a.role
                            WHERE status='9'
                            ";
                            $query_run = mysqli_query($sambung, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $baca)
                                {
?>

<?php
                                }
                            }
                            else
                            {
                                echo "<h5> No Record Found </h5>";
                            }
?>
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Kemaskini Pengguna</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form>
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nama Pengguna</label>
                    <input class="form-control" placeholder="<?= $baca['fullname']; ?>">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Tingkatan</label>
                    <select name="nama_tingkatan" id="nama_tingkatan" class="form-control"required>
                  <option value="">Pilih</option>
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
                  <div class="form-group">
                    <label for="exampleInputPassword1">Unit Uniform</label>
                    <select name="jenis_uniform" id="jenis_uniform" class="form-control"required>
                  <option value="">Pilih</option>
                  <?php
                                                $sn1 = "SELECT id, jenis_uniform
                                                        FROM unit_uniform
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_uniform'];?> </option>
                  <?php
                    }
                  ?>
                </select>                  
                 </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Sukan Permainan</label>
                    <select name="jenis_sukanP" id="jenis_sukanP" class="form-control"required>
                  <option value="">Pilih</option>
                  <?php
                                                $sn1 = "SELECT id, jenis_sukanP
                                                        FROM sukan_permainan
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_sukanP'];?> </option>
                  <?php
                    }
                  ?>
                </select>   
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Kelab Persatuan</label>
                    <select name="nama_kelabP" id="nama_kelabP" class="form-control"required>
                  <option value="">Pilih</option>
                  <?php
                                                $sn1 = "SELECT id, nama_kelabP
                                                        FROM kelab_persatuan
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['nama_kelabP'];?> </option>
                  <?php
                    }
                  ?>
                </select>   
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Rumah Sukan</label>
                    <select name="jenis_rumah" id="jenis_rumah" class="form-control"required>
                  <option value="">Pilih</option>
                  <?php
                                                $sn1 = "SELECT id, jenis_rumah
                                                        FROM rumah_sukan
                                                        ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                   ?>
                  <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_rumah'];?> </option>
                  <?php
                    }
                  ?>
                </select>   

                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Gambar Profile</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                    <label class="form-check-label" for="exampleCheck1">Aktifkan</label>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer"></div>
              

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
          
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      </form>
      <!-- /.modal -->
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
