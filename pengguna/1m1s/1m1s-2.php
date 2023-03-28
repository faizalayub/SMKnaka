<?php
    session_start();
    require_once('panggil-database.php');

    if(isset($_POST['submit'])) {
        //getting the post values
        $kategori     = $_POST['kategori'];
        $tajuk        = $_POST['tajuk'];
        $subTajuk     = $_POST['subTajuk'];
        $tarikh       = $_POST['tarikh'];
        $kaedah       = $_POST['kaedah'];
        $peringkat    = $_POST['peringkat'];
        $jumlahm      = $_POST['jumlahm'];
        $anjuran      = $_POST['anjuran'];
        $id_pencapaian   = $_POST['id_pencapaian'];
        $fullname    = $_POST['fullname'];
        $userId       = $_SESSION['id'];

        // get the year
        $tempTahun = explode('-', $tarikh);
        $tahun  = $tempTahun[0];

        // Query for data insertion
        $sql = "INSERT INTO 1m1s_daftar(tahun,kategori,tajuk,subTajuk,tarikh,kaedah,peringkat,jumlahm,anjuran,id_pencapaian,fullname,uploaded_by) 
                VALUES ('$tahun','$kategori','$tajuk','$subTajuk','$tarikh','$kaedah','$peringkat','$jumlahm','$anjuran','$id_pencapaian','$fullname','$userId')";

        $query = mysqli_query($sambung,$sql);

        if ($query) {
            echo "<script>alert('Aktiviti telah direkodkan. Terima Kasih');</script>";
            echo "<script type='text/javascript'> document.location ='1m1s-1.php'; </script>";
        }
        else {
            echo "<script>alert('Something Went Wrong. Please try again');</script>";
        }
    }
?>


<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>PROUD - SMK NAKA</title>

    <!-- Bootstrap core CSS -->
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../../assets/css/templatemo-eduwell-style.css">
    <link rel="stylesheet" href="../../assets/css/owl.css">
    <link rel="stylesheet" href="../../assets/css/lightbox.css">
    
    
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css">

</head>
<body>
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="../index.php" class="logo">
                          <img src="../../dist/img/logo.png" width="50" height="50" alt="Lencana">
                      </a>
                      <!-- ***** Logo End ***** -->
                      <!-- ***** Menu Start ***** -->
                      <ul class="nav">
                        
                          <li><a href="../index.php" class="active">Utama</a></li>
                      </ul>        
                      <a class='menu-trigger'>
                          <span>Menu</span>
                      </a>
                      <!-- ***** Menu End ***** -->
                  </nav>
              </div>
          </div>
      </div>
  </header>
  <!-- ***** Header Area End ***** -->
  <section class="main-banner" >
    <div class="wrapper">
          <div class="content"> 
              <div class="container" style="">
                  <div class="row mb-3">
                      <a class="primary" href="1m1s-1.php" target=""><button class="btn btn-primary"><< KEMBALI </button></a>
                  </div>
                <div class="card-body">
                <form method="post" name="submit" onsubmit="return checkpass();">

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Kategori :</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <select name="kategori" id="kategori" class="form-control">
    <option value="">Pilih Kategori</option>
                            <?php
                                $sn1 = "SELECT id,kategori_koko
                                FROM kokurikulum ";
                                $rsn1 = mysqli_query($sambung, $sn1);
                                while ($rw1 = mysqli_fetch_array($rsn1)){
                            ?>
                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['kategori_koko'];?> </option>
      <?php } ?>
    </select>
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Tajuk</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <input class="form-control" id="tajuk" name="tajuk" type="text" placeholder="" style="" required />
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Sub Tajuk</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <input class="form-control" id="subTajuk" name="subTajuk" type="text" placeholder="" style="" />
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Tarikh </label>
  <div class="col-sm-7 col-md-8 col-lg-3 col-xl-10">
    <input class="form-control" id="tarikh" name="tarikh" type="date" placeholder="" required />
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Kaedah :</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <select name="kaedah" id="kaedah" class="form-control">
      <option value="">--Sila pilih--</option>
      <?php
                                $sn1 = "select *
                                        from 1m1s_kaedah
                                        ";
                                $rsn1 = mysqli_query($sambung, $sn1);
                                while ($rw1 = mysqli_fetch_array($rsn1)){
                            ?>
      <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['kaedah'];?> </option>
      <?php  }  ?>
    </select>
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Peringkat :</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <select name="peringkat" id="peringkat" class="form-control">
      <option value="">--Sila pilih--</option>
      <?php
                                $sn1 = "select *
                                        from 1m1s_peringkat
                                        ";
                                $rsn1 = mysqli_query($sambung, $sn1);
                                while ($rw1 = mysqli_fetch_array($rsn1)){
                            ?>
      <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['peringkat'];?> </option>
      <?php  } ?>
    </select>
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Bil Murid</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <input class="form-control" id="jumlahm" name="jumlahm" type="text" placeholder="" required />
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Anjuran</label>
  <div class="col-sm-7 col-md-8 col-lg-3 col-xl-10 mb-3">
    <input class="form-control" id="anjuran" name="anjuran" type="text" placeholder="" style="" required />
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Pencapaian :</label>
  <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
    <select name="id_pencapaian" id="id_pencapaian" class="form-control">
      <option value="">--Sila pilih--</option>
      <?php
                                $sn1 = "select *
                                        from 1m1s_pencapaian
                                        ";
                                $rsn1 = mysqli_query($sambung, $sn1);
                                while ($rw1 = mysqli_fetch_array($rsn1)){
                            ?>
      <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['pencapaian'];?> </option>
      <?php  } ?> <!-- nak gantikanpencapaian ni kepada $id saja -->
    </select>
  </div>
</div>

<div class="mb-3 row">
  <label class="col-sm-5 col-md-4 col-lg-3 col-xl-2 col-form-label">Guru Pelapor</label>
  <div class="col-sm-7 col-md-8 col-lg-3 col-xl-10 mb-3">
    <?php //var_dump($_SESSION); ?>
    <input value="<?php echo $_SESSION['fullname']; ?>" class="form-control" id="nama_guru" name="fullname" type="text" placeholder="" readonly />
  </div>
  <button type="submit" class="btn btn-primary" name="submit">Simpan Penyertaan</button>

</div>
</div>
</div>
</div>
</div>
</form>

                </div>
              </div>
          </div>
     </div>
  </section>

  <!-- ***** Main Banner Area Start ***** -->
  <!-- ***** Main Banner Area End ***** -->
         
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/isotope.min.js"></script>
    <script src="../../assets/js/owl-carousel.js"></script>
    <script src="../../assets/js/lightbox.js"></script>
    <script src="../../assets/js/tabs.js"></script>
    <script src="../../assets/js/video.js"></script>
    <script src="../../assets/js/slick-slider.js"></script>
    <script src="../../assets/js/custom.js"></script>

    <script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
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