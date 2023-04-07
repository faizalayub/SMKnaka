<!DOCTYPE html>
<html lang="en">

<head>
	<?php
        include '_API.php';
        include 'header.php';

		if(!isset($_SESSION['id'])){
			header("Location: ./index.php"); exit;
		}
    ?>
</head>

<body>
	<div class="wrapper">
		<?php include 'sidebar.php'; ?>

		<div class="main">
			<?php include 'top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Semak</strong> Borang</h1>

					<div class="row">
						<div class="col-12 col-xl-8">
							<div class="card">
								<div class="card-body">
									csd
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			<?php include 'footer.php'; ?>
		</div>
	</div>
</body>

</html>