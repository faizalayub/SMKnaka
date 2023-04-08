<?php
include '_API.php';

$params = json_decode(json_encode($_GET));
$function = (isset($_POST['function']) ? $_POST['function'] : '');
$function = (isset($_GET['function']) ? $_GET['function'] : $function);

$API = new Controller('REQUEST');

if(method_exists($API, $function)){
    $response = $API->$function($params);
}else{
    echo "$function not exist";
}