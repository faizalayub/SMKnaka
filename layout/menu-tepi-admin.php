<?php
    // panggil database
    require_once('../panggil-database.php');
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.php" class="brand-link">
      <img src="../dist/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Menu ADMIN</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <?php
                    if ($_SESSION['role'] == 1) {
                      $panggil = "SELECT *
                      FROM maklumat_guru AS a
                      INNER JOIN pengguna AS b
                      ON b.id=a.id_pengguna
                      WHERE b.`status`=1 AND b.id=" . $_SESSION['id'] ;
                    } else {

                    }
                    $result = $sambung->query($panggil);
                    //print_r($_SESSION);exit();
                    while ($data = $result->fetch_assoc()){
                      $row = $data;
                  ?>
    <?php } ?>


      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
        <img src="<?php echo (!empty($row['image']) ? '../dist/img/profile/'.$row['image'] : '../dist/img/profile/avatardefault.png'); ?>" width="50" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><?php echo $_SESSION['fullname'];?></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Laporan
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="minit-curai.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Minit Curai</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Mesyuarat Dalaman</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>One Page Report</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-book"></i>
              <p>
                Kurikulum
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="senarai-guru-kelas.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Guru Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-id-card"></i>
              <p>
                Hal Ehwal Murid
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./index.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-table-tennis"></i>
              <p>
                Kokurikulum
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="koko-sukanP.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sukan & Permainan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-kelabP.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Kelab & Persatuan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-uniform.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Badan Beruniform</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-rumahS.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Rumah Sukan</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Pengguna
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="senarai-guru.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Guru</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Guru Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-murid.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Murid</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-murid-baru.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Murid Baru</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-guru-baru.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Guru Baru</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-trophy"></i>
              <p>
                Kejohanan Sukan
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="sukan-daftar-kejohanan.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Nama Kejohanan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sukan-ketegori.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Kategori</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Acara</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-murid.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Atlet</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-murid-baru.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Keputusan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-guru-baru.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Senarai Guru Baru</p>
                </a>
              </li>

            </ul>
          </li>
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-id-card"></i>
              <p>
                RPH Guru
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="rph-daftar-subjek.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Subjek</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="rph-daftar-guru.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Guru Subjek</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="rph-subjek-kelas.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Daftar Subjek + Kelas</p>
                </a>
              </li>
            </ul>
          </li>


          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="../keluar.php" class="nav-link">
              <i class="nav-icon fa-power-off"></i>
              <p class="text">Keluar</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
