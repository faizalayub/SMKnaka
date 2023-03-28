<?php
    $dbname		= 'dbsmkn';
    $host		= 'localhost';
    $dbuser		= 'root';
    $dbpass		= '';
    
    // sambung ke database
    $sambung = new mysqli($host, $dbuser, $dbpass, $dbname);
    
    // check connection
    if ($sambung->connect_error){
       die("Maaf! Sambungan tidak berjaya: " . $sambung->connect_error);
    } else {
       //echo 'Tahniah! Sambungan Berjaya';
    }
?>