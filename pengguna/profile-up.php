<?php
    session_start();

    require_once('../panggil-database.php');

  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Proud | Profile Pengguna</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<style media="screen">
    .preview{
      display: block;
      width: 150px;
      height: 150px;
      border: 1px solid black;
      margin-top: 10px;
    }
  </style>
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
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.php">utama</a></li>
              <li class="breadcrumb-item active">Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

          <?php
        if (($_SESSION['role'] == 1) || ($_SESSION['role'] == 2)){
        ?>
            <!-- Profile Image -->
            <?php
                    if ($_SESSION['role'] == 2) {
                      $panggil = "SELECT *
                      FROM maklumat_guru AS a
                      INNER JOIN pengguna AS b
                      ON b.id=a.id_pengguna
                      INNER JOIN jawatan AS c
                      ON c.id=a.id_jawatan
                      INNER JOIN gred as d
                      ON d.id=a.id_gred
                      WHERE b.`status`=1 AND b.id=" . $_SESSION['id'] ;
                    } else {

                    }
                    $result = $sambung->query($panggil);
                    //print_r($_SESSION);exit();
                    while ($data = $result->fetch_assoc()){
                      $baca = $data;
                  ?>
    <?php } ?>

            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="<?php echo (!empty($baca['image']) ? '../dist/img/profile/'.$baca['image'] : '../dist/img/profile/avatardefault.png'); ?>" width="50" class="img-circle elevation-2" alt="User Image">
                       
                </div>

                <h3 class="profile-username text-center"><?php echo $_SESSION['fullname'];?></h3>

                <p class="text-muted text-center">Software Engineer</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Gred</b> <a class="float-right"><?= $baca['jenis_gred']; ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Jawatan</b> <a class="float-right"><?= $baca['jenis_jawatan']; ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Guru Kelas</b> <a class="float-right">#</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <?php } ?>
<!-------------------- untuk murid pula ------------------->
<?php
        if (($_SESSION['role'] == 1) || ($_SESSION['role'] == 3)){
        ?>
            <!-- Profile Image -->
            <?php
                    if ($_SESSION['role'] == 2) {
                      $panggil = "SELECT fullname, nama_tingkatan, nama_kelas
                      FROM maklumat_murid AS a
                      INNER JOIN pengguna AS b
                      ON b.id=a.id_pengguna
                      INNER JOIN tingkatan AS c
                      ON c.id=a.id_tingkatan
                      INNER JOIN kelas AS d
                      ON d.id=a.id_kelas
                      WHERE b.`status`=1 AND b.id=" . $_SESSION['id'] ;
                    } else {

                    }
                    $result = $sambung->query($panggil);
                    //print_r($_SESSION);exit();
                    while ($data = $result->fetch_assoc()){
                      $baca = $data;
                  ?>
    

            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="<?php echo (!empty($baca['image']) ? '../dist/img/profile/'.$baca['image'] : '../dist/img/profile/avatardefault.png'); ?>" width="50" class="img-circle elevation-2" alt="User Image">
                       
                </div>

                <h3 class="profile-username text-center"><?php echo $_SESSION['fullname'];?></h3>

                <!--<p class="text-muted text-center">Software Engineer</p>-->

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Tingkatan</b> <a class="float-right"><?= $baca['nama_tingkatan']; ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Kelas</b> <a class="float-right"><?php echo $baca['nama_kelas'];?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Friends</b> <a class="float-right">13,287</a>
                  </li>
                </ul>
                <?php } ?>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <?php } ?>
<!-------------------- /.untuk murid pula ------------------->
            <!-- About Me Box -->
            
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <a class="nav-link active">Kemaskini Gambar Profile</a>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="Kurikulum">
                  <style media="screen">
                    .preview{
                      display: block;
                      width: 200px;
                      height: 240px;
                      border: 1px solid black;
                      margin-top: 10px;
                    }
                  </style>
                    <!-- Post -->

    <form method = "post" action = "" enctype = "multipart/form-data">
      <input type="file" name="fileImg" id="fileImg">
      <div class = "preview">
        <img src="" id = "img" alt = "Preview" style = "width: 100%; height: 100%">
      </div>
      <br>
      <button type="button" onclick = "submitData();">Submit</button>
    </form>
                    <script type="text/javascript">
      // Preview
      fileImg.onchange = evt => {
        const [file] = fileImg.files
        if (file) {
          img.src = URL.createObjectURL(file)
        }
      }
      // Submit
      function submitData(){
        $(document).ready(function(){
          var formData = new FormData();
          var files = $('#fileImg')[0].files;
          formData.append('fileImg', files[0]);

          $.ajax({
            url: '../edit/edit-gambar.php',
            type: 'post',
            data: formData,
            contentType: false,
            processData: false,
            success:function(response){
              if(response == "Success"){
                alert("Successfully Added");
              }
              else if(response == "Invalid Extension"){
                alert("Invalid Extension");
              }
              else{
                alert("Sila Pilih Gambar");
              }
            }
          });
        });
      }
    </script>

                            <!-- /.col -->
                          </div>
                          <!-- /.row -->
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      

                    </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                

                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
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
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<script>
    $(function() {
      $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
      });
      $('#example1').DataTable({
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
<script>
    $(function() {
      $("#example2").DataTable({
        "responsive": true,
        "autoWidth": false,
      });
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
  <script>
    $(function() {
      $("#example3").DataTable({
        "responsive": true,
        "autoWidth": false,
      });
      $('#example3').DataTable({
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
