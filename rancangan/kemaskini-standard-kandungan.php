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
		$userRole      = $_SESSION['role'];
		$dataset       = $API->fetchRows("SELECT * FROM `tb_standard_kandungan`");
    ?>
</head>

<body>
	<div class="wrapper">
		<?php include 'sidebar.php'; ?>

		<div class="main">
			<?php include 'top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Kemaskini</strong> Standard Kandungan</h1>

                    <div class="row">
						<div class="col-12 col-xl-12">
							<!--#START Breadcrumbs -->
							<div class="card">
								<div class="card-body pb-0 pt-3">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="cipta-borang.php">Cipta Borang</a></li>
											<li class="breadcrumb-item active">Kemaskini Senarai Standard Kandungan</li>
										</ol>
									</nav>
								</div>
							</div>
							<!--#END Breadcrumbs -->
						</div>
					</div>

                    <div class="row">
						<div class="col-12 col-xl-12">
							<!--#START Table List -->
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">Senarai Standard Kandungan</h5>
									<h6 class="card-subtitle text-muted">Senarai standard kandungan yang telah diisi & digunapakai di dalam cipta borang</h6>
								</div>
								<div class="card-body table-responsive p-0 vh-50">
									<table class="table">
										<thead class="position-sticky top-0 bg-white">
											<tr>
												<th>No.</th>
												<th>Standard Kandungan</th>
												<th>Subjek</th>
												<th>Tingkatan</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<?php
												if(!empty($dataset)){
													foreach($dataset as $key => $item){
														echo '
														<tr>
															<td>'.($key + 1).'</td>
															<td>'.$item->standard_kandungan.'</td>
															<td>'.$item->id_subjek.'</td>
															<td>'.$item->id_tingkatan.'</td>
															<td class="d-flex gap-2">
																<a href="#">
																	<i class="align-middle" data-feather="edit-2"></i>
																</a>
																<a href="#">
																	<i class="align-middle" data-feather="trash"></i>
																</a>
															</td>
														</tr>
														';
													}
												}else{
													echo '<tr><td colspan="5">Tiada Rekod</td></tr>';
												}
											?>
										</tbody>
									</table>
								</div>
								<div class="card-footer">
									<h6 class="card-subtitle text-muted">Menunjukkan <?php echo count($dataset); ?> senarai standard kandungan secara keseluruhan</h6>
								</div>
							</div>
							<!--#END Table List -->
                        </div>
                    </div>

				</div>
			</main>

			<?php include 'footer.php'; ?>
		</div>
	</div>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
</body>

</html>