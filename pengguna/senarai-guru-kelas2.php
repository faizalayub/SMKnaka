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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <div class="preloader flex-column justify-content-center align-items-center">
      <img class="animation__shake" src="../dist/img/logo.png" alt="AdminLTELogo" height="60" width="60">
    </div>
    <?php
    require_once('../layout/navbar.php');
  ?>
    <?php
    require_once('../layout/menu-tepi-guru.php');
  ?>
    <div>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1>Senarai Guru</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="index.php">Utama</a></li>
                  <li class="breadcrumb-item active">Guru Kelas</li>
                </ol>
              </div>
            </div>
          </div>
        </section>
        <section class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg-new">Daftar Guru Kelas</button>
                  </div>
                  <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>SESI</th>
                          <th>NAMA GURU</th>
                          <th>KELAS</th>
                          <th>LIHAT</th>
                          <th>TUKAR</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                                    $i = 1; 
                                    $query = "SELECT c.fullname, b.keterangan, d.jenis_sesi, a.id_kelasLengkap, a.id
                                    FROM guru_kelas AS a
                                    INNER JOIN kelas_lengkap AS b
                                    ON b.id=a.id_kelasLengkap
                                    INNER JOIN pengguna AS c
                                    ON c.id=a.id_pengguna
                                    INNER JOIN sesi AS d
                                    ON d.id=a.id_sesi
                                    WHERE d.id_status=1
                                    ORDER BY b.keterangan ASC";
                                    $query_run = mysqli_query($sambung, $query);

                                    if(mysqli_num_rows($query_run) > 0)
                                    {
                                        foreach($query_run as $baca)
                                        {
                                            ?>
                        <tr>
                          <td><?php echo $i++; ?></td>
                          <td><?= $baca['jenis_sesi']; ?></td>
                          <td><?= $baca['fullname']; ?></td>
                          <td><?= $baca['keterangan']; ?></td>
                          <td><a href="senarai-kelas-lengkap.php?id=<?= $baca['id_kelasLengkap']; ?>" class="btn btn-info btn-sm">Lihat Kelas</a></td>
                          <td><button type="button" class="btn btn-warning" data-id="<?= $baca['id']; ?>" data-toggle="modal" data-target="#modal-lg-edit">Edit Guru</button></td>
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
                </div>
              </div>
            </div>
          </div>
        </section>

        <div class="modal fade" id="modal-lg-new">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">Daftar Guru Kelas Baru</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form method="post" action="../add/daftar-guru-kelas-baru.php">
                <div class="modal-body">
                  <div class="form-row">
                    <div class="col">
                      <select name="fullname" id="id_guru" class="form-control" required>
                        <option value="">Pilih Guru</option>
                        <?php
                                    $query1 = "SELECT id, fullname
                                    FROM pengguna
                    WHERE role='2'
                    AND status='1'
                    ORDER BY fullname ASC";
          $result1 = mysqli_query($sambung, $query1);
          while ($row1 = mysqli_fetch_array($result1)) {
            ?>
                        <option value="<?php echo $row1['id']; ?>"><?php echo $row1['fullname']; ?></option>
                        <?php
          }
          ?>
                      </select>
                    </div>
                    <div class="col">
                      <select name="kelas_lengkap" id="id_kelas" class="form-control" required>
                        <option value="">Pilih Kelas</option>
                        <?php
          $query1 = "SELECT *
                    FROM kelas_lengkap
                    ORDER BY keterangan ASC";
          $result1 = mysqli_query($sambung, $query1);
          while ($row1 = mysqli_fetch_array($result1)) {
            ?>
                        <option value="<?php echo $row1['id']; ?>"><?php echo $row1['keterangan']; ?></option>
                        <?php
          }
          ?>
                      </select>
                    </div>
                    <div class="col">
                      <select name="jenis_sesi" id="id_sesi" class="form-control" required>
                        <option value="">Pilih Sesi</option>
                        <?php
          $query2 = "SELECT id, jenis_sesi
                    FROM sesi
                    WHERE id_status='1'";
          $result2 = mysqli_query($sambung, $query2);
          while ($row2 = mysqli_fetch_array($result2)) {
            ?>
                        <option value="<?php echo $row2['id']; ?>"><?php echo $row2['jenis_sesi']; ?></option>
                        <?php
          }
          ?>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer justify-content-between">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                  <button type="submit" class="btn btn-primary">Daftar Guru Kelas</button>
                </div>
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

<!-- Modal Edit Guru Kelas -->
<div class="modal fade" id="modal-lg-edit">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Kemaskini Guru Kelas</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="../edit/kemaskini-guru-kelas.php">
        <div class="modal-body">
          <div class="form-row">
            <div class="col">
              <select name="fullname" id="id_guru" class="form-control" required>
                <option value="">Pilih Guru</option>
                <?php
                  $query1 = "SELECT id, fullname
                            FROM pengguna
                            WHERE role='2'
                            AND status='1'
                            ORDER BY fullname ASC";
                  $result1 = mysqli_query($sambung, $query1);
                  while ($row1 = mysqli_fetch_array($result1)) {
                ?>
                <option value="<?php echo $row1['id']; ?>"><?php echo $row1['fullname']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>
          <button type="submit" class="btn btn-primary">Kemaskini Guru Kelas</button>
        </div>
      </form>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->      

<?php
    require_once('../layout/footer.php');
  ?>
      <aside class="control-sidebar control-sidebar-dark"></aside>
    </div>
  </div>
  <script src="../plugins/jquery/jquery.min.js"></script>
  <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
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
  <script src="../dist/js/adminlte.min.js"></script>
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