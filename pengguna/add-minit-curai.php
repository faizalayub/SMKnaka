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
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css">
  <!-- CodeMirror -->
  <link rel="stylesheet" href="../plugins/codemirror/codemirror.css">
  <link rel="stylesheet" href="../plugins/codemirror/theme/monokai.css">
  <!-- SimpleMDE -->
  <link rel="stylesheet" href="../plugins/simplemde/simplemde.min.css">
</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
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
                <li class="breadcrumb-item active">Minit Curai</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
              <!-- /.card-header -->
                <form>
                      <div class="row">
                        <div class="col-sm-6">
                          <!-- text input -->
                          <div class="form-group">
                            <label>Tarikh</label>
                            <input type="date" class="form-control" placeholder="Tarikh">
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <div class="form-group">
                            <label>Masa</label>
                            <input type="time" class="form-control" placeholder="Masa">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-6">
                          <!-- text input -->
                          <div class="form-group">
                            <label>Tempat</label>
                            <input type="text" class="form-control" placeholder="Tarikh">
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <!-- textarea -->
                          <div class="form-group">
                            <label>Pegawai</label>
                            <input type="text" class="form-control" placeholder="Tarikh">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-12">
                          <!-- textarea -->
                          <div class="form-group">
                            <label>Tajuk</label>
                            <textarea class="form-control" rows="2" placeholder="Tajuk"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <h3 class="card-title">
                            <label>Kandungan Minit Curai</label>
                          </h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                          <textarea id="summernote" rows="20">
                          </textarea>
                        </div>
                        <!-- /.col-->
                      </div>
                  </div>
                    <button type="submit" class="btn btn-primary">Hantar Minit</button>
                </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!--/.col (left) -->
    </div>
    <!-- /.row -->
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
  <!-- Bootstrap 4 -->
  <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- bs-custom-file-input -->
  <script src="../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../dist/js/adminlte.min.js"></script>
  <!-- Summernote -->
  <script src="../plugins/summernote/summernote-bs4.min.js"></script>
  <!-- CodeMirror -->
  <script src="../plugins/codemirror/codemirror.js"></script>
  <script src="../plugins/codemirror/mode/css/css.js"></script>
  <script src="../plugins/codemirror/mode/xml/xml.js"></script>
  <script src="../plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
  <!-- Page specific script -->
  <script>
    $(function() {
      bsCustomFileInput.init();
    });
  </script>
  <!-- Page specific script -->
  <script>
    $(function() {
      // Summernote
      $('#summernote').summernote()
      // CodeMirror
      CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
        mode: "htmlmixed",
        theme: "monokai"
      });
    })
  </script>
</body>

</html>