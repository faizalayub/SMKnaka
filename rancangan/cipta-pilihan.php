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
    ?>
</head>

<body>
	<div class="wrapper">
		<?php include 'sidebar.php'; ?>

		<div class="main">
			<?php include 'top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Kemaskini</strong> Pilihan</h1>

                    <hr>

                    <div class="row">
						<div class="col-12 col-xl-12">
							<!--#START Content Tabs -->
                            <div class="tab tab-primary tab-vertical">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" href="#vertical-icon-tab-1" data-bs-toggle="tab" role="tab" aria-selected="true">Pilih Tingkatan</a>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" href="#vertical-icon-tab-2" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">Pilih Kelas</a>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" href="#vertical-icon-tab-3" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">Maklumat Pilihan</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="vertical-icon-tab-1" role="tabpanel">
                                        <h4 class="tab-title">Vertical icon tabs</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor tellus eget condimentum
                                            rhoncus. Aenean massa. Cum sociis natoque penatibus et magnis neque dis parturient montes, nascetur ridiculus mus.
                                            In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                                        <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede
                                            justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
                                            justo.</p>
                                    </div>
                                    <div class="tab-pane" id="vertical-icon-tab-2" role="tabpanel">
                                        <h4 class="tab-title">Another one</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor tellus eget condimentum
                                            rhoncus. Aenean massa. Cum sociis natoque penatibus et magnis neque dis parturient montes, nascetur ridiculus mus.
                                            In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                                        <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede
                                            justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
                                            justo.</p>
                                    </div>
                                    <div class="tab-pane" id="vertical-icon-tab-3" role="tabpanel">
                                        <h4 class="tab-title">One more</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor tellus eget condimentum
                                            rhoncus. Aenean massa. Cum sociis natoque penatibus et magnis neque dis parturient montes, nascetur ridiculus mus.
                                            In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                                        <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede
                                            justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
                                            justo.</p>
                                    </div>
                                </div>
                            </div>
                            <!--#END Content Tabs -->
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