<?php
    require_once('../../panggil-database.php');
  ?>

<!DOCTYPE html>
<html lang="en">

  <head>
  <script src="../../ckeditor/ckeditor.js"></script>
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
                    document.getElementById("subjekId").style.display = 'block';

                }
                };
                xmlhttp.open("GET","panggilKelas.php?q="+str,true);
                xmlhttp.send();
            }
        }

        function panggilSubjek1 (str)
        {
            if (str == ''){
                
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById('listSubjek').innerHTML = this.responseText;
                        document.getElementById("subjek").style.display = 'block';
                    } 
                };

                //prompt ('Nilai q: ' + str);

                xmlhttp.open("GET", "panggilSubjek.php?q=" + str, true);
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
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


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
            $tingkatan     = $_POST['tingkatan'];
            $kelas         = $_POST['kelas'];
            $subjek        = $_POST['subjek'];
            $minggu        = $_POST['subjek'];
            $hari          = $_POST['subjek'];
            $tarikh        = strtotime($_POST['tarikh']);
            $id_masa_mula  = $_POST['subjek'];
            $id_masa_tamat = $_POST['subjek'];
            
            $id_pengguna = $_POST['id_pengguna'];

                $sn1 = "insert into rph_perancangan(id_pengguna,
                                                  id_tingkatan,
                                                  id_kelas,
                                                  subjek ,
                                                  minggu,
                                                  hari,
                                                  tarikh,
                                                  tarikh,
                                                  tarikh)
                                    values ('$id_pengguna',
                                            '$tingkatan',
                                            '$kelas',
                                            '$subjek',
                                            '$minggu',
                                            '$hari',
                                            '$tarikh',
                                            '$kelas',
                                            '$kelas')";
                $rsn1 = mysqli_query($sambung, $sn1);

                echo "<script>";
                echo "alert('Perancangan disimpan!');";
                echo "if(confirm('Bina RPH lagi?')) {";
                echo "window.location.href = 'cipta-rph.php';";
                echo "} else {";
                echo "window.location.href = '../index.php';";
                echo "}";
                echo "</script>";
           
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
                        <li><a href="cipta-rph.php" class="active">Bina</a></li>
                        <li><a href="semak-rph.php" class="active">Semak</a></li>
                        <li><a href="setting-rph.php" class="active">Setting</a></li>
                        <li><a href="" class="active"></a></li>
                        <li><a href="../index.php" class="active">Utama</a></li>
                        <li class="has-sub">
                              <a href="javascript:void(0)">Setting</a>
                              <ul class="sub-menu">
                              <li><a href="rph-tema.php">Tema</a></li>
                                  <li><a href="rph-tajuk.php">Tajuk</a></li>
                              </ul>
                        </li>
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

            <div class="container" style="margin-top:1em;">
                <div class="row mb-3">
                    <a class="primary">RANCANGAN PELAJARAN HARIAN</a>
                </div>
                <form class="form-group" method="post" action=""> 
                <table class="table table-bordered">
                                    <tr>
                                       <th>TINGKATAN</th>
                                       <td colspan="10">
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
                                        </select>                                       </td>
                                    </tr>
                                    <tr>
                                        <th>KELAS</th>
                                            <td>
                                                <select name="id_kelasLengkap" id="kelasId" class="form-control" required>
                                                </select>
                                            </td>

                                    <th>SUBJEK</th>
                                    <td colspan="10">
                                    <select name="id_subjek" id="subjek" class="form-control" required>
                                            <?php
                                                $sn1 = "SELECT *
                                                        FROM rph_subjek";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id'];?>"><?php echo $rw1['subjek'];?> </option>
                                            <?php
                                                }

                                            ?>
                                    </select>
                                    </td>
                                  </tr>
                                  <tr>
                                    <th>MINGGU</th>
                                    <td>
                                        <select name="id_minggu" id="id_minggu" class="form-control" required>
                                            <?php
                                                $sn1 = "SELECT *
                                                        FROM rph_minggu";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id_minggu'];?>"><?php echo $rw1['minggu'];?> </option>
                                            <?php
                                                }

                                            ?>
                                        </select>
                                    </td>
                                    <th>HARI</th>
                                    <td colspan="10">
                                    <select id="hari" name="hari" class="form-select" required>
                                        <option value="">Pilih hari.. </option>
                                        <option value="AHAD">AHAD</option>
                                        <option value="ISNIN">ISNIN</option>
                                        <option value="SELASA">SELASA</option>
                                        <option value="RABU">RABU</option>
                                        <option value="KHAMIS">KHAMIS</option>
                                    </select>  

                                    </td>
                                  </tr>
                                   <tr>
                                        <th>TARIKH</th>
                                       <td>
                                       <input class="form-control" id="tarikh" name="tarikh" type="date" required />
                                       </td>
                                         <th>MASA MULA</th>
                                       <td>
                                       <select name="id_masa_mula" id="masa" class="form-control" required>
                                            <?php
                                                $sn1 = "SELECT *
                                                        FROM rph_masa";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id'];?>"><?php echo $rw1['masa'];?> </option>
                                            <?php
                                                }

                                            ?>
                                        </select>
                                       </td>
                                       <th>MASA AKHIR</th>
                                       <td>
                                       <select name="id_masa_tamat" id="masa" class="form-control" required>
                                            <?php
                                                $sn1 = "SELECT *
                                                        FROM rph_masa";
                                                $rsn1 = mysqli_query($sambung, $sn1);
                                                while ($rw1 = mysqli_fetch_array($rsn1)){
                                            ?>
                                            <option value="<?php echo $rw1['id'];?>"><?php echo $rw1['masa'];?> </option>
                                            <?php
                                                }

                                            ?>
                                        </select>
                                       </td>
                                   </tr>
                                   <tr>
                                       <th>TEMA</th>
                                       <td colspan="10">
                                       <input class="form-control" id="tema" name="tema" type="text" required />
                                       </td>
                                   </tr>
                                     <tr>
                                       <th>TAJUK</th>
                                       <td colspan="10">
                                       <input class="form-control" id="tajuk" name="tajuk" type="text" required />
                                       </td>
                                   </tr>
                                      
                                   <tr>
                                       <th>STANDARD KANDUNGAN</th>
                                       <td colspan="10">
                                       <input class="form-control" id="tema" name="tema" type="text" required />
                                       </td>
                                   </tr>
                                     
                                   <tr>
                                       <th>STANDARD PEMBELAJARAN</th>
                                       <td colspan="10">
                                       <input class="form-control" id="tema" name="tema" type="text" required />
                                       </td>
                                   </tr>
                                  <tr>
                                       <th>OBJEKTIF PEMBELAJARAN</th>
                                       <td colspan="10">
                                        <p>Di akhir pengajaran dan pembelajaran, murid dapat</p>
                                        <textarea id="editor-objektif" name="objektif" required></textarea>
                                       </td>
                                   </tr>

                                   <tr>
                                       <th>AKTIVITI PEMBELAJARAN</th>
                                       <td colspan="10">
                                       <textarea id="editor-aktiviti" name="aktiviti" required></textarea>
                                       </td>
                                   </tr>

                                   <tr>
                                       <th>REFLEKSI</th>
                                       <td colspan="10">
                                       <input class="form-control" id="tema" name="refleksi" type="text" required />
                                       </td>
                                   </tr>
                                    </tbody>
                                </tr>
                                </table>
                                <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan RPH </button>
                </form>  
            </div>
        </div>
    </div>
 </div>
  </section>

  <!-- ***** Main Banner Area Start ***** -->
  <!-- ***** Main Banner Area End ***** -->
  <script>CKEDITOR.replace('editor-objektif')</script>
  <script>CKEDITOR.replace('editor-aktiviti')</script>
          
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
</body>
</html>