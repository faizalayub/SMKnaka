<?php
    require_once('../panggil-database.php');

  ?>

<?php
    if (isset($_GET['d'])){
        $id_kelas = $_GET['id_kelas'];
        $tarikh = $_GET['tarikh'];
        
        $sn1 = "delete from kehadiran_harian where kelas = '$id_kelas' and tarikh = '$tarikh'";
        
        //echo $sn1;
        //exit;
        
        if (mysqli_query($con, $sn1) === TRUE){
            echo "<script type='text/javascript'>
                  alert('Kelas berjaya dipadam.');
                  window.location='semak-kehadiran.php';
              </script>";
            exit();
        }
        
        // print_r($_GET);
        // exit;
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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-eduwell-style.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/lightbox.css">
    
    
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
<body>
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="../index.php" class="logo">
                          <img src="../dist/img/logo.png" width="50" height="50" alt="Lencana">
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
                <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                <form class="form-group" method="post" action="" id="tblFruits">                     
                        
                    <div class="card">                            
                        <div class="card-header">Senarai Tidak Hadir</div>
                        <div class="card-body">
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">TARIKH</th>
                                        <th scope="col">TINGKATAN</th>
                                        <th scope="col">KELAS</th>
                                        <th scope="col">SEMAKAN</th>
                                        <th scope="col">HAPUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $run = $sambung->query("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))");

                                        $sn2 = "SELECT a.id, a.tarikh, b.nama_tingkatan, f.keterangan, d.fullname
                                        FROM kehadiran_harian AS a
                                        INNER JOIN tingkatan AS b
                                        ON b.id=a.id_tingkatan
                                        INNER JOIN pengguna AS d
                                        ON d.id=a.id_pengguna
                                        INNER JOIN maklumat_murid AS e
                                        ON e.id_pengguna=d.id
                                        INNER JOIN kelas_lengkap AS f
                                        ON f.id=e.id_kelasLengkap";

                                        $rsn2 = $sambung->query($sn2);
                                    
                                        $i = 0;
                                        while ($row2 = $rsn2->fetch_assoc()){
                                            // $sn1 = "SELECT *
                                            //         FROM kehadiran_harian  
                                            //         WHERE tarikh = " . $row2['tarikh'] . "
                                            //         GROUP BY id_kelas
                                            //         ORDER BY id_kelas ASC";
                                            $sn1 = "SELECT *, a.id as kid, a.id_kelas as kis 
                                                    FROM kehadiran_harian AS a 
                                                    JOIN kelas_lengkap AS b ON a.id_kelas = b.id
                                                    JOIN tingkatan AS c ON a.id_tingkatan = c.id
                                                    WHERE a.tarikh = " . $row2['tarikh'] . " 
                                                    GROUP BY a.id_kelas 
                                                    ORDER BY a.id_kelas ASC";
                                            $rsn1 = $sambung->query($sn1);
                                            
                                            //echo $sn1;
                                            while ($row1 = $rsn1->fetch_assoc()){
                                                //print_r($row1);
                                    ?>
                                    <tr>
                                    <th scope="row"><?php echo ++$i;?></th>
                                    <td><?php echo date('d-m-Y', $row1['tarikh']);?></td>
                                    <td><?php echo $row1['nama_tingkatan'];?></td>
                                    <td><?php echo $row1['keterangan'];?></td>

                                    <!-- <td><a href="kehadiran-lengkap.php?id_kelas=<?php echo $row1['kelas'];?>&tarikh=<?php echo $row1['tarikh'];?>" class="btn btn-primary"><i class="fa fa-search"></i></a></td>
                                    <td>   <a href="kehadiran-harian.php?d=1&id_kelas=<?php echo $row1['kelas'];?>&tarikh=<?php echo $row1['tarikh'] ;?>" 
                                           class="btn btn-danger delete" 
                                           name="btnPadam" 
                                           type="submit"
                                           onclick="return confirm('Anda pasti untuk padam kelas ini?"><i class="fa fa-trash"></i></a></td>
                                     -->
                                    <td><a href="kehadiran-lengkap.php?id_kehadiran=<?php echo $row1['kid'];?>&id_kelas=<?php echo $row1['kis'];?>" class="btn btn-primary"><i class="fa fa-search"></i></a></td>
                                    <td>   <a href="kehadiran-harian.php?d=1&id_kelas=<?php echo $row1['kelas'];?>&tarikh=<?php echo $row1['tarikh'] ;?>" 
                                           class="btn btn-danger delete" 
                                           name="btnPadam" 
                                           type="submit"
                                           onclick="return confirm('Anda pasti untuk padam kelas ini?"><i class="fa fa-trash"></i></a></td>
                                    
                                    </tr>
                                    <?php } } ?>
                                </tbody>
                            </table>
                                
                        </div>    
                    </div> 
                </form>    


                </table>
              </div>
            </div>
        </div>
    </div>
  </section>

  <!-- ***** Main Banner Area Start ***** -->
  <!-- ***** Main Banner Area End ***** -->
         
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/isotope.min.js"></script>
    <script src="../assets/js/owl-carousel.js"></script>
    <script src="../assets/js/lightbox.js"></script>
    <script src="../assets/js/tabs.js"></script>
    <script src="../assets/js/video.js"></script>
    <script src="../assets/js/slick-slider.js"></script>
    <script src="../assets/js/custom.js"></script>

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