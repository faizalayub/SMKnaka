<?php
    session_start();
    require_once('../panggil-database.php');
  ?>

<!DOCTYPE html>
<html lang="en">

  <head>
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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>PROUD - SMK NAKA</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


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
        if (isset($_SESSION['success']))
        {    
            $message = $_SESSION['success'];
            unset($_SESSION['success']);

            echo "<script>";
            echo "alert('".$message."');";
            echo "if(confirm('Masuk kehadiran lagi?')) {";
            echo "window.location.href = 'kehadiran-harian.php';";
            echo "} else {";
            echo "window.location.href = '../index.php';";
            echo "}";
            echo "</script>";
        }else{

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
                      <a href="index.php" class="logo">
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

  <!-- ***** Main Banner Area Start ***** -->
  <section class="main-banner" >
  <div class="wrapper">
        <div class="content"> 

            <div class="container" style="margin-top:1em;">
                <div class="row mb-3">
                    <a class="primary"> KEHADIRAN HARIAN MURID</a>
                </div>
                <form class="form-group" method="post" action="/masuk-kehadiran-harian.php"> 
                    <div class="card">
                        <div class="card-header bg-danger">*Tanda Murid <b>TIDAK</b> Hadir</div>
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

                                    <div id="pilihTarikh" class="form-group" style="display:none;">
                                        <label for="">Tarikh</label>
                                        <input type="date" name="tarikh" id="tarikh" class="form-control" id="tarikh" required>
                                    </div>                                                                    
                                
                            </div>
                        </div>
                        
                        <div id="pelajar" class="card" style="margin-top: 1em; display: none;">
                            <div class="card">                            
                                <div class="card-header">Pelajar <b>TIDAK </b> Hadir</div>
                                <div class="card-body">
                                    <div id="listPelajar"></div>
                                    <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan Kehadiran </button>
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
</body>
</html>

<?php 

?>