
<p>
<br>
<center>
<div class="spinner-grow text-warning"></div>
</center>
</P>
<?php
//print_r($_POST);
//exit;
    session_start();

    // Array ( [login] => admin 
    //         [katakunci] => 123 )
    /*
        1. Sambung ke pangkalan data dan table
        2. Ambil data
        3. Bagi arahan untuk semak
        4. Jalankan arahan 
        5. Bagi maklum balas
    */

    // 1
    require_once('panggil-database.php');

    if ($sambung->connect_error){
        die("Maaf! Sambungan tidak berjaya" . $sambung->connect_error . "<br><br>");
    } else {
        //echo 'Horey! Sambungan berjaya<br><br>';
    }

    // 2
    $username       = $_POST['login'];
    $password       = $_POST['password'];

    // 3
    $arahan = "SELECT *, a.id AS idPengguna, b.role AS rolePengguna, a.role AS role
    FROM pengguna AS a
    JOIN role AS b ON a.role = b.id
    WHERE a.username = '$username' AND a.password = '$password'";
    // echo $arahan . '<br>';           
    // 4
    $keputusan = $sambung->query($arahan);

    if ($keputusan->num_rows > 0){

        // 5. Baca data 
        $baca = $keputusan->fetch_assoc();

        //echo '<center>';
        //echo '<h2>Selamat datang kepada pengguna</h2>';
        //echo '</center>';
       
        
        $_SESSION['id']         = $baca['idPengguna'];
        $_SESSION['role']       = $baca['role'];
        $_SESSION['fullname']   = $baca['fullname'];

        if ($_SESSION['role'] == '1') { // role admin
            //header("Location: admin/index.php");
            header("Refresh: 1; url=admin/index.php"); //will redirect after 1 seconds
            
        } else if ($_SESSION['role'] == '2') { // role guru
            //header("Location: guru/index.php");
            header("Refresh: 1; url=pengguna/index.php"); //will redirect after 1 seconds

        } else if ($_SESSION['role'] == '3') { // role murid
            //header("Location: murid/index.php");
            //header("Refresh: 1; url=student/index.php"); //will redirect after 1 seconds
              header("Refresh: 1; url=pengguna/index.php"); //will redirect after 1 seconds

        } else if ($_SESSION['role'] == '9') { // role superadmin
            //header("Location: newUser.php");
            header("Refresh: 1; url=newUser.php"); //will redirect after 1 seconds

        } else if ($_SESSION['role'] == '4') { // role superadmin
            //header("Location: newUser.php");
            header("Refresh: 1; url=pengguna/index.php"); //will redirect after 1 seconds     
        
        }
        
        else {

        }        
        
    } else {
         echo 'Maaf! Anda bukan pengguna berdaftar'; 
       
    }

    //print_r($_POST);
    exit;
?>
