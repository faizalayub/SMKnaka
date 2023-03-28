<?php
    session_start();
    require_once('../panggil-database.php');
  ?>

<!DOCTYPE html>
<html lang="en">

  <head>

  <script>
        function panggilKokurikulum(str) {
            if (str == "") {
                document.getElementById("id_kokurikulum").innerHTML = "";
                return;
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("id_kokurikulum").innerHTML = this.responseText;
                    document.getElementById("pilihTarikh").style.display = 'block';

                }
                };
                xmlhttp.open("GET","panggilJenisKoko.php?q="+str,true);
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

<?php

        $sn2 = "SELECT * FROM kehadiran_koko";
        $rs2 = $sambung->query($sn2);
        
        while ($rw2 = $rs2->fetch_assoc()){
            $tarikh = $rw2['tarikh'];

            $nTarikh = explode('-', $tarikh);
            $tarikh_baru = strtotime($tarikh);
            $tahun = $nTarikh[0];
            $bulan = $nTarikh[1];

            $sn3 ="UPDATE kehadiran_koko
                   SET tarikh_baru = '$tarikh_baru',
                        tahun = '$tahun',
                        bulan = '$bulan'
                    WHERE id = ".$rw2['id'];

            $rs3 = $sambung->query($sn3);
        }

        //header ('Refresh:2; URL kehadiran-ko.php');
?>

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
<!--

TemplateMo 573 EduWell

https://templatemo.com/tm-573-eduwell

-->
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

            $tarikh = $_POST['tarikh'];
            $pelajarHadir = $_POST['pelajarHadir'];
            $id_kategori = $_POST['kokurikulum'];
            $id_subKategori = $_POST['kategori-kokurikulum'];
            $id_kelasLengkap = null; 
            $id_pengguna = null;
            //echo 'Tarikh: ' . $tarikh;
            //var_dump($pelajarHadir);

            foreach($pelajarHadir as $pelajar){
                $pelajarKelas = explode("|",$pelajar);
                $id_kelasLengkap = $pelajarKelas['1']; 
                $id_pengguna = $pelajarKelas['0'];

                $sn1 = "INSERT INTO kehadiran_koko (tarikh, id_kategori, id_subKategori,id_kelasLengkap,id_pengguna)
                            VALUES ('$tarikh', '$id_kategori', '$id_subKategori','$id_kelasLengkap','$id_pengguna')";

            $sambung->query($sn1);
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
                    <a class="btn btn-danger"> KEHADIRAN MURID AKTIVITI KOKURIKULUM</a>
                </div>
                <form class="form-group" method="post" action=""> 
                    <div class="card">
                        
                        <div class="card-header">Tanda Murid Hadir</div>
                        
                            <div class="card-body">
                                <!-- mulakan carian pelajar -->
                                <div id="pilihTarikh" class="form-group" style="display:yes;">
                                        <label for="">Tarikh</label>
                                        <input type="date" name="tarikh" id="tarikh" class="form-control" id="tarikh" required>
                                </div> 
                                    <div class="form-group">
                                        <label for="">Kategori Kokurikulum</label>
                                        <select name="kokurikulum" id="kokurikulum_id"  class="form-control">
                                            <option value="">Pilih Kategori</option>
                                            <?php
                                                $sn1 = "SELECT id,kategori_koko
                                                FROM kokurikulum ";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id'];?>"> <?php echo $rw1['kategori_koko'];?> </option>
                                            <?php
                                                }
                                            ?>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="">Sub Kategori Kokurikulum</label>
                                        <select name="kategori-kokurikulum" id="kategori_kokurikulum_id" class="form-control">
                                            <option value="">Pilih Sub Kategori</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="">Tingkatan</label>
                                        <select name="tingkatan" id="tingkatan" class="form-control">
                                            <option value="">Pilih Tingkatan</option>
                                        </select>
                                    </div>
                                    
                                    <div id="kelasId"></div>

                                    <!--<div id="pilihTarikh" class="form-group" style="display:none;">
                                        <label for="">Tarikh</label>
                                        <input type="date" name="tarikh" id="tarikh" class="form-control" id="tarikh" required>
                                    </div> -->  
                                                                                                     
                            </div>
                        </div>
                        
                        <!--<div id="pelajar" class="card" style="margin-top: 1em; display: none;">-->
                        <div id="pelajar" class="card" style="margin-top: 1em; display: none;">
                            <div class="card">                            
                                <div class="card-header bg-primary">Pelajar Hadir Aktiviti</div>
                                <div class="card-body">
                                    
                                        <div id="listPelajar"></div>
                                    
                                        <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan Kehadiran </button>
                                   
                                </div>    
                            </card>                    
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
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            //$('#example').DataTable();
            $("select[name='kategori-kokurikulum']").attr('disabled', true);
            $("select[name='tingkatan']").attr('disabled', true);
        } );

        $("select[name='kokurikulum']").change(function(){
            var kokurikulum_id = $(this).val();
            var kategori_kokurikulum_id = $('select[name="kategori_kokurikulum"]').val();
            if(kokurikulum_id){
                $.ajax({
                    url:"kategori-ajax.php?id="+kokurikulum_id+"&action=jenis_kokurikulum",
                    dataType: "json",
                    type: 'GET',
                    success: function(data){
                        $('select[name="kategori-kokurikulum"]').empty();
                        $('select[name="kategori-kokurikulum"]').append('<option value="">Pilih Sub Kategori</option>');
                        $.each(data, function(key, value) {
                             $('select[name="kategori-kokurikulum"]').append('<option value="'+ key +'">'+ value +'</option>');
                        });
                        $("select[name='kategori-kokurikulum']").removeAttr('disabled');
                        $("select[name='tingkatan']").attr('disabled', true);
                        $("#pelajar").hide();
                    }

                })
            }
        });

        $("select[name='kategori-kokurikulum']").change(function(){
            var kategori_kokurikulum_id = $(this).val();
            var kokurikulum_id = $('select[name="kokurikulum"]').val();
            if(kategori_kokurikulum_id){
                $.ajax({
                    url:"kategori-ajax.php?kategori_kokurikulum_id="+kategori_kokurikulum_id+"&action=tingkatan&kokurikulum_id="+kokurikulum_id,
                    dataType: "json",
                    type: 'GET',
                    success: function(data){
                        $('select[name="tingkatan"]').empty();
                        $('select[name="tingkatan"]').append('<option value="">Pilih Tingkatan</option>');
                        $.each(data, function(key, value) {
                             $('select[name="tingkatan"]').append('<option value="'+ key +'">'+ value +'</option>');
                        });
                        $("select[name='tingkatan']").removeAttr('disabled');
                        $("#pelajar").hide();
                    }

                })
            }
        });

        $("select[name='tingkatan']").change(function(){
            var tingkatan_id = $(this).val();
            var kokurikulum_id = $('select[name="kokurikulum"]').val();
            var kategori_kokurikulum_id = $('select[name="kategori-kokurikulum"]').val();
            if(kokurikulum_id){
                $.ajax({
                    url:"kategori-ajax.php?kategori_kokurikulum_id="+kategori_kokurikulum_id+"&action=studentList&kokurikulum_id="+kokurikulum_id+"&tingkatan_id="+tingkatan_id,
                    contentType: "application/json; charset=utf-8",
                    type: 'GET',
                    success: function(data){
                        $("#pelajar").show();
                        $("#listPelajar").html(data);
                    }

                })
            }
        });
    </script>
</body>
</html>