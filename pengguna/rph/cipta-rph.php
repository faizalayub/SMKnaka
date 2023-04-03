<?php
    session_start();
    include '../../_API.php';
    require_once('../../panggil-database.php');

    $dataset = (object)[];
    $API           = new Controller('RETURN');
    $id            = (isset($_GET['id']) ? $_GET['id'] : null);
    $mode          = (isset($_GET['id']) ? 'update' : 'create');
    $userSessionID = $_SESSION['id'];

    if($mode == 'update'){
        $dataset = $API->fetchRow("SELECT * FROM `rph_rancangan` WHERE id = ".$id);
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

        <style>
            .form-style{
                background: var(--bs-light);
                border-radius: 3px;
                padding: 2em;
                border: solid 1px var(--bs-gray-200);
            }

            .button-footer-container{
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 1em;
                position: sticky;
                bottom: 0;
                background: var(--bs-light);
                z-index: 99;
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
                            <li class="breadcrumb-item active" aria-current="page">
                                <?php echo ($mode == 'create' ? 'RANCANGAN' : 'KEMASKINI');?>
                            </li>
                        </ol>
                    </nav>

                    <form class="form-group form-style" method="POST"> 
                        <table class="table">
                            <tr>
                                <th>TINGKATAN</th>
                                <td colspan="10">
                                    <select name="ref_school_level" id="tingkatan_id" class="form-control">
                                        <?php
                                        if($mode == 'update'){
                                            $options = $API->collectLevel();

                                            if(!empty($options)){
                                                array_unshift($options , (object)['id' => null]);

                                                foreach($options as $value){
                                                    $selected = (isset($dataset->id_tingkatan) && ($dataset->id_tingkatan == $value->id) ? 'selected' : '');

                                                    if($value->id == null){
                                                        echo "<option ".$selected." value=''>Pilih Tingkatan</option>";
                                                    }else{
                                                        echo "<option ".$selected." value='".$value->id."'>".$value->id."-".$value->nama_tingkatan ?? ''."</option>";
                                                    }
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>KELAS</th>
                                <td>
                                    <select name="ref_classroom" id="kelasId" class="form-control" required>
                                    <?php
                                        if($mode == 'update'){
                                            $options = $API->classroomByLevel((object)['id' => $dataset->id_tingkatan]);

                                            if(!empty($options)){
                                                array_unshift($options , (object)['id' => null]);

                                                foreach($options as $value){
                                                    $selected = (isset($dataset->id_kelasLengkap) && ($dataset->id_kelasLengkap == $value->id) ? 'selected' : '');

                                                    if($value->id == null){
                                                        echo "<option ".$selected." value=''>Pilih Tingkatan</option>";
                                                    }else{
                                                        echo "<option ".$selected." value='".$value->id."'>".$value->keterangan ?? ''."</option>";
                                                    }
                                                }
                                            }
                                        }
                                    ?>
                                    </select>
                                </td>
                                
                                <th>SUBJEK</th>
                                <td colspan="10">
                                    <select name="ref_subject" id="subjek" class="form-control" required>
                                    <?php
                                        if($mode == 'update'){
                                            $options = $API->subjectByLevel((object)['id' => $dataset->id_tingkatan]);

                                            if(!empty($options)){
                                                array_unshift($options , (object)['id' => null]);

                                                foreach($options as $value){
                                                    $selected = (isset($dataset->id_subjek) && ($dataset->id_subjek == $value->id) ? 'selected' : '');

                                                    if($value->id == null){
                                                        echo "<option ".$selected." value=''>Pilih Subjek</option>";
                                                    }else{
                                                        echo "<option ".$selected." value='".$value->id."'>".$value->subjek ?? ''."</option>";
                                                    }
                                                }
                                            }
                                        }
                                    ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>TARIKH</th>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text fas fa-calendar"></span>
                                        </div>
                                        <input type="date" name="effective_date" class="form-control" required value="<?php echo (isset($dataset->tarikh) ? $dataset->tarikh : ''); ?>"/>
                                    </div>
                                </td>

                                <th>MASA MULA</th>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text fas fa-clock"></span>
                                        </div>
                                        <input type="time" name="start_time" class="form-control" placeholder="Masa Mula" required value="<?php echo (isset($dataset->masa_mula) ? $dataset->masa_mula : ''); ?>"/>
                                    </div>
                                </td>

                                <th>MASA AKHIR</th>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text fas fa-clock"></span>
                                        </div>
                                        <input type="time" name="end_time" class="form-control" placeholder="Masa Tamat" required value="<?php echo (isset($dataset->masa_tamat) ? $dataset->masa_tamat : ''); ?>"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>MINGGU</th>
                                <td>
                                    <select name="ref_educationweek" class="form-control" required>
                                    <?php
                                        if($mode == 'update'){
                                            $options = $API->collectEducationWeeks();

                                            if(!empty($options)){
                                                array_unshift($options , (object)['id_minggu' => null]);

                                                foreach($options as $value){
                                                    $selected = (isset($dataset->minggu_sekolah) && ($dataset->minggu_sekolah == $value->id_minggu) ? 'selected' : '');

                                                    if($value->id_minggu == null){
                                                        echo "<option ".$selected." value=''>Pilih Subjek</option>";
                                                    }else{
                                                        echo "<option ".$selected." value='".$value->id_minggu."'>".$value->minggu ?? ''."</option>";
                                                    }
                                                }
                                            }
                                        }
                                    ?>
                                    </select>
                                </td>
                                
                                <th>HARI</th>
                                <td colspan="10">
                                    <input id="date-selected-info" type="text" readonly value="-" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>TEMA</th>
                                <td colspan="10">
                                    <input class="form-control" name="subject_theme" type="text" required list="subject_theme" placeholder="Masukkan Tema Subjek" autocomplete="off" value="<?php echo (isset($dataset->tema) ? $dataset->tema : ''); ?>"/>
                                    <datalist id="subject_theme"></datalist>
                                </td>
                            </tr>
                                <tr>
                                <th>TAJUK</th>
                                <td colspan="10">
                                    <input class="form-control" name="subject_title" type="text" required list="subject_title" placeholder="Masukkan Tajuk Subjek" autocomplete="off" value="<?php echo (isset($dataset->tajuk) ? $dataset->tajuk : ''); ?>"/>
                                    <datalist id="subject_title"></datalist>
                                </td>
                            </tr>
                            <tr>
                                <th>STANDARD KANDUNGAN</th>
                                <td colspan="10">
                                    <input class="form-control" name="content_standard" type="text" required placeholder="Masukkan Standard Kandungan" autocomplete="off" value="<?php echo (isset($dataset->standard_kandungan) ? $dataset->standard_kandungan : ''); ?>"/>
                                </td>
                            </tr> 
                            <tr>
                                <th>STANDARD PEMBELAJARAN</th>
                                <td colspan="10">
                                <input class="form-control" name="subject_standard" type="text" required placeholder="Masukkan Standard Pembelajaran" autocomplete="off" value="<?php echo (isset($dataset->standard_pembelajaran) ? $dataset->standard_pembelajaran : ''); ?>"/>
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
                                <th>BBM</th>
                                <td colspan="10">
                                    <select name="bbm_picker" multiple>
                                        <option value="" disabled hidden>-- Pilih BBM --</option>
                                    </select>
                                    <input type="hidden" name="teaching_bbm" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <th>REFLEKSI</th>
                                <td colspan="10">
                                    <input name="subject_outcomes" class="form-control" id="tema" type="text" required placeholder="Masukkan Refleksi" autocomplete="off" value="<?php echo (isset($dataset->refleksi) ? $dataset->refleksi : ''); ?>"/>
                                </td>
                            </tr>
                            <tr>
                                <th>GURU PENILAI</th>
                                <td colspan="10">
                                    <select name="ref_reviewer" class="form-control" required>
                                    <?php
                                        if($mode == 'update'){
                                            $options = $API->usersByRole((object)['role' => 2]);

                                            if(!empty($options)){
                                                array_unshift($options , (object)['id' => null]);

                                                foreach($options as $value){
                                                    $selected = (isset($dataset->penilai) && ($dataset->penilai == $value->id) ? 'selected' : '');

                                                    if($value->id == null){
                                                        echo "<option ".$selected." value=''>Pilih Penilai</option>";
                                                    }else{
                                                        echo "<option ".$selected." value='".$value->id."'>".$value->fullname ?? ''."</option>";
                                                    }
                                                }
                                            }
                                        }
                                    ?>
                                    </select>
                                </td>
                            </tr>
                        </table>

                        <div class="button-footer-container">
                            <button class="btn btn-success" type="submit" name="btnSimpan"> Simpan RPH </button>
                        </div>
                    </form>  
                </div>
            </div>

        </div>
    </section>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="../../vendor/jquery/jquery.min.js"></script>
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
        var $mode = `<?php echo $mode; ?>`;
        var updateDataset  = JSON.parse(`<?php echo json_encode($dataset); ?>`);

        let datalistTheme  = $('datalist[id="subject_theme"]');
        let datalistTitle  = $('datalist[id="subject_title"]');

        let dropdownEduLevel  = $('[name="ref_school_level"]');
        let dropdownClassroom = $('[name="ref_classroom"]');
        let dropdownSubject   = $('[name="ref_subject"]');
        let dropdownReviewer  = $('[name="ref_reviewer"]');
        let dropdownEduWeek   = $('[name="ref_educationweek"]');

        let subjectTheme      = $('[name="subject_theme"]');
        let subjectTitle      = $('[name="subject_title"]');
        let effectiveDate     = $('[name="effective_date"]');
        let dateInfoAlert     = $('#date-selected-info');
        let dayStringLabel    = ['Ahad', 'Isnin', 'Selasa', 'Rabu', 'Khamis', 'Jumaat', 'Sabtu'];

        let doRequest = function(param = {}){
            return new Promise(resolve => {
                $.ajax({
                    url: "../../_REQUEST.php",
                    type: 'GET',
                    data: { ...param },
                    success: function({ data }){
                        resolve(data);
                    }
                })
            })
        };
        
        let setupReviewerDropdown = function(){
            dropdownReviewer.html('');

            dropdownReviewer.append(`<option selected value=''>Pilih Guru Penilai</option>`);

            doRequest({ function: 'usersByRole', role: 2 }).then(collect => {
                collect.forEach(c => {
                    dropdownReviewer.append(`<option value="${ c.id }">${ c.fullname }</option>`);
                })
            });
        };

        let setupEducationWeekDropdown = function(){
            dropdownEduWeek.html('');

            dropdownEduWeek.append(`<option selected value=''>Pilih Minggu</option>`);

            doRequest({ function: 'collectEducationWeeks' }).then(collect => {
                collect.forEach(c => {
                    dropdownEduWeek.append(`<option value="${ c.id_minggu }">${ c.minggu }</option>`);
                })
            });
        };

        let setupLevelDropdown = function(package = true){
            if(package){
                dropdownEduLevel.append(`<option selected value=''>Pilih Tingkatan</option>`);
                dropdownClassroom.append(`<option selected value=''>Pilih Kelas</option>`);
                dropdownSubject.append(`<option selected value=''>Pilih Subjek</option>`);
            }

            dropdownEduLevel.on('change', async function(e){
                let value = e.target.value;
                let getClassroom = await doRequest({ function: 'classroomByLevel', id: value });

                subjectTheme.val('');
                subjectTitle.val('');
                dropdownSubject.html('');
                dropdownClassroom.html('');

                getClassroom.forEach(c => {
                    dropdownClassroom.append(`<option value="${ c.id }">${ c.keterangan }</option>`);
                });

                dropdownClassroom.trigger('change');
            });

            if(package){
                doRequest({ function: 'collectLevel' }).then(collect => {
                    collect.forEach(c => {
                        dropdownEduLevel.append(`<option value="${ c.id }">${ c.id } - ${ c.nama_tingkatan }</option>`);
                    })
                });
            }
        };

        let setupClassroomDropdown = function(){
            dropdownClassroom.on('change', async function(e){
                let value = e.target.value;
                let getSubjects = await doRequest({ function: 'subjectByLevel', id: dropdownEduLevel.val() });

                dropdownSubject.html('');

                getSubjects.forEach(c => {
                    dropdownSubject.append(`<option value="${ c.id }">${ c.subjek }</option>`);
                })
            });
        };

        let setupSubjectDropdown = function(){
            dropdownSubject.on('change', async function(e){
                let value = e.target.value;
                let getTheme = await doRequest({ function: 'themeBySubject', level: dropdownEduLevel.val(), subject: dropdownSubject.val() });
                let getTitle = await doRequest({ function: 'titleBySubject', level: dropdownEduLevel.val(), subject: dropdownSubject.val() });

                datalistTheme.html('');
                datalistTitle.html('');

                getTheme.forEach(c => {
                    datalistTheme.append(`<option value="${ c.tema }">`);
                });

                getTitle.forEach(c => {
                    datalistTitle.append(`<option value="${ c.tajuk }">`);
                });
            });
        };

        let setupDatePicker = function(){
            effectiveDate.on('change', function(e){
                let dateModel = e.target.value; 

                if(!dateModel || dateModel == ''){
                    dateInfoAlert.val('-');
                }else{
                    let $dateObject = moment(dateModel, 'YYYY-MM-DD');
                    let $day        = $dateObject.format('d');
                    let $weekNumber = $dateObject.week();

                    dateInfoAlert.val(dayStringLabel[$day]);
                }
            });

            effectiveDate.trigger('change');
        };

        let setupBBM = async function(){
            //# https://picker.uhlir.dev/
            let getBBM = await doRequest({ function: 'collectBBM' });

            getBBM.forEach(c => {
                $('[name="bbm_picker"]').append(`<option value="${ c.id }">${ c.barang }</option>`);
            });

            let instance = $('[name="bbm_picker"]').picker();

            instance.on('sp-change', function(){
                $('[name="teaching_bbm"]').val(instance.val().join(','));
            });
        };

        $(document).ready(function(){
            CKEDITOR.replace('editor-objektif');

            CKEDITOR.replace('editor-aktiviti');

            if($mode == 'create'){
                //# Dropdown Init (Tingkatan)
                setupLevelDropdown();

                //# Dropdown Init (Weeks)
                setupEducationWeekDropdown();

                //# Dropdown Init (Classroom)
                setupClassroomDropdown();

                //# Dropdown Init (Subject)
                setupSubjectDropdown();
                
                //# Dropdown Init (Reviewer)
                setupReviewerDropdown();

                //# Datepicker Init (Effective Date)
                setupDatePicker();

                //# Selectpicker Init (BBM)
                setupBBM();
            }

            //# Update Mode
            if($mode == 'update'){
                let { instances: ckEditorInstance } = CKEDITOR;

                if(ckEditorInstance['editor-objektif']){
                    ckEditorInstance['editor-objektif'].setData(updateDataset.objektif);
                }

                if(ckEditorInstance['editor-aktiviti']){
                    ckEditorInstance['editor-aktiviti'].setData(updateDataset.aktiviti);
                }

                //# Dropdown Init (Tingkatan)
                setupLevelDropdown(false);

                //# Dropdown Init (Classroom)
                setupClassroomDropdown();

                //# Dropdown Init (Subject)
                setupSubjectDropdown();

                //# Datepicker Init (Effective Date)
                setupDatePicker();

                //# Selectpicker Init (BBM)
                setupBBM();
            }
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
            $teaching_bbm      = (isset($_POST['teaching_bbm']) ? $_POST['teaching_bbm'] : []);
            $ref_reviewer      = (isset($_POST['ref_reviewer']) ? $_POST['ref_reviewer'] : '');
            $ref_educationweek = (isset($_POST['ref_educationweek']) ? $_POST['ref_educationweek'] : '');
            $subject_theme     = (isset($_POST['subject_theme']) ? $_POST['subject_theme'] : '');
            $subject_title     = (isset($_POST['subject_title']) ? $_POST['subject_title'] : '');
            $content_standard  = (isset($_POST['content_standard']) ? $_POST['content_standard'] : '');
            $subject_standard  = (isset($_POST['subject_standard']) ? $_POST['subject_standard'] : '');
            $subject_objective = (isset($_POST['subject_objective']) ? $_POST['subject_objective'] : '');
            $subject_activity  = (isset($_POST['subject_activity']) ? $_POST['subject_activity'] : '');
            $subject_outcomes  = (isset($_POST['subject_outcomes']) ? $_POST['subject_outcomes'] : '');
    
            $tableColumns = "`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `tarikh`, `masa_mula`, `masa_tamat`, `tema`, `tajuk`, `standard_kandungan`, `standard_pembelajaran`, `objektif`, `aktiviti`, `refleksi`, `bahan_bantuan`, `created_date`, `changes_date`, `bbm`, `penilai`, `minggu_sekolah`, `id_tingkatan`";
            
            $tableValues = "NULL, '$userSessionID', '$ref_classroom', '$ref_subject', '$effective_date', '$start_time', '$end_time', '$subject_theme', '$subject_title', '$content_standard', '$subject_standard', '$subject_objective', '$subject_activity', '$subject_outcomes', '', current_timestamp(), current_timestamp(), '$teaching_bbm', '$ref_reviewer', '$ref_educationweek', '$ref_school_level'";
    
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