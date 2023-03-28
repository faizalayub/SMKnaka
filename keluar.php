
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
<p>
<br><br>
<center>
<!--<img src="dist/img/tick-gif-6.gif" >-->
<img src="dist/img/7cecc9218e6484b9056f6964366a92ad.gif" >
</P>
<?php
    session_start();

    session_destroy();

    echo 'Terima Kasih, Anda keluar dari sistem';
    header('Refresh:2; URL = index.php');
?></center>