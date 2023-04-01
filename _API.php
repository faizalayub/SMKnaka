<?php
class Controller {
    public function __construct(){
        $params = json_decode(json_encode($_GET));
        $function = (isset($_GET['function']) ? $_GET['function'] : '');
        
        $this->host     = 'localhost';
        $this->dbname   = 'dbsmkn';
        $this->dbuser   = 'root';
        $this->dbpass   = '';

        if(method_exists($this, $function)){
            $response = $this->$function($params);
        }else{
            echo "$function not exist";
        }
    }

    function connect(){
        $sambung = new mysqli($this->host, $this->dbuser, $this->dbpass, $this->dbname);

        if($sambung->connect_error){
            echo $sambung->connect_error;
        }else{
            return $sambung;
        }
    }

    function fetchRows($query){
        $response = [];
        $connect = $this->connect();
        $prepareQuery = mysqli_query($connect, $query);

        while($collect = mysqli_fetch_array($prepareQuery, MYSQLI_ASSOC)){
            $response[] = json_decode(json_encode($collect));
        }

        $connect->close();

        return $response;
    }

    function collectSubject(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM rph_subjek");

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function collectLevel(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM tingkatan");

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function collectBBM(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM tb_bbm");

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function usersByRole($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->role)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM pengguna WHERE role = '$param->role'");
        }else{
            $response->status = 400;
            $response->message = 'ID not found';
        }

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function classroomByLevel($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->id)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM kelas_lengkap WHERE id_tingkatan = '$param->id'");
        }else{
            $response->status = 400;
            $response->message = 'ID not found';
        }

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function subjectByLevel($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->id)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM tb_subjek WHERE id_tingkatan = '$param->id'");
        }else{
            $response->status = 400;
            $response->message = 'ID not found';
        }

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function themeBySubject($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->level) && isset($param->subject)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM `tb_tema` WHERE `id_tingkatan` = $param->level AND `id_subjek` = $param->subject");
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        header('Content-type: application/json');
        echo json_encode($response);
    }

    function titleBySubject($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->level) && isset($param->subject)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM `tb_tajuk` WHERE `id_tingkatan` = $param->level AND `id_subjek` = $param->subject");
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        header('Content-type: application/json');
        echo json_encode($response);
    }
}

new Controller();