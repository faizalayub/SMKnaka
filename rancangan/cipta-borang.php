<!DOCTYPE html>
<html lang="en">

<head>
	<?php
        include '_API.php';
        include 'header.php';

		if(!isset($_SESSION['id'])){
			header("Location: ./index.php"); exit;
		}

		$API             = new Controller('RETURN');
		$id              = (isset($_GET['id']) ? $_GET['id'] : null);
		$mode            = (isset($_GET['id']) ? 'update' : 'create');
		$trigger         = (isset($_GET['trigger']) ? $_GET['trigger'] : null);
		$userRoleID      = $_SESSION['role'];
		$userSessionID   = $_SESSION['id'];
		$reviewerRole    = 5;
		$showReviewArea  = false;
		$dataset         = (object)[];
		$hiddenSection   = [];

		if(isset($_GET['copy'])){
			$mode = 'copy';
		}

		$iframeStyling = '
			<style>
				.header-page-title, .main .navbar, nav.sidebar, footer.footer, .button-footer-container, .pc-trigger {display: none !important;}
				.main-field-wrapper{padding: 0;pointer-events: none;}
			</style>
		';

		$viewStyling = '
			<style>
				.form-control {border-radius: 0px;border-top: none !important;border-left: none !important;border-right: none !important;}
				.pc-element .pc-close { opacity: 0 !important; padding: 0 8px 0 0 !important; }
				.cke_top.cke_reset_all { display: none; }
				.cke_contents.cke_reset iframe { border-left: none !important; }
			</style>
		';

		if($mode == 'update'){
			$dataset = $API->fetchRow("SELECT * FROM `rph_rancangan` WHERE id = ".$id);

			if(isset($_GET['review'])){ $mode = 'review'; }

			if(isset($_GET['preview'])){ $mode = 'preview'; }

			if(!empty($dataset->signature)){
				$dataset->signature = json_decode($dataset->signature);
			}

			//# Review mode
			//# PATH: cipta-borang.php?id=8&review&iframe
			if($mode == 'review'){
				$hiddenSection[] = 'GuruPenilai';
				$showReviewArea = true;

				if(isset($_GET['iframe'])){
					echo $iframeStyling;
				}
			}

			//# Form owner only can view completed review result
			//# PATH: cipta-borang.php?id=8&preview&iframe
			if($mode == 'preview'){
				if($userSessionID == $dataset->id_pengguna && $userSessionID != $dataset->penilai && $dataset->status_penilai == 1){
					$showReviewArea = true;
				}

				if(isset($_GET['iframe'])){
					echo $iframeStyling;
				}
			}
		}

		if($mode == 'copy'){
			$dataset = $API->fetchRow("SELECT * FROM `rph_copyvalue` WHERE id = ".$_GET['copy']);

			if(!empty($dataset)){
				$dataset = json_decode($dataset->json);
			}
		}

		switch($userRoleID){
			case 2: $reviewerRole = 5; break;
			case 5: $reviewerRole = 6; break;
		}

		if($mode == 'preview'){
			echo $viewStyling;
		}
    ?>

	<style>
		.form-style{
			background: var(--bs-light);
			border-radius: 3px;
			padding: 2em;
			border: solid 1px var(--bs-gray-200);
		}

		@media print {
			.onprint-hidden-section {
				display: none !important;
			}
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

					<div class="row mb-2 mb-xl-3">
						<div class="col-auto d-none d-sm-block h3 header-page-title">
							<strong>Cipta</strong> Perancangan Harian
						</div>

						<div class="onprint-hidden-section col-auto ms-auto text-end mt-n1">
							<?php
								if($mode != 'create' && $mode != 'copy'){
									echo '<button type="button" class="btn btn-light bg-white me-2" onclick="printForm()">Cetak Borang</button>';
								}

								if(!isset($_GET['iframe']) && !isset($_GET['copy'])){
									echo '<button type="button" class="btn btn-primary" onclick="copyForm()">Salin Borang</button>';
								}
							?>
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-xl-12">
							<div class="card m-0">
								<div class="card-body">
									<!-- #START form -->
									<form method="POST" class="content-loader py-4">

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TINGKATAN</label>
											<div class="col-sm-10">
												<select name="ref_school_level" id="tingkatan_id" class="form-control">
													<?php
													if((array)$dataset){
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

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">KELAS</label>
											<div class="col-sm-2">
												<select name="ref_classroom" id="kelasId" class="form-control" required>
													<?php
														if((array)$dataset){
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
														if((array)$dataset){
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

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
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

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">HARI</label>
											<div class="col-sm-2">
												<input id="date-selected-info" type="text" readonly value="-" class="form-control"/>
											</div>

											<label class="col-form-label col-sm-2 text-sm-end fw-bold">MINGGU</label>
											<div class="col-sm-6">
												<select name="ref_educationweek" class="form-control" required>
													<?php
														if((array)$dataset){
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

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TEMA</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_theme" type="text" required list="subject_theme" placeholder="Masukkan Tema Subjek" autocomplete="off" value="<?php echo (isset($dataset->tema) ? $dataset->tema : ''); ?>"/>
												<datalist id="subject_theme"></datalist>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">TAJUK</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_title" type="text" required list="subject_title" placeholder="Masukkan Tajuk Subjek" autocomplete="off" value="<?php echo (isset($dataset->tajuk) ? $dataset->tajuk : ''); ?>"/>
												<datalist id="subject_title"></datalist>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">STANDARD KANDUNGAN</label>
											<div class="col-sm-10">
												<input class="form-control" name="content_standard" list="content_standard" type="text" required placeholder="Masukkan Standard Kandungan" autocomplete="off" value="<?php echo (isset($dataset->standard_kandungan) ? $dataset->standard_kandungan : ''); ?>"/>
												<datalist id="content_standard"></datalist>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">STANDARD PEMBELAJARAN</label>
											<div class="col-sm-10">
												<input class="form-control" name="subject_standard" list="subject_standard" type="text" required placeholder="Masukkan Standard Pembelajaran" autocomplete="off" value="<?php echo (isset($dataset->standard_pembelajaran) ? $dataset->standard_pembelajaran : ''); ?>"/>
												<datalist id="subject_standard"></datalist>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">OBJEKTIF PEMBELAJARAN</label>
											<div class="col-sm-10">
												<span class="form-text text-muted">Di akhir pengajaran dan pembelajaran, murid dapat</span>
												<textarea name="subject_objective" id="editor-objektif" required></textarea>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">AKTIVITI PEMBELAJARAN</label>
											<div class="col-sm-10">
												<textarea name="subject_activity" id="editor-aktiviti" required></textarea>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">BBM</label>
											<div class="col-sm-10">
												<select name="bbm_picker" multiple>
													<option value="" disabled hidden>-- Pilih BBM --</option>
												</select>
												<input type="hidden" name="teaching_bbm" value=""/>
											</div>
										</div>

										<!-- Layer -->
										<div class="mb-3 row main-field-wrapper">
											<label class="col-form-label col-sm-2 text-sm-end fw-bold">REFLEKSI</label>
											<div class="col-sm-10">
												<input name="subject_outcomes" class="form-control" id="tema" type="text" required placeholder="Masukkan Refleksi" autocomplete="off" value="<?php echo (isset($dataset->refleksi) ? $dataset->refleksi : ''); ?>"/>
											</div>
										</div>

										<!-- Layer -->
										<?php if(!in_array("GuruPenilai", $hiddenSection)){ ?>
											<div class="mb-3 row main-field-wrapper">
												<label class="col-form-label col-sm-2 text-sm-end fw-bold">GURU PENILAI</label>
												<div class="col-sm-10">
													<select name="ref_reviewer" class="form-control" required>
														<?php
															if((array)$dataset){
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
										<?php } ?>

										<!-- Submit -->
										<div class="mb-3 row main-field-wrapper">
											<div class="col-sm-12 button-footer-container">
												<a href="lihat-borang.php">
													<button type="button" class="btn btn-outline-secondary">Kembali</button>
												</a>
												<button class="btn btn-success" type="submit" name="btnSimpan">Simpan RPH</button>
											</div>
										</div>

										<!-- Review Section -->
										<?php if($showReviewArea){ ?>
											<div class="border py-3 bg-secondary rounded">

												<div class="mb-3 row px-3">
													<span class="form-text text-center text-lg text-white fw-bold">Jawapan Penilaian</span>
													<span class="form-text text-center text-lg text-white">Sila baca dahulu sebelum beri penilaian</span>
												</div>
												
												<div class="mb-3 row px-3">
													<label class="col-form-label col-sm-2 text-sm-end fw-bold text-white">Tukar Status</label>
													<div class="col-sm-8">
														<select class="form-control" id="signature-status">
															<?php
																$statusCollection = $API->reviewStatus();

																foreach($statusCollection as $key => $value){
																	$selected = (isset($dataset->status_penilai) && ($dataset->status_penilai == $value->id) ? 'selected' : '');

																	echo "<option ".$selected." value='".$value->id."'>".$value->text."</option>";
																}
															?>
														</select>
													</div>
												</div>

												<div class="mb-3 row px-3">
													<label class="col-form-label col-sm-2 text-sm-end fw-bold text-white">Bagi Cadangan</label>
													<div class="col-sm-8">
														<textarea class="form-control" rows="2" placeholder="Tulis cadangan disini" id="signature-summary"><?php echo (isset($dataset->komen_penilai) ? $dataset->komen_penilai : ''); ?></textarea>
													</div>
												</div>

												<div class="mb-3 row px-3">
													<label class="col-form-label col-sm-2 text-sm-end fw-bold text-white">Tanda Tangan</label>
													<div class="col-sm-8">
														<canvas id="signature-wrapper" class="p-1 border-1 bg-white" style="border-radius: 3px;"></canvas><br>
														<button class="btn btn-secondary signature-clear" type="button">Padam Tanda Tangan</button>
													</div>
												</div>

												<div class="mb-3 row px-3">
													<label class="col-form-label col-sm-2 text-sm-end fw-bold text-white"></label>
													<div class="col-sm-8">
														<button class="btn btn-success signature-submit w-100" type="button">Hantar Penilaian</button>
													</div>
												</div>
											</div>
										<?php } ?>
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
	<script src="../vendor/signaturepad/signaturepad.min.js"></script>
    <script src="../vendor/chipspicker/picker.min.js" defer></script>
    <script src="../ckeditor/ckeditor.js"></script>

	<script type = "text/javascript">
		var formEl = $('form');
        var $mode = `<?php echo $mode; ?>`;
        var $trigger = `<?php echo $trigger; ?>`;
        var updateDataset  = JSON.parse(`<?php echo json_encode($dataset); ?>`);
		var FormToDB = {
			"ref_school_level" : "id_tingkatan",
			"ref_classroom"    : "id_kelasLengkap",
			"ref_subject"      : "id_subjek",
			"effective_date"   : "tarikh",
			"start_time"       : "masa_mula",
			"end_time"         : "masa_tamat",
			"subject_title"    : "tajuk",
			"ref_educationweek": "minggu_sekolah",
			"subject_theme"    : "tema",
			"content_standard" : "standard_kandungan",
			"subject_standard" : "standard_pembelajaran",
			"subject_objective": "objektif",
			"subject_activity" : "aktiviti",
			"teaching_bbm"     : "bbm",
			"subject_outcomes" : "refleksi",
			"ref_reviewer"     : "penilai",
		};

        let datalistTheme                = $('datalist[id="subject_theme"]');
        let datalistTitle                = $('datalist[id="subject_title"]');
        let datalistStandardKandungan    = $('datalist[id="content_standard"]');
        let datalistStandardPembelajaran = $('datalist[id="subject_standard"]');

        let dropdownEduLevel  = $('[name="ref_school_level"]');
        let dropdownClassroom = $('[name="ref_classroom"]');
        let dropdownSubject   = $('[name="ref_subject"]');
        let dropdownReviewer  = $('[name="ref_reviewer"]');
        let dropdownEduWeek   = $('[name="ref_educationweek"]');

        let subjectTheme      = $('[name="subject_theme"]');
        let subjectTitle      = $('[name="subject_title"]');
        let subjectSK         = $('[name="content_standard"]');
        let effectiveDate     = $('[name="effective_date"]');
        let dateInfoAlert     = $('#date-selected-info');
        let dayStringLabel    = ['Ahad', 'Isnin', 'Selasa', 'Rabu', 'Khamis', 'Jumaat', 'Sabtu'];

        let doRequest = function(param = {}, method = 'GET'){
            return new Promise(resolve => {
                $.ajax({
                    url: "_REQUEST.php",
                    type: method,
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

		let setupSubjectTitle = function(){
            subjectTitle.on('input', async function(e){
                let getKandungan = await doRequest({
					function: 'stdKandunganByTitle',
					title: e.target.value
				});

                datalistStandardKandungan.html('');

                getKandungan.forEach(c => {
                    datalistStandardKandungan.append(`<option value="${ c.standard_kandungan }">`);
                });
            });
        };

		let setupStandardKandungan = function(){
            subjectSK.on('input', async function(e){
                let response = await doRequest({
					function: 'stdPembelajaranByKandungan',
					title: e.target.value
				});

                datalistStandardPembelajaran.html('');

                response.forEach(c => {
                    datalistStandardPembelajaran.append(`<option value="${ c.standard_pembelajaran }">`);
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

		let setupSignature = function(){
			let signatureArea = $('#signature-wrapper');
			let signatureStatus = $('#signature-status');
			let signatureSummary = $('#signature-summary');
			let submitButton = $('.signature-submit');
			let clearButton = $('.signature-clear');

			if(signatureArea.length > 0){
				let signaturePad = new SignaturePad(signatureArea.get(0));

				clearButton.on('click', function(){
					signaturePad.clear();
				});

				submitButton.on('click', async function(){
					if(signatureStatus.val() == ''){
						alert('Status diperlukan'); return; 
					}

					if(signaturePad.isEmpty() == true){
						alert('Tanda tangan diperlukan'); return;
					}

					await doRequest({
						id: updateDataset.id,
						status: signatureStatus.val(),
						summary: signatureSummary.val(),
						function: 'saveReview',
						signature: JSON.stringify(signaturePad.toData())
					}, 'POST');

					swal({
						title: "Berjaya Disimpan",
						text: "Rekod penilaian berjaya disimpan",
						type: "success",
						showCancelButton: false,
						confirmButtonClass: "btn-success",
						confirmButtonText: "OK",
						closeOnConfirm: false
					},
					function(e){
						window.location.reload();
					});
				});

				if(updateDataset.signature){
					signaturePad.fromData(updateDataset.signature);
					signaturePad.off();
					signatureStatus.prop('disabled', true);
					signatureSummary.prop('disabled', true);
					submitButton.remove();
					clearButton.remove();
				}
			}
		};

		async function copyForm(windowtab = '_blank'){
			let { instances: ckEditorInstance } = CKEDITOR;
			let formArray = formEl.serializeArray();
			let formStructured = {};

			$.map(formArray, function(n, i){
				let props = FormToDB[n.name];
				let inputvalues = n.value;

				if(props == 'objektif' && ckEditorInstance['editor-objektif']){
                    inputvalues = ckEditorInstance['editor-objektif'].getData();
                }

                if(props == 'aktiviti' && ckEditorInstance['editor-aktiviti']){
                    inputvalues = ckEditorInstance['editor-aktiviti'].getData();
                }

				formStructured[props] = inputvalues;
			});

			let requestResult = await doRequest({
				function: 'copyForm',
				forminput: JSON.stringify(formStructured)
			}, 'POST');

			window.open(`${ window.location.pathname }?copy=${ requestResult }`, windowtab);
		}

		function printForm(){
			window.print();
		}

        $(document).ready(function(){
            CKEDITOR.replace('editor-objektif', {
				height: '80px',
			});

            CKEDITOR.replace('editor-aktiviti', {
				height: '150px',
			});

            if(['create'].includes($mode)){
                //# Dropdown Init (Tingkatan)
                setupLevelDropdown();

                //# Dropdown Init (Weeks)
                setupEducationWeekDropdown();

                //# Dropdown Init (Classroom)
                setupClassroomDropdown();

                //# Dropdown Init (Subject)
                setupSubjectDropdown();

				//# Datalist Init (Subject Title)
                setupSubjectTitle();

				//# Datalist Init (Standard Kandungan)
                setupStandardKandungan();
                
                //# Dropdown Init (Reviewer)
                setupReviewerDropdown();

                //# Datepicker Init (Effective Date)
                setupDatePicker();

                //# Selectpicker Init (BBM)
                setupBBM();
            }

            //# Update Mode
            if(['update','preview','review','copy'].includes($mode)){
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
				
				//# Datalist Init (Subject Title)
                setupSubjectTitle();

				//# Datalist Init (Standard Kandungan)
                setupStandardKandungan();

				//# Dropdown Init (Reviewer)
                setupReviewerDropdown();

                //# Datepicker Init (Effective Date)
                setupDatePicker();

                //# Selectpicker Init (BBM)
                setupBBM((updateDataset.bbm ?? ''));
            }

			//# Init Signature Pad
			setupSignature();

			setTimeout(function(){
				formEl.removeClass('content-loader');
			},600);

			//# Execute Trigger Click
			setTimeout(() => {
				if($trigger == 'copy'){
					copyForm('_self');
				}
			}, 800);
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

			if($mode == 'copy'){
				$dataset = null;
			}

			if((array)$dataset){
				//# Update Query
				$response = $API->runQuery("UPDATE `rph_rancangan` SET `id_kelasLengkap` = '$ref_classroom', `id_subjek` = '$ref_subject', `tarikh` = '$effective_date', `masa_mula` = '$start_time', `masa_tamat` = '$end_time', `tema` = '$subject_theme', `tajuk` = '$subject_title', `standard_kandungan` = '$content_standard', `standard_pembelajaran` = '$subject_standard', `objektif` = '$subject_objective', `aktiviti` = '$subject_activity', `refleksi` = '$subject_outcomes', `changes_date` = current_timestamp(), `BBM` = '$teaching_bbm', `penilai` = '$ref_reviewer', `minggu_sekolah` = '$ref_educationweek', `id_tingkatan` = '$ref_school_level', `komen_penilai` = '', `status_penilai` = '0', `signature` = NULL, `tarikh_penilai` = NULL WHERE `rph_rancangan`.`id` = ".$id);
			}else{
				//# Create Query
				if($mode == 'create' || $mode == 'copy'){
					$tableColumns = "`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `tarikh`, `masa_mula`, `masa_tamat`, `tema`, `tajuk`, `standard_kandungan`, `standard_pembelajaran`, `objektif`, `aktiviti`, `refleksi`, `bahan_bantuan`, `created_date`, `changes_date`, `bbm`, `penilai`, `minggu_sekolah`, `id_tingkatan`";
					
					$tableValues = "NULL, '$userSessionID', '$ref_classroom', '$ref_subject', '$effective_date', '$start_time', '$end_time', '$subject_theme', '$subject_title', '$content_standard', '$subject_standard', '$subject_objective', '$subject_activity', '$subject_outcomes', '', current_timestamp(), current_timestamp(), '$teaching_bbm', '$ref_reviewer', '$ref_educationweek', '$ref_school_level'";
	
					$response = $API->runQuery("INSERT INTO `rph_rancangan` ($tableColumns) VALUES ($tableValues)");
				}
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
									window.location.href="./cipta-borang.php";
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