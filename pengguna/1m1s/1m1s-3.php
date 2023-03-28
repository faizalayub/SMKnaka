<?php
    session_start();
    require_once('panggil-database.php');
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

  <script>
        function panggilTingkatan(str) {
            if (str == "") {
                document.getElementById("kelasId").innerHTML = "";
                return;
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("kelasId").innerHTML = this.responseText;
                    document.getElementById("pilihTarikh").style.display = 'block';

                }
                };
                xmlhttp.open("GET","panggilKelas.php?q="+str,true);
                xmlhttp.send();
            }
        }

        function panggilPelajar (str)
        {
            if (str == ''){
                
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById('listPelajar').innerHTML = this.responseText;
                        document.getElementById("pelajar").style.display = 'block';
                    } 
                };

                //prompt ('Nilai q: ' + str);

                xmlhttp.open("GET", "panggilPelajar.php?q=" + str, true);
                xmlhttp.send();
            }
        }
    </script>

  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnGet").click(function () {
                //Create an Array.
                var selected = new Array();
    
                //Reference the CheckBoxes and insert the checked CheckBox value in Array.
                $("#tblFruits input[type=checkbox]:checked").each(function () {
                    selected.push(this.value);
                });
    
                //Display the selected CheckBox values.
                if (selected.length > 0) {
                    alert("Selected values: " + selected.join(","));
                }
            });
        });
    </script>

<?php
        if (isset($_POST['btnSimpan']))
        {    
            $tingkatan  = $_POST['tingkatan'];
            $kelas      = $_POST['kelas'];
            $id_pengguna = $_POST['id_pengguna'];
            $jumPelajar = count($id_pengguna);

            for ($i=0; $i<$jumPelajar; ++$i){
                $sn1 = "insert into kehadiran_harian(id_pengguna,
                                                  id_tingkatan,
                                                  id_kelas)
                                    values ('$id_pengguna[$i]',
                                            '$tingkatan',
                                            '$kelas')";
                $rsn1 = mysqli_query($sambung, $sn1);

                echo "<script>";
                echo "alert('Penyertaan direkodkan!');";
                echo "if(confirm('Masuk Nama lagi?')) {";
                echo "window.location.href = '1m1s-3.php';";
                echo "} else {";
                echo "window.location.href = '1m1s-1.php';";
                echo "}";
                echo "</script>";
            }
        }
    ?>

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
                <?php 
                    $id=$_GET['id'];
                    $query=mysqli_query($sambung,"SELECT * FROM 1m1s_daftar WHERE id='$id'");
                    while($baca=mysqli_fetch_array($query))
                    ?>
                    <h5 class="mt-4">Tajuk : <?php echo $baca['tajuk'];?></h5>
                <form class="form-group" method="post" action=""> 
                    <div class="card">
                        <div class="card-header bg-info">*Tanda Murid Menyertai Aktiviti</div>
                            <div class="card-body">
                                <!-- mulakan carian pelajar -->
                                    <div class="form-group">
                                        <label for="">Tingkatan</label>
                                        <select name="tingkatan" id="tingkatan_id" onchange="panggilTingkatan(this.value)" class="form-control">
                                            <option value="">Pilih Tingkatan</option>
                                            <?php
                                                $sn1 = "SELECT *
                                                        FROM tingkatan";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['id'];?>-<?php echo $rw1['nama_tingkatan'];?> </option>
                                            <?php
                                                }

                                            ?>
                                        </select>
                                    </div>
                                    
                                    <div id="kelasId"></div>
                            </div>
                        </div>
                        
                        <div id="pelajar" class="card" style="margin-top: 1em; display: none;">
                            <div class="card">                            
                                <div class="card-header">Pelajar Menyertai Aktiviti</div>
                                <div class="card-body">
                                    <div id="listPelajar"></div>
                                    <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan Penyertaan </button>
                                </div>    
                            </card>                    
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