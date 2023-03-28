<?php
    session_start();
    require_once('../../panggil-database.php');

    $userSessionID = $_SESSION['id'];
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

        <!-- Sweetalert core CSS -->
        <link href="../../vendor/sweetalert/css/sweetalert.css" rel="stylesheet">
        
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
                            <li><a href="" class="active"></a></li>
                            <li><a href="../index.php" class="active">Utama</a></li>
                            <li class="has-sub">
                                <a href="javascript:void(0)">Setting</a>
                                <ul class="sub-menu">
                                    <li><a href="rph-tema.php">Tema</a></li>
                                    <li><a href="rph-tajuk.php">Tajuk</a></li>
                                </ul>
                            </li>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <section class="main-banner">
        <div class="wrapper">

            <div class="content">
                <div class="container" style="margin-top:1em;">
                    <div class="row mb-3"><a class="primary">RANCANGAN PELAJARAN HARIAN</a></div>

                    <form class="form-group" method="POST"> 
                        <table class="table table-bordered">
                            <tr>
                                <th>TINGKATAN</th>
                                <td colspan="10">
                                    <select name="ref_school_level" id="tingkatan_id" onchange="panggilTingkatan(this.value)" class="form-control">
                                        <option value="">Pilih Tingkatan</option>
                                        <?php
                                            $rsn1 = mysqli_query($sambung, "SELECT * FROM tingkatan");

                                            while ($rw1 = mysqli_fetch_array($rsn1)){
                                                echo '<option value="'.$rw1['id'].'">'.$rw1['id'].'-'.$rw1['nama_tingkatan'].'</option>';
                                            }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>KELAS</th>
                                <td>
                                    <select name="ref_classroom" id="kelasId" class="form-control" required></select>
                                </td>
                                
                                <th>SUBJEK</th>
                                <td colspan="10">
                                    <select name="ref_subject" id="subjek" class="form-control" required>
                                        <?php
                                            $rsn1 = mysqli_query($sambung, "SELECT * FROM rph_subjek");

                                            while ($rw1 = mysqli_fetch_array($rsn1)){
                                                echo '<option value="'.$rw1['id'].'">'.$rw1['subjek'].'</option>';
                                            }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>TARIKH</th>
                                <td>
                                    <input type="date" name="effective_date" class="form-control" required />
                                </td>

                                <th>MASA MULA</th>
                                <td>
                                    <input type="time" name="start_time" class="form-control" placeholder="Masa Mula" required/>
                                </td>

                                <th>MASA AKHIR</th>
                                <td>
                                    <input type="time" name="end_time" class="form-control" placeholder="Masa Tamat" required/>
                                </td>
                            </tr>
                            <tr id="date-selected-info">
                                <td colspan="10">
                                    <div class="alert alert-info" role="alert"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>TEMA</th>
                                <td colspan="10">
                                    <input class="form-control" name="subject_theme" type="text" required />
                                </td>
                            </tr>
                                <tr>
                                <th>TAJUK</th>
                                <td colspan="10">
                                    <input class="form-control" name="subject_title" type="text" required />
                                </td>
                            </tr>
                            <tr>
                                <th>STANDARD KANDUNGAN</th>
                                <td colspan="10">
                                    <input class="form-control" name="content_standard" type="text" required />
                                </td>
                            </tr> 
                            <tr>
                                <th>STANDARD PEMBELAJARAN</th>
                                <td colspan="10">
                                <input class="form-control" name="subject_standard" type="text" required />
                                </td>
                            </tr>
                            <tr>
                                <th>OBJEKTIF PEMBELAJARAN</th>
                                <td colspan="10">
                                    <p>Di akhir pengajaran dan pembelajaran, murid dapat</p>
                                    <textarea name="subject_objective" id="editor-objektif" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>AKTIVITI PEMBELAJARAN</th>
                                <td colspan="10">
                                    <textarea name="subject_activity" id="editor-aktiviti" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>BAHAN BANTUAN</th>
                                <td colspan="10">
                                    heredd
                                </td>
                            </tr>
                            <tr>
                                <th>REFLEKSI</th>
                                <td colspan="10">
                                    <input name="subject_outcomes" class="form-control" id="tema" type="text" required />
                                </td>
                            </tr>
                        </table>

                        <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan RPH </button>
                    </form>  
                </div>
            </div>

        </div>
    </section>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="../../ckeditor/ckeditor.js"></script>
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/sweetalert/js/sweetalert.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/js/isotope.min.js"></script>
    <script src="../../assets/js/owl-carousel.js"></script>
    <script src="../../assets/js/lightbox.js"></script>
    <script src="../../assets/js/tabs.js"></script>
    <script src="../../assets/js/video.js"></script>
    <script src="../../assets/js/slick-slider.js"></script>
    <script src="../../assets/js/custom.js"></script>

    <script type="text/javascript">
        let dateInfoAlert = $('#date-selected-info');
        let dayStringLabel = ['Ahad', 'Isnin', 'Selasa', 'Rabu', 'Khamis', 'Jumaat', 'Sabtu'];

        function panggilTingkatan(str) {
            document.getElementById("kelasId").innerHTML = "";

            if(str != ""){
                let xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200){
                        document.getElementById("kelasId").innerHTML = this.responseText;
                        document.getElementById("subjekId").style.display = 'block';

                    }
                };

                xmlhttp.open("GET","panggilKelas.php?q="+str,true);
                xmlhttp.send();
            }
        }

        function panggilSubjek1 (str){
            if(str != ''){
                let xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function(){
                    if (this.readyState == 4 && this.status == 200){
                        document.getElementById('listSubjek').innerHTML = this.responseText;
                        document.getElementById("subjek").style.display = 'block';
                    } 
                };

                xmlhttp.open("GET", "panggilSubjek.php?q=" + str, true);
                xmlhttp.send();
            }
        }

        $(function(){
            CKEDITOR.replace('editor-objektif');
            CKEDITOR.replace('editor-aktiviti');

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

            $('[name="effective_date"]').on('change', function(e){
                let dateModel = e.target.value;
                let contentTextEl = dateInfoAlert.find('.alert'); 

                if(!dateModel || dateModel == ''){
                    dateInfoAlert.hide();
                }else{
                    let $dateObject = moment(dateModel, 'YYYY-MM-DD');
                    let $day        = $dateObject.format('d');
                    let $weekNumber = $dateObject.week();

                    contentTextEl.html(`Anda telah memilih hari <b>${ dayStringLabel[$day] }</b> & <b>Minggu ke ${ $weekNumber }</b>`);

                    dateInfoAlert.show();
                }
            });

            $('[name="effective_date"]').trigger('change');
        });
    </script>

    <?php
        if(isset($_POST['btnSimpan'])){
            $ref_school_level  = (isset($_POST['ref_school_level']) ? $_POST['ref_school_level'] : '');
            $ref_classroom     = (isset($_POST['ref_classroom']) ? $_POST['ref_classroom'] : '');
            $ref_subject       = (isset($_POST['ref_subject']) ? $_POST['ref_subject'] : '');
            $effective_date    = (isset($_POST['effective_date']) ? $_POST['effective_date'] : '');
            $start_time        = (isset($_POST['start_time']) ? $_POST['start_time'] : '');
            $end_time          = (isset($_POST['end_time']) ? $_POST['end_time'] : '');
            $subject_theme     = (isset($_POST['subject_theme']) ? $_POST['subject_theme'] : '');
            $subject_title     = (isset($_POST['subject_title']) ? $_POST['subject_title'] : '');
            $content_standard  = (isset($_POST['content_standard']) ? $_POST['content_standard'] : '');
            $subject_standard  = (isset($_POST['subject_standard']) ? $_POST['subject_standard'] : '');
            $subject_objective = (isset($_POST['subject_objective']) ? $_POST['subject_objective'] : '');
            $subject_activity  = (isset($_POST['subject_activity']) ? $_POST['subject_activity'] : '');
            $subject_outcomes  = (isset($_POST['subject_outcomes']) ? $_POST['subject_outcomes'] : '');
    
            $tableColumns = "`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `tarikh`, `masa_mula`, `masa_tamat`, `tema`, `tajuk`, `standard_kandungan`, `standard_pembelajaran`, `objektif`, `aktiviti`, `refleksi`, `bahan_bantuan`, `created_date`, `changes_date`";
            
            $tableValues = "NULL, '$userSessionID', '$ref_classroom', '$ref_subject', '$effective_date', '$start_time', '$end_time', '$subject_theme', '$subject_title', '$content_standard', '$subject_standard', '$subject_objective', '$subject_activity', '$subject_outcomes', '', current_timestamp(), current_timestamp()";
    
            if(mysqli_query($sambung, "INSERT INTO `rph_rancangan` ($tableColumns) VALUES ($tableValues)")){
                echo '<script>
                    swal({
                        title: "Perancangan disimpan",
                        text: "Semua data berjaya disimpan",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonClass: "btn-success",
                        confirmButtonText: "OK",
                        closeOnConfirm: false
                    },
                    function(e){
                        swal({
                            title: "Bina RPH lagi?",
                            text: "Anda akan kekal di lama web yang sama",
                            type: "info",
                            showCancelButton: true,
                            confirmButtonClass: "btn-info",
                            confirmButtonText: "Bina Lagi",
                            cancelButtonText: "Tidak",
                            closeOnConfirm: true,
                            closeOnCancel: true
                        },
                        function(e){
                            if(e == true){
                                swal.close();
                            }else{
                                window.location.href="../index.php";
                            }
                        });
                    });
                </script>';
            }else{
                echo '<script>
                    swal({
                        title: "Bina RPH lagi?",
                        text: "Anda akan kekal di lama web yang sama",
                        type: "danger",
                        showCancelButton: false,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Cuba Lagi",
                        closeOnConfirm: false
                    },
                    function(e){
                        window.location.reload();
                    });
                </script>';
            }  
        }
    ?>
</body>
</html>