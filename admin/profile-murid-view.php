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
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<style media="screen">
  .upload {
    width: 140px;
    position: relative;
    margin: auto;
    text-align: center;
  }

  .upload img {
    border-radius: 50%;
    border: 8px solid #DCDCDC;
    width: 125px;
    height: 125px;
  }

  .upload .rightRound {
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

  .upload .leftRound {
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

  .upload .fa {
    color: white;
  }

  .upload input {
    position: absolute;
    transform: scale(2);
    opacity: 0;
  }

  .upload input::-webkit-file-upload-button,
  .upload input[type=submit] {
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

      if ($_SESSION['role'] == 1) {
        require_once('../layout/menu-tepi-admin.php');
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
                <li class="breadcrumb-item"><a href="senarai-murid.php">Senarai Murid</a></li>
                <li class="breadcrumb-item active">Profile</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- sini -->
      <?php
      $muridId = null ;
      if(isset($_GET['id']) && $_GET['id'] != ''){
        $muridId = $_GET['id'];
      }else{
        exit("Invalid request");
      }
    ?>
      <!-- smpai sini -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-3">

              <?php
        ?>
              <!-- Profile Image -->
              <?php
                    if ($_SESSION['role'] == 1) {
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
                      WHERE b.`status`=1 AND b.id=" . $muridId ;//sini
                    } else {

                    }
                    $result = $sambung->query($panggil);
                    //print_r(mysqli_num_rows($result));exit();
                    if(mysqli_num_rows($result) < 1){
                      exit("Invalid user");
                    }
                    while ($data = $result->fetch_assoc()){
                      $baca = $data;
                  ?>
              <?php } ?>

              <div class="card card-primary card-outline">
                <div class="card-body box-profile">
                  <div class="text-center">
                    <form class="form" id="form" action="" enctype="multipart/form-data" method="post">
                      <input type="hidden" name="id" value="<?php echo $baca['id']; ?>">
                      <div class="upload">
                        <img src="../dist/img/profile/<?php echo $baca['image']; ?>" id="image">

                        <div class="rightRound" id="upload">
                          <input type="file" name="fileImg" id="fileImg" accept=".jpg, .jpeg, .png">
                          <i class="fa fa-camera"></i>
                        </div>

                        <div class="leftRound" id="cancel" style="display: none;">
                          <i class="fa fa-times"></i>
                        </div>
                        <div class="rightRound" id="confirm" style="display: none;">
                          <input type="submit">
                          <i class="fa fa-check"></i>
                        </div>
                      </div>
                    </form>
                    <script type="text/javascript">
                      document.getElementById("fileImg").onchange = function() {
                        document.getElementById("image").src = URL.createObjectURL(fileImg.files[0]); // Preview new image
                        document.getElementById("cancel").style.display = "block";
                        document.getElementById("confirm").style.display = "block";
                        document.getElementById("upload").style.display = "none";
                      }
                      var userImage = document.getElementById('image').src;
                      document.getElementById("cancel").onclick = function() {
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
                              window.location='profile-murid-view.php?'
                              </script>";

                      }
                    ?>

                  </div>
                  <h3 class="profile-username text-center"><?php echo $baca['fullname'];?></h3>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
              <!-- About Me Box -->
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">Maklumat</h3>
                </div>
                <!-- /.card-header -->
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
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
              <div class="card card-warning">
                <div class="card-header">
                  Maklumat Kokurikulum Murid
                </div>
                <div class="card-body">
                  <form class="form-horizontal" action="../edit/kemaskini-koko-murid.php" method="post">
                    <div class="form-group row">
                      <label class="col-sm-4 col-form-label">Kelab & Persatuan :</label>
                      <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="id_kelabP" id="kelab" class="form-control">
                          <option value=""><?= $baca['nama_kelabP']; ?></option>
                          <?php
                                                  $sn1 = "SELECT *
                                                  FROM kelab_persatuan";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                          <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['nama_kelabP'];?> </option>
                          <?php
                                                  }
                                              ?>
                        </select>
                      </div>
                    </div>

                    <div class="form-group row">
                      <label class="col-sm-4 col-form-label">Sukan & Permainan :</label>
                      <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="id_sukanP" id="sukan" class="form-control">
                          <option value=""><?= $baca['jenis_sukanP']; ?></option>
                          <?php
                                                  $sn1 = "SELECT *
                                                  FROM sukan_permainan";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                          <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_sukanP'];?> </option>
                          <?php
                                                  }
                                              ?>
                        </select>
                      </div>
                    </div>

                    <div class="form-group row">
                      <label class="col-sm-4 col-form-label">Unit Uniform :</label>
                      <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="id_uniform" id="kelab" class="form-control">
                          <option value=""><?= $baca['jenis_uniform']; ?></option>
                          <?php
                                                  $sn1 = "SELECT *
                                                  FROM unit_uniform";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                          <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_uniform'];?> </option>
                          <?php
                                                  }
                                              ?>
                        </select>
                      </div>
                    </div>

                    <div class="form-group row">
                      <label class="col-sm-4 col-form-label">Rumah Sukan :</label>
                      <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="id_rumah_sukan" id="kelab" class="form-control">
                          <option value=""><?= $baca['jenis_rumah']; ?></option>
                          <?php
                                                  $sn1 = "SELECT *
                                                  FROM rumah_sukan";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                          <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_rumah'];?> </option>
                          <?php
                                                  }
                                              ?>
                        </select>
                      </div>
                    </div>
                    <td colspan="4" style="text-align:center ;"><button type="submit" class="btn btn-primary" name="">Kemaskini Kokurikulum</button></td>
                  </form>
                </div>
              </div>

<!----- Maklumat HEM Murid ------------->
              <div class="col-md-9">
                <div class="card card-warning">
                  <div class="card-header">
                    Maklumat HEM Murid
                  </div>
                  <div class="card-body">
                    <form class="form-horizontal" action="../edit/kemaskini-hem-murid.php" method="post">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Alamat :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                            <option value=""><?= $baca['alamat']; ?></option>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Agama :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                          <select name="id_agama" id="agama" class="form-control">
                            <option value=""><?= $baca['keterangan_agama']; ?></option>
                            <?php
                                                  $sn1 = "SELECT *
                                                  FROM agama";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['keterangan_agama'];?> </option>
                            <?php
                                                  }
                                              ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Kaum :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                          <select name="id_kaum" id="kaum" class="form-control">
                            <option value=""><?= $baca['jenis_kaum']; ?></option>
                            <?php
                                                  $sn1 = "SELECT *
                                                  FROM kaum";
                                                  $rsn1 = mysqli_query($sambung, $sn1);
                                                  while ($rw1 = mysqli_fetch_array($rsn1)){
                                              ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['jenis_kaum'];?> </option>
                            <?php
                                                  }
                                              ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Oku :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                          <select name="oku" id="oku" class="form-control">
                          <option value=""><?= $baca['oku']; ?></option>
                            <option value="ya">Ya</option>
                            <option value="tidak">Tidak</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Asrama :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="asrama" id="asrama" class="form-control">
                          <option value=""><?= $baca['asrama']; ?></option>
                            <option value="YA">YA</option>
                            <option value="TIDAK">TIDAK</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Yatim :</label>
                        <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                        <select name="yatim" id="yatim" class="form-control">
                          <option value=""><?= $baca['yatim']; ?></option>
                            <option value="Ya">Ya</option>
                            <option value="Tidak">Tidak</option>
                          </select>                        </div>
                      </div>
                      <td colspan="4" style="text-align:center ;"><button type="submit" class="btn btn-success" name="">Kemaskini Maklumat Murid</button></td>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

  <div>

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