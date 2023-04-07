<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="#" />

<title>RPH</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link href="css/app.css" rel="stylesheet">
<script src="js/app.js"></script>

<?php
    session_start();
    date_default_timezone_set('Asia/Kuala_Lumpur');

    $filePath = $_SERVER['SCRIPT_FILENAME'];

    define('currentFile', basename($filePath));
    define('currentFilename', basename($filePath, ".php"));

    function ToastMessage($title, $subtitle, $severity, $redirectTo){
        echo '<script>
        swal({
            title: "'.$title.'",
            text: "'.$subtitle.'",
            type: "'.$severity.'",
            showCancelButton: false,
            confirmButtonText: "Ok",
            closeOnConfirm: true
        }, function(){
            window.location.href = "'.$redirectTo.'";
        })
        </script>';
    }
?>