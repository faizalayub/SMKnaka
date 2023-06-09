<!DOCTYPE html>
<html lang="en">

<head>
	<?php
        include '_API.php';
        include 'header.php';

		if(!isset($_SESSION['id'])){
			header("Location: ./index.php"); exit;
		}

		$dataset       = (object)[];
		$API           = new Controller('RETURN');
		$userSessionID = $_SESSION['id'];
		$dataset       = $API->fetchRows("SELECT * FROM `rph_rancangan` WHERE id_pengguna = ".$userSessionID." ORDER BY `tarikh` DESC");
    ?>

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

		.td-sticky{
			position: sticky;
			right: 0;
			background: #fff !important;
			border-left: solid 1px var(--bs-border-color) !important;
		}

		#datatables-orders_wrapper > .row:first-child{
			border-bottom: solid 1px var(--bs-gray-200);
    		padding: 0 0 1em 0;
		}

		#datatables-orders_wrapper > .row:last-child{
			border-top: solid 1px var(--bs-gray-200);
    		padding: 1em 0 0 0;
		}
    </style>
</head>

<body>
	<div class="wrapper">
		<?php include 'sidebar.php'; ?>

		<div class="main">
			<?php include 'top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Paparan</strong> Peracangan Harian</h1>

					<div class="row">
						<div class="col-12 col-xl-12">
							<div class="card">
								<!-- #START table -->
								<div class="card-body table-responsive rounded">
									<table class="table mb-0" id="datatables-orders">
									<thead>
										<tr>
											<th scope="col" class="nowrap-space">No.</th>
											<th scope="col" class="nowrap-space cell-md">Status</th>
											<th scope="col" class="nowrap-space">Minggu</th>
											<th scope="col" class="nowrap-space">Tingkatan</th>
											<th scope="col" class="nowrap-space">Kelas</th>
											<th scope="col" class="nowrap-space">Subjek</th>
											<th scope="col" class="nowrap-space">Tarikh</th>
											<th scope="col" class="nowrap-space cell-md">Guru Penilai</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<?php
											if((array)$dataset){
												foreach($dataset as $key => $value){
													$collectBBM    = [];
													$updateButton  = '';
													$statusPenilai = $API->reviewStatus($value->status_penilai);
													$dataTingkatan = $API->fetchRow("SELECT * FROM tingkatan WHERE id = ".$value->id_tingkatan);
													$dataClassroom = $API->fetchRow("SELECT * FROM `kelas_lengkap` WHERE id = ".$value->id_kelasLengkap);
													$dataSubject   = $API->fetchRow("SELECT * FROM `tb_subjek` WHERE id = ".$value->id_subjek);
													$dataWeekSchool= $API->fetchRow("SELECT * FROM `rph_minggu` WHERE id_minggu = ".$value->minggu_sekolah);
													$dataReviewer  = $API->fetchRow("SELECT * FROM `pengguna` WHERE id = ".$value->penilai);

													$updateButton .= '<a href="#" onclick="toggleReview('.$value->id.')" class="p-2 rounded bg-info text-white" title="Lihat Borang"><i class="align-middle" data-feather="eye"></i></a> ';

													if($value->status_penilai != 1){
														$updateButton .= '<a href="./cipta-borang.php?id='.$value->id.'" class="p-2 rounded bg-primary text-white" title="Kemaskini Borang"><i class="align-middle" data-feather="edit-2"></i></a> ';
													}

													$updateButton .= '<a href="./cipta-borang.php?id='.$value->id.'&trigger=copy" class="p-2 rounded bg-warning text-white" title="Salin Borang"><i class="align-middle" data-feather="copy"></i></a> ';

													if(!empty($value->bbm)){
														$dataBBM = $API->fetchRows("SELECT * FROM `tb_bbm` WHERE `id` IN ($value->bbm)");

														if(!empty($dataBBM)){
															foreach($dataBBM as $item){
																$collectBBM[] = $item->barang;
															}
														}
														$collectBBM = (!empty($collectBBM) ? implode(', ', $collectBBM) : '-');
													}else{
														$collectBBM = '-';
													}

													echo '<tr>
														<td class="nowrap-space">'.($key + 1).'</td>
														<td><a href="#" class="badge '.$statusPenilai->color.' me-1 my-1">'.$statusPenilai->text.'</a></td>
														<td class="nowrap-space">'.$dataWeekSchool->minggu.'</td>
														<td class="nowrap-space">'.$dataTingkatan->singkatan_tingkatan.'-'.$dataTingkatan->nama_tingkatan.'</td>
														<td class="nowrap-space">'.$dataClassroom->keterangan.'</td>
														<td class="nowrap-space">'.$dataSubject->subjek.'</td>
														<td class="nowrap-space">'.$value->tarikh.'</td>
														<td class="cell-md">'.$dataReviewer->fullname.'</td>
														<td class="table-action">'.$updateButton.'</td>
													</tr>';
												}
											}else{
												echo '<tr><td colspan="15">Tiada maklumat</td></tr>';
											}
										?>
									</tbody>
									</table>
								</div>
								<!-- #END table -->
							</div>
						</div>
					</div>

				</div>
			</main>

			<div class="modal fade" id="previewFormModal" tabindex="-1" aria-modal="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title fw-bold">Semak Dan Nilai Borang</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body p-0">
							<iframe id="iframe-target" src="./cipta-borang.php?id=8&review" class="w-100" style="height: 80svh;"></iframe>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>

			<?php include 'footer.php'; ?>
		</div>
	</div>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script>
		let $modal = $('#previewFormModal');
		let tableDataCount = "<?php echo ((array)$dataset ? 1 : 0); ?>";

		function toggleReview(id){
			$modal.find('#iframe-target').attr('src', `./cipta-borang.php?id=${id}&preview&iframe`);
			$modal.modal('toggle');
		}

		document.addEventListener("DOMContentLoaded", function() {
			let groupColumn = 6;

			if(tableDataCount == 1){
				$("#datatables-orders").DataTable({
					ordering: false,
					responsive: false,
					order: [[groupColumn, 'desc']],
					columnDefs: [{ visible: false, targets: groupColumn }],
					displayLength: 25,
					drawCallback: function (settings) {
						let api = this.api();
						let rows = api.rows({ page: 'current' }).nodes();
						let last = null;
			
						api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
							if(last !== group){
								$(rows).eq(i).before(`<tr class="group"><td colspan="9" class="bg-light py-1 px-3 text-mute text-sm">${ moment(group, 'YYYY-MM-DD').format('DD MMM, YYYY') }</td></tr>`);
		
								last = group;
							}
						});
					}
				});
			}
		});
	</script>
</body>

</html>