<?php
    session_start();
    include '../../_API.php';
    require_once('../../panggil-database.php');

    if(!isset($_SESSION['role']) || $_SESSION['role'] != '2'){
        header("Refresh: 1; url=../../index.php");
    }

    $dataset       = (object)[];
    $API           = new Controller('RETURN');
    $userSessionID = $_SESSION['id'];
    $dataset       = $API->fetchRows("SELECT * FROM `rph_rancangan` WHERE id_pengguna = ".$userSessionID);
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

    <!-- Chips Picker core CSS -->
    <link href="../../vendor/chipspicker/picker.css" rel="stylesheet">
    
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
    <link href="https://cdn.datatables.net/v/bs4/dt-1.13.4/datatables.min.css" rel="stylesheet"/>

    <style>
        .nowrap-space{
            white-space: nowrap;
        }

        .cell-md{
            min-width: 200px;
        }

        .cell-lg{
            min-width: 300px;
        }

        .dataTables_wrapper .row:nth-child(2){
            display: block;
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
    </style>
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

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../index.php">UTAMA</a></li>
                            <li class="breadcrumb-item"><a href="cipta-rph.php">PELAJARAN HARIAN</a></li>
                            <li class="breadcrumb-item active" aria-current="page">RANCANGAN SAYA</li>
                        </ol>
                    </nav>

                    <table class="table table-striped" id="table-content">
                        <thead>
                            <tr>
                                <th scope="col" class="nowrap-space">No.</th>
                                <th scope="col" class="nowrap-space cell-md">Tema</th>
                                <th scope="col" class="nowrap-space cell-md">Tajuk</th>
                                <th scope="col" class="nowrap-space">Tingkatan</th>
                                <th scope="col" class="nowrap-space">Kelas</th>
                                <th scope="col" class="nowrap-space">Subjek</th>
                                <th scope="col" class="nowrap-space">Tarikh</th>
                                <th scope="col" class="nowrap-space">Masa Mula</th>
                                <th scope="col" class="nowrap-space">Masa Akhir</th>
                                <th scope="col" class="nowrap-space">Minggu</th>
                                <th scope="col" class="nowrap-space cell-lg">Standard Kandungan</th>
                                <th scope="col" class="nowrap-space cell-lg">Standard Pembelajaran</th>
                                <th scope="col" class="nowrap-space cell-lg">Objektif Pembelajaran</th>
                                <th scope="col" class="nowrap-space cell-lg">Aktiviti Pembelajaran</th>
                                <th scope="col" class="nowrap-space cell-lg">BBM</th>
                                <th scope="col" class="nowrap-space">Refleksi</th>
                                <th scope="col" class="nowrap-space cell-md">Guru Penilai</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                if(!empty($dataset)){
                                    foreach($dataset as $key => $value){
                                        $collectBBM = [];
                                        $dataTingkatan = $API->fetchRow("SELECT * FROM tingkatan WHERE id = ".$value->id_tingkatan);
                                        $dataClassroom = $API->fetchRow("SELECT * FROM `kelas_lengkap` WHERE id = ".$value->id_kelasLengkap);
                                        $dataSubject   = $API->fetchRow("SELECT * FROM `tb_subjek` WHERE id = ".$value->id_subjek);
                                        $dataWeekSchool= $API->fetchRow("SELECT * FROM `rph_minggu` WHERE id_minggu = ".$value->minggu_sekolah);
                                        $dataReviewer  = $API->fetchRow("SELECT * FROM `pengguna` WHERE id = ".$value->penilai);
                                        $dataBBM       = $API->fetchRows("SELECT * FROM `tb_bbm` WHERE `id` IN ($value->bbm)");

                                        if(!empty($dataBBM)){
                                            foreach($dataBBM as $item){
                                                $collectBBM[] = $item->barang;
                                            }
                                        }
                                        $collectBBM = (!empty($collectBBM) ? implode(', ', $collectBBM) : '-');

                                        echo '<tr>
                                            <td class="nowrap-space">'.($key + 1).'</td>
                                            <td class="cell-md">'.$value->tema.'</td>
                                            <td class="cell-md">'.$value->tajuk.'</td>
                                            <td class="nowrap-space">'.$dataTingkatan->singkatan_tingkatan.'-'.$dataTingkatan->nama_tingkatan.'</td>
                                            <td class="nowrap-space">'.$dataClassroom->keterangan.'</td>
                                            <td class="nowrap-space">'.$dataSubject->subjek.'</td>
                                            <td class="nowrap-space">'.$value->tarikh.'</td>
                                            <td class="nowrap-space">'.$value->masa_mula.'</td>
                                            <td class="nowrap-space">'.$value->masa_tamat.'</td>
                                            <td class="nowrap-space">'.$dataWeekSchool->minggu.'</td>
                                            <td class="cell-lg">'.$value->standard_kandungan.'</td>
                                            <td class="cell-lg">'.$value->standard_pembelajaran.'</td>
                                            <td class="cell-lg">'.$value->objektif.'</td>
                                            <td class="cell-lg">'.$value->aktiviti.'</td>
                                            <td class="cell-lg">'.$collectBBM.'</td>
                                            <td>'.$value->refleksi.'</td>
                                            <td class="cell-md">'.$dataReviewer->fullname.'</td>
                                            <td>
                                                <a href="./cipta-rph.php?id='.$value->id.'"><button class="btn btn-success">Kemaskini</button></a>
                                            </td>
                                        </tr>';
                                    }
                                }else{
                                    echo '<tr><td colspan="15">Tiada maklumat</td></tr>';
                                }
                            ?>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
    </section>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/v/bs4/dt-1.13.4/datatables.min.js" defer></script>
    <script src="../../vendor/sweetalert/js/sweetalert.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../vendor/chipspicker/picker.min.js" defer></script>
    <script src="../../ckeditor/ckeditor.js"></script>
    <script src="../../assets/js/isotope.min.js"></script>
    <script src="../../assets/js/owl-carousel.js"></script>
    <script src="../../assets/js/lightbox.js"></script>
    <script src="../../assets/js/tabs.js"></script>
    <script src="../../assets/js/video.js"></script>
    <script src="../../assets/js/slick-slider.js"></script>
    <script src="../../assets/js/custom.js"></script>

    <script type = "text/javascript">
        $(document).ready(function () {
            $('#table-content').DataTable({
                responsive: true
            });
        });
    </script>
</body>
</html>