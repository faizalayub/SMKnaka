<?php 
       session_start();

       require_once('../panggil-database.php');

/* 888888888888 */
if (isset($_POST['submit'])){
  $simpan = "../dist/doc/opr/";

  // gambar1
  $filename1 = $_FILES['gambar1']['name'];
  $tmp_filename1 = $_FILES['gambar1']['tmp_name'];

  move_uploaded_file($tmp_filename1, $simpan.$filename1);
 // gambar2
  $filename2 = $_FILES['gambar2']['name'];
  $tmp_filename2 = $_FILES['gambar2']['tmp_name'];

  move_uploaded_file($tmp_filename2, $simpan.$filename2);
 // gambar3
  $filename3 = $_FILES['gambar3']['name'];
  $tmp_filename3 = $_FILES['gambar3']['tmp_name'];

  move_uploaded_file($tmp_filename3, $simpan.$filename3);

}    

// untuk masukkan Gambar
if(isset($_POST['submit']))
{

    $gambar1    =$_FILES['gambar1']['name'];
    $gambar2    =$_FILES['gambar2']['name'];
    $gambar3    =$_FILES['gambar3']['name'];

$target_dir = "../dist/doc/opr/";
$target_file1 = $target_dir . basename($gambar1);
$target_file2 = $target_dir . basename($gambar2);
$target_file3 = $target_dir . basename($gambar3);

$imageFileType1 = strtolower(pathinfo($target_file1, PATHINFO_EXTENSION));
$imageFileType2 = strtolower(pathinfo($target_file2, PATHINFO_EXTENSION));
$imageFileType3 = strtolower(pathinfo($target_file3, PATHINFO_EXTENSION));

$check1 = getimagesize($_FILES['gambar1']['tmp_name']);
$check2 = getimagesize($_FILES['gambar2']['tmp_name']);
$check3 = getimagesize($_FILES['gambar3']['tmp_name']);

$extension1 = substr($gambar1, strlen($gambar1)-4,strlen($gambar1));
$extension2 = substr($gambar2, strlen($gambar2)-4,strlen($gambar2));
$extension3 = substr($gambar3, strlen($gambar3)-4,strlen($gambar3));

$allowed_extensions = array(".jpg",".jpeg",".png",".gif");

if ($check1 == false ||$check2 == false||$check3 == false ){

}else{


    move_uploaded_file($_FILES(['gambar1']['tmp_name'], $target_dir.'/'.$gambar1));
}

//getting the post values
$unit        =$_POST['unit'];
$tarikh      =$_POST['tarikh'];
$program     =$_POST['program'];
$personalia =$_POST['personalia'];
$kumpulan   =$_POST['kumpulan'];
$objektif   =$_POST['objektifDummy'];
$impak      =$_POST['impakDummy'];
$isu        =$_POST['isuDummy'];
$nama_guru  =$_POST['nama_guru'];
$userId     = $_SESSION['id'];

// Query for data insertion
 $sql="INSERT INTO tb_opr(unit,tarikh,program,personalia,kumpulan,objektif,impak,isu,nama_guru,uploaded_by,gambar1,gambar2,gambar3) 
                        value('$unit','$tarikh','$program','$personalia','$kumpulan','$objektif','$impak','$isu','$nama_guru','$userId','$gambar1','$gambar2','$gambar3'   )";
                        
 $query = mysqli_query($sambung,$sql);

        if ($query) {
        echo "<script>alert('You have successfully inserted the data');</script>";
        echo "<script type='text/javascript'> document.location ='list-opr.php'; </script>";
        }
        else
        {
          echo "<script>alert('Something Went Wrong. Please try again');</script>";
        }
    }
?>