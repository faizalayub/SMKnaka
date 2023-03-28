<?php
$sambung = mysqli_connect("localhost", "root", "root", "dbsmkn");

$id             = $_GET['id'];
$newImageName   = $_GET['image'];

if(isset($_FILES['fileImg']['name'])){
  global $sambung;

  $imageName = $_FILES["fileImg"]["name"];
  $tmpName = $_FILES["fileImg"]["tmp_name"];

  // Image extension validation
  $validImageExtension = ['jpg', 'jpeg', 'png'];
  $imageExtension = explode('.', $imageName);

  $name = $imageExtension[0];
  $imageExtension = strtolower(end($imageExtension));

  if (!in_array($imageExtension, $validImageExtension)){
    echo "Invalid Extension";
    exit;
  }
  else{
    $newImageName = $name . "-" . uniqid(); // Generate new image name
    $newImageName .= '.' . $imageExtension;

    move_uploaded_file($tmpName, '../dist/img/profile/' . $newImageName);
    $query = "UPDATE maklumat_guru SET image ='$newImageName' WHERE id_pengguna = " . $_SESSION['id'];
    mysqli_query($sambung, $query);
    echo "Success";
    header("Location: profile-up2.php");
    exit;
  }
}

?>
