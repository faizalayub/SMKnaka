<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ASAS | Pembangunan Menggunakan PHP</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

  <?php
    // panggil database
    require_once('panggil-database.php');

    // proses daftar pengguna
    if (isset($_POST['btgDaftar'])){

        // 1. ambil data 2. panggil database dan table 3. bg arahan dan simpan data 4. check arahan berjaya atau tidak
        // 1
        $fullname   = $_POST['fullname'];
        $email      = $_POST['email'];
        $username   = $_POST['username'];
        $password1  = $_POST['password1'];
        $password2  = $_POST['password2'];
        $role       = $_POST['role'];

        if ($password1 != $password2){
            echo '<div style="color:red;"><center>Maaf! Pastikan kata kunci yang dimasukkan adalah sama. <br>';
            echo '<a href="register.php">Daftar semula</a></center></div>';
            exit;
        } else {
            // check jika user dah ada 
            $semak = "SELECT * FROM pengguna WHERE username = '$username'";
            $resultSemak = $sambung->query($semak);

            if ($resultSemak->num_rows > 0){
                echo '<div style="color:red;"><center>Maaf! Pengguna telah mendaftar. <br>';
                echo '<a href="register.php">Daftar semula</a></center></div>';
                exit;
            } else {
                // 3. bagi arahan simpanan
                $arahan = "INSERT INTO pengguna (fullname,
                                                email,
                                                username,
                                                role,
                                                password) 
                                        VALUES ('$fullname',
                                                '$email',
                                                '$username',
                                                '$role',
                                                '$password1')";

                
                $result = $sambung->query($arahan);

                if ($result === TRUE) {
                    echo '<center>Tahniah! Pengguna berjaya di daftarkan.';
                    echo '<br><a href="index.php">Klik untuk login.</a></center>';
                } else {
                    echo 'Maaf! Pengguna tidak berjaya didaftarkan';
                }
                //print_r($_POST);
                exit;  
            } // tutup semak pengguna kalau dah ada
        } // tutup semak password  
    }
  ?>
</head>
<body class="hold-transition register-page">
    <div class="register-box">
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
        <a href="../../index2.html" class="h1">Testing <b>PHP</b></a>
        </div>
        <div class="card-body">
        <p class="login-box-msg">Daftar Pengguna Baru</p>

        <form action="" method="post">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Nama Penuh" name="fullname" required>
                <div class="input-group-append">
                    <div class="input-group-text">
                    <span class="fas fa-user"></span>
                    </div>
                </div>
            </div>
            <div class="input-group mb-3">
                <input type="email" class="form-control" placeholder="Email" name="email" required>
                <div class="input-group-append">
                    <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                    </div>
                </div>
            </div>

            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Login" name="username" required>
                <div class="input-group-append">
                    <div class="input-group-text">
                    <span class="fas fa-user"></span>
                    </div>
                </div>
            </div>

            <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Kata Kunci" name="password1" required>
            <div class="input-group-append">
                <div class="input-group-text">
                <span class="fas fa-lock"></span>
                </div>
            </div>
            </div>
            <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Kata Kunci Semula"  name="password2" required>
            <div class="input-group-append">
                <div class="input-group-text">
                <span class="fas fa-lock"></span>
                </div>
            </div>
            </div>
            <div class="input-group mb-3">
            <select id="role" class="form-select" placeholder="Peranan" name="role" required>
            <option value=""> -- sila pilih Peranan Anda -- </option>
                      <option value="3">MURID</option>
                      <option value="2">GURU</option>
                  </select>
                <div class="input-group-text">
                <span class="fas fa-user"></span>
            </div>
            </div>
            <div class="row">

<!------------------------------------------------------------->

<!------------------------------------------------------------->
            <!-- /.col -->
            <div class="col-4">
                <button type="submit" class="btn btn-primary btn-block" name="btgDaftar">Daftar</button>
            </div>
            <!-- /.col -->
            </div>
        </form>

        <a href="index.php" class="text-center">Saya telah mendaftar</a>
        </div>
        <!-- /.form-box -->
    </div><!-- /.card -->
    </div>
    <!-- /.register-box -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
</body>
</html>
