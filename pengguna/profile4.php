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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<style media="screen">
    .upload{
      width: 140px;
      position: relative;
      margin: auto;
      text-align: center;
    }
    .upload img{
      border-radius: 50%;
      border: 8px solid #DCDCDC;
      width: 125px;
      height: 125px;
    }
    .upload .rightRound{
      position: absolute;
      bottom: 0;
      right: 0;
      background: #00B4FF;
      width: 32px;
      height: 32px;
      line-height: 33px;
      text-align: center;
      border-radius: 50%;
      overflow: hidden;
      cursor: pointer;
    }
    .upload .leftRound{
      position: absolute;
      bottom: 0;
      left: 0;
      background: red;
      width: 32px;
      height: 32px;
      line-height: 33px;
      text-align: center;
      border-radius: 50%;
      overflow: hidden;
      cursor: pointer;
    }
    .upload .fa{
      color: white;
    }
    .upload input{
      position: absolute;
      transform: scale(2);
      opacity: 0;
    }
    .upload input::-webkit-file-upload-button, .upload input[type=submit]{
      cursor: pointer;
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
        if (($_SESSION['role'] == 1) || ($_SESSION['role'] == 3)){
        ?>
            <!-- Profile Image -->
            <?php
                    if ($_SESSION['role'] == 3) {
                      $panggil = "SELECT *
                      FROM maklumat_murid AS a
                      INNER JOIN pengguna AS b
                      ON b.id=a.id_pengguna
                      INNER JOIN kelas_lengkap AS c
                      ON c.id=a.id_kelasLengkap
                      INNER JOIN jantina AS d
                      ON d.id=a.id_jantina
                      INNER JOIN kelab_persatuan AS e
                      ON e.id=a.id_kelabP
                      INNER JOIN sukan_permainan AS f
                      ON f.id=a.id_sukanP
                      INNER JOIN unit_uniform AS g
                      ON g.id=a.id_uniform
                      INNER JOIN rumah_sukan AS h
                      ON h.id=a.id_rumah_sukan
                      INNER JOIN kaum AS j
                      ON j.id=a.id_kaum
                      inner join agama as k
                      on k.id=a.id_agama
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
                <form class="form" id = "form" action="" enctype="multipart/form-data" method="post">
                  <input type="hidden" name="id" value="<?php echo $$baca['id']; ?>">
                  <div class="upload">
                    <img src="../dist/img/profile/<?php echo $baca['image']; ?>" id = "image">
                    

                    <div class="rightRound" id = "upload">
                      <input type="file" name="fileImg" id = "fileImg" accept=".jpg, .jpeg, .png">
                      <i class = "fa fa-camera"></i>
                    </div>

                    <div class="leftRound" id = "cancel" style = "display: none;">
                      <i class = "fa fa-times"></i>
                    </div>
                    <div class="rightRound" id = "confirm" style = "display: none;">
                      <input type="submit">
                      <i class = "fa fa-check"></i>
                    </div>
                  </div>
                </form>
                <script type="text/javascript">
                  document.getElementById("fileImg").onchange = function(){
                    document.getElementById("image").src = URL.createObjectURL(fileImg.files[0]); // Preview new image

                    document.getElementById("cancel").style.display = "block";
                    document.getElementById("confirm").style.display = "block";

                    document.getElementById("upload").style.display = "none";
                  }

                  var userImage = document.getElementById('image').src;
                  document.getElementById("cancel").onclick = function(){
                    document.getElementById("image").src = userImage; // Back to previous image

                    document.getElementById("cancel").style.display = "none";
                    document.getElementById("confirm").style.display = "none";

                    document.getElementById("upload").style.display = "block";
                  }
                </script>
                    <?php
                      if(isset($_FILES["fileImg"]["name"])){
                        $id_pengguna = $_POST["id"];

                        $src = $_FILES["fileImg"]["tmp_name"];


                        //$imageName = uniqid() . $_FILES["fileImg"]["name"];
                        $imageName = $_FILES["fileImg"]["name"];

                        $target = "../dist/img/profile/" . $imageName;

                        move_uploaded_file($src, $target);

                        //echo $target;
                        //echo 'ID Sekarang: ' . $_SESSION['id'];
                        //exit;

                        $query = "UPDATE maklumat_murid SET image = '$imageName' WHERE id_pengguna = " . $_SESSION['id'];

                        //echo $query;
                        mysqli_query($sambung, $query);

                        //header("Location: profile2.php");
                        //header("refresh: 0; url=profile2.php");
                        
                        echo "<script type='text/javascript'>
                              window.location='profile4.php'
                              </script>";

                      }
                    ?>

                <!--  <img class="profile-user-img img-fluid img-circle"
                       src="<?php //echo (!empty($baca['image']) ? '../dist/img/profile/'.$baca['image'] : '../dist/img/profile/avatardefault.png'); ?>" width="50" class="img-circle elevation-2" alt="User Image"> --->
                       
                </div>

                <h3 class="profile-username text-center"><?php echo $_SESSION['fullname'];?></h3>
                <a href="profile-up2.php" ><p class="text-muted text-center">Kemaskini Profile</p></a>
                
                <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> Kelas</strong>
                <a class="float-right"><?= $baca['keterangan']; ?></a>
                <hr>
                <strong><i class="fas fa-restroom"></i> Jantina</strong>
                <a class="float-right"><?= $baca['jenis_jantina']; ?></a>
                <hr>
                <strong><i class="fas fa-envelope"></i> Email</strong>
                <a class="float-right"><?= $baca['email']; ?></a>
              </div>
                 <!--- <li class="list-group-item">
                    <b>Guru Kelas</b> <a class="float-right">#</a>
                  </li> --->
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <?php } ?>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-warning">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                <!--  <li class="nav-item"><a class="nav-link active" href="#Kurikulum" data-toggle="tab">Kurikulum</a></li> --->
                  <li class="nav-item"><a class="nav-link" href="#HEM" data-toggle="tab">HEM</a></li>
                  <li class="nav-item"><a class="nav-link" href="#Kokurikulum" data-toggle="tab">Kokurikulum</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="Kurikulum">
                  <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-4 col-form-label">Kelab & Persatuan</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['nama_kelabP']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-4 col-form-label">Sukan & Permainan</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['jenis_sukanP']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-4 col-form-label">Unit Beruniform</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['jenis_uniform']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-4 col-form-label">Rumah Sukan</label>
                        <div class="col-sm-10">
                        <input class="form-control"  placeholder="<?= $baca['jenis_rumah']; ?>">
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="HEM">
                    <!-- The timeline -->
                      <!-- timeline time label -->
                      <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-4 col-form-label">Alamat</label>
                        <div class="col-sm-10">
                           <input class="form-control"  placeholder="<?= $baca['alamat']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-4 col-form-label">Agama</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['keterangan_agama']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-4 col-form-label">Kaum</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['jenis_kaum']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-4 col-form-label">OKU</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['oku']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-4 col-form-label">Asrama</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['asrama']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-4 col-form-label">Yatim</label>
                        <div class="col-sm-10">
                        <input class="form-control"  placeholder="<?= $baca['yatim']; ?>">
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
<!--------------------- kokurikulum ------------------------>
                  <div class="tab-pane" id="Kokurikulum">
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Kelab Persatuan</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['nama_kelabP']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Sukan Permainan</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['jenis_sukanP']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Unit Beruniform</label>
                        <div class="col-sm-10">
                          <input class="form-control"  placeholder="<?= $baca['jenis_uniform']; ?>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-4 col-form-label">Rumah Sukan</label>
                        <div class="col-sm-10">
                        <input class="form-control"  placeholder="<?= $baca['jenis_rumah']; ?>">
                        </div>
                      </div>
                    </form>
                  </div>
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
