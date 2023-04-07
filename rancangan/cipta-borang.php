<!DOCTYPE html>
<html lang="en">

<head>
	<?php
        include '_API.php';
        include 'header.php';

		if(!isset($_SESSION['id'])){
			header("Location: ./index.php"); exit;
		}

		$dataset = (object)[];
		$API           = new Controller('RETURN');
		$id            = (isset($_GET['id']) ? $_GET['id'] : null);
		$mode          = (isset($_GET['id']) ? 'update' : 'create');
		$userSessionID = $_SESSION['id'];
		$userRoleID    = $_SESSION['role'];
		$reviewerRole  = 5;

		if($mode == 'update'){
			$dataset = $API->fetchRow("SELECT * FROM `rph_rancangan` WHERE id = ".$id);
		}

		switch($userRoleID){
			case 2: $reviewerRole = 5; break;
			case 5: $reviewerRole = 6; break;
		}
    ?>

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
			gap: 1rem;
		}

		.content-loader{
			position: relative;
		}

		.content-loader:after{
			content: 'Sila Tunggu';
			display: flex;
			align-items: start;
			padding: 1rem;
			justify-content: center;
			height: 100%;
			width: 100%;
			position: absolute;
			background: var(--bs-white);
			z-index: 999;
			top: 0;
			left: 0;
		}
	</style>

	<link href="../vendor/chipspicker/picker.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<?php include 'sidebar.php'; ?>

		<div class="main">
			<?php include 'top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<strong>Cipta</strong> Perancangan Harian
					</h1>

					<div class="row">
						<div class="col-12 col-xl-12">
							<div class="card">
								<div class="card-body">
									<!-- #START form -->
									<form method="POST" class="content-loader">

										<!-- Level 1 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TINGKATAN</label>
											<div class="col-sm-10">
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
											</div>
										</div>
										
										<!-- Level 2 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">KELAS</label>
											<div class="col-sm-2">
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
											</div>

											<label class="col-form-label col-sm-2 text-sm-end fw-bold">SUBJEK</label>
											<div class="col-sm-6">
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
											</div>
										</div>

										<!-- Level 3 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TARIKH</label>
											<div class="col-sm-2">
												<input type="date" name="effective_date" class="form-control" required value="<?php echo (isset($dataset->tarikh) ? $dataset->tarikh : ''); ?>"/>
											</div>

											<label class="col-form-label col-sm-2 text-sm-end fw-bold">MASA MULA</label>
											<div class="col-sm-2">
												<input type="time" name="start_time" class="form-control" placeholder="Masa Mula" required value="<?php echo (isset($dataset->masa_mula) ? $dataset->masa_mula : ''); ?>"/>
											</div>

											<label class="col-form-label col-sm-2 text-sm-end fw-bold">MASA AKHIR</label>
											<div class="col-sm-2">
												<input type="time" name="end_time" class="form-control" placeholder="Masa Tamat" required value="<?php echo (isset($dataset->masa_tamat) ? $dataset->masa_tamat : ''); ?>"/>
											</div>
										</div>

										<!-- Level 4 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">HARI</label>
											<div class="col-sm-2">
												<input id="date-selected-info" type="text" readonly value="-" class="form-control"/>
											</div>

											<label class="col-form-label col-sm-2 text-sm-end fw-bold">MINGGU</label>
											<div class="col-sm-6">
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
											</div>
										</div>

										<!-- Level 5 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TEMA</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_theme" type="text" required list="subject_theme" placeholder="Masukkan Tema Subjek" autocomplete="off" value="<?php echo (isset($dataset->tema) ? $dataset->tema : ''); ?>"/>
												<datalist id="subject_theme"></datalist>
											</div>
										</div>

										<!-- Level 6 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TAJUK</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_title" type="text" required list="subject_title" placeholder="Masukkan Tajuk Subjek" autocomplete="off" value="<?php echo (isset($dataset->tajuk) ? $dataset->tajuk : ''); ?>"/>
												<datalist id="subject_title"></datalist>
											</div>
										</div>

										<!-- Level 7 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">STANDARD KANDUNGAN</label>
											<div class="col-sm-10">
												<input class="form-control" name="content_standard" type="text" required placeholder="Masukkan Standard Kandungan" autocomplete="off" value="<?php echo (isset($dataset->standard_kandungan) ? $dataset->standard_kandungan : ''); ?>"/>
											</div>
										</div>

										<!-- Level 8 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">STANDARD PEMBELAJARAN</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_standard" type="text" required placeholder="Masukkan Standard Pembelajaran" autocomplete="off" value="<?php echo (isset($dataset->standard_pembelajaran) ? $dataset->standard_pembelajaran : ''); ?>"/>
											</div>
										</div>

										<!-- Level 9 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">OBJEKTIF PEMBELAJARAN</label>
											<div class="col-sm-10">
												<span class="form-text text-muted">Di akhir pengajaran dan pembelajaran, murid dapat</span>
												<textarea name="subject_objective" id="editor-objektif" required></textarea>
											</div>
										</div>

										<!-- Level 10 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">AKTIVITI PEMBELAJARAN</label>
											<div class="col-sm-10">
												<textarea name="subject_activity" id="editor-aktiviti" required></textarea>
											</div>
										</div>

										<!-- Level 11 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">BBM</label>
											<div class="col-sm-10">
												<select name="bbm_picker" multiple>
													<option value="" disabled hidden>-- Pilih BBM --</option>
												</select>
												<input type="hidden" name="teaching_bbm" value=""/>
											</div>
										</div>

										<!-- Level 12 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">REFLEKSI</label>
											<div class="col-sm-10">
												<input name="subject_outcomes" class="form-control" id="tema" type="text" required placeholder="Masukkan Refleksi" autocomplete="off" value="<?php echo (isset($dataset->refleksi) ? $dataset->refleksi : ''); ?>"/>
											</div>
										</div>

										<!-- Level 13 -->
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">GURU PENILAI</label>
											<div class="col-sm-10">
												<select name="ref_reviewer" class="form-control" required>
													<?php
														if($mode == 'update'){
															$options = $API->usersByRole((object)['role' => $reviewerRole]);

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
											</div>
										</div>

										<!-- Submit -->
										<div class="mb-3 row">
											<div class="col-sm-12 button-footer-container">
												<a href="lihat-borang.php">
													<button type="button" class="btn btn-outline-secondary">Kembali</button>
												</a>
												<button class="btn btn-success" type="submit" name="btnSimpan">Simpan RPH</button>
											</div>
										</div>
									</form>
									<!-- #END form -->
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			<?php include 'footer.php'; ?>
		</div>
	</div>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/chipspicker/picker.min.js" defer></script>
    <script src="../ckeditor/ckeditor.js"></script>

	<script type = "text/javascript">
		var formEl = $('form');
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
                    url: "_REQUEST.php",
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

            doRequest({ function: 'usersByRole', role: <?php echo $reviewerRole; ?> }).then(collect => {
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

        let setupBBM = async function(value = ''){
            //# https://picker.uhlir.dev/
            let getBBM = await doRequest({ function: 'collectBBM' });

            getBBM.forEach(c => {
                $('[name="bbm_picker"]').append(`<option value="${ c.id }">${ c.barang }</option>`);
            });

            let instance = $('[name="bbm_picker"]').picker();

            instance.on('sp-change', function(){
                $('[name="teaching_bbm"]').val(instance.val().join(','));
            });

			value.split(',').forEach(op => {
				$('[name="bbm_picker"]').picker('set', +op);
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

				//# Dropdown Init (Reviewer)
                setupReviewerDropdown();

                //# Datepicker Init (Effective Date)
                setupDatePicker();

                //# Selectpicker Init (BBM)
                setupBBM((updateDataset.bbm ?? ''));
            }

			setTimeout(function(){
				formEl.removeClass('content-loader');
			},300);
        });
    </script>

    <?php
        if(isset($_POST['btnSimpan'])){
			$response;
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

			if($mode == 'create'){
				$tableColumns = "`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `tarikh`, `masa_mula`, `masa_tamat`, `tema`, `tajuk`, `standard_kandungan`, `standard_pembelajaran`, `objektif`, `aktiviti`, `refleksi`, `bahan_bantuan`, `created_date`, `changes_date`, `bbm`, `penilai`, `minggu_sekolah`, `id_tingkatan`";
				
				$tableValues = "NULL, '$userSessionID', '$ref_classroom', '$ref_subject', '$effective_date', '$start_time', '$end_time', '$subject_theme', '$subject_title', '$content_standard', '$subject_standard', '$subject_objective', '$subject_activity', '$subject_outcomes', '', current_timestamp(), current_timestamp(), '$teaching_bbm', '$ref_reviewer', '$ref_educationweek', '$ref_school_level'";

				$response = $API->runQuery("INSERT INTO `rph_rancangan` ($tableColumns) VALUES ($tableValues)");
			}

			if($mode == 'update'){
				$response = $API->runQuery("UPDATE `rph_rancangan` SET `id_kelasLengkap` = '$ref_classroom', `id_subjek` = '$ref_subject', `tarikh` = '$effective_date', `masa_mula` = '$start_time', `masa_tamat` = '$end_time', `tema` = '$subject_theme', `tajuk` = '$subject_title', `standard_kandungan` = '$content_standard', `standard_pembelajaran` = '$subject_standard', `objektif` = '$subject_objective', `aktiviti` = '$subject_activity', `refleksi` = '$subject_outcomes', `changes_date` = current_timestamp(), `BBM` = '$teaching_bbm', `penilai` = '$ref_reviewer', `minggu_sekolah` = '$ref_educationweek', `id_tingkatan` = '$ref_school_level'WHERE `rph_rancangan`.`id` = ".$id);
			}

            if($response){
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
									window.location.reload();
								}else{
									window.location.href="./lihat-borang.php";
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