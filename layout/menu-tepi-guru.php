<?php
    // panggil database
    require_once('../panggil-database.php');
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.php" class="brand-link">
      <img src="../dist/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Menu Guru</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <?php
                    if ($_SESSION['role'] == 2) {
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
        </div></br>
        <div class="info">
          <a href="profile2.php" class="d-block"><?php echo $_SESSION['fullname'];?></a>
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
                  <i class="fas fa-edit"></i>
                  <p>Minit Curai</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="fas fa-laptop-house"></i>
                  <p>Mesyuarat Dalaman</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="fas fa-car-side"></i>
                  <p>Kursus Guru</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="tugas-mingguan.php" class="nav-link active">
                  <i class="fas fa-microphone-alt"></i>
                  <p>Guru Bertugas</p>
                </a>
              </li>
              <hr>
              <li class="nav-item">
                <a href="1m1s/1m1s-index.php" class="nav-link active">
                  <i class="fas fa-trophy"></i>
                  <p>Penyertaan Pertandingan</p>
                </a>
              </li>
              <hr>
              <li class="nav-item" bg="success">
                <a class="nav-link active">
                  <i class="fas fa-table-tennis text-danger"></i>
                  <p>Aktiviti Kokurikulum</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link active">
                <i class="fas fa-user-nurse"></i>
                <p> Unit Uniform</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link active">
                  <i class="fas fa-futbol"></i>
                  <p>Sukan Permainan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link active">
                  <i class="fas fa-microphone"></i>
                  <p>Kelab Persatuan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link active">
                  <i class="fas fa-house-user"></i>
                  <p>Rumah Sukan</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-upload"></i>
              <p>
                Bahan Muat Naik
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="senarai-guru-kelas.php" class="nav-link active">
                <i class="fas fa-broadcast-tower"></i>
                  <p>Bahan Hebahan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="opr.php" class="nav-link active">
                  <i class="fas fa-file-powerpoint"></i>
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
                  <i class="fas fa-chalkboard-teacher"></i>
                  <p>Senarai Guru Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pengurusan-kelas.php" class="nav-link active">
                  <i class="fa fa-university"></i>
                  <p>Pengurusan Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pengurusan-murid.php" class="nav-link active">
                  <i class="fa fa-user-plus"></i>
                  <p>Pengurusan Murid</p>
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
                <a href="dashboard-hem.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard HEM</p>
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
                <a href="dashboard-koko.php" class="nav-link active">
                  <i class="fas fa-table"></i>
                  <p>Dashboard</p>
                </a>
            </li>
              <li class="nav-item">
                <a href="koko-sukanP.php" class="nav-link active">
                  <i class="fas fa-football-ball"></i>
                  <p>Ahli Sukan & Permainan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-kelabP.php" class="nav-link active">
                  <i class="fas fa-chess"></i>
                  <p>Ahli Kelab & Persatuan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-uniform1.php" class="nav-link active">
                  <i class="fas fa-user-nurse"></i>
                  <p>Ahli Badan Beruniform</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="koko-rumahS.php" class="nav-link active">
                  <i class="fas fa-house-user"></i>
                  <p>Ahli Rumah Sukan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="kehadiran-koko.php" class="nav-link active">
                  <i class="fas fa-bell"></i>
                  <p>Kehadiran Ahli</p>
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
                  <i class="fas fa-user-graduate"></i>
                  <p>Senarai Guru</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-guru-kelas.php" class="nav-link active">
                  <i class="fas fa-chalkboard-teacher"></i>
                  <p>Senarai Guru Kelas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="senarai-murid.php" class="nav-link active">
                  <i class="fas fa-users"></i>
                  <p>Senarai Murid</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">Menu</li>
          <li class="nav-item">
            <a href="../keluar.php" class="nav-link">
              <i class="far fa-share-square text-danger"></i>
              <p class="text">Keluar</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="../kehadiran-ko.php" class="nav-link">
              <i class="far fa-share-square text-danger"></i>
              <p class="text">Kehadiran-KO</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="makluman.php" class="nav-link">
              <i class="far fa-share-square text-danger"></i>
              <p class="text">Makluman Depan</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="rph/cipta-rph.php" class="nav-link">
              <i class="far fa-share-square text-danger"></i>
              <p class="text">RPH</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
