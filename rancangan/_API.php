<?php
class Controller {
    public function __construct($return_mode){
        $this->host       = 'localhost';
        $this->dbname     = 'dbsmkn';
        $this->dbuser     = 'root';
        $this->dbpass     = '';

        // $this->host       = 'localhost:3306';
        // $this->dbname     = 'keacom_dbproud';
        // $this->dbuser     = 'keacom_usrproud';
        // $this->dbpass     = 'smknkea7019';

        $this->returnType = ($return_mode == 'REQUEST' ? 1 : 0);
    }

    function connect(){
        $sambung = new mysqli($this->host, $this->dbuser, $this->dbpass, $this->dbname);

        if($sambung->connect_error){
            echo $sambung->connect_error;
        }else{
            return $sambung;
        }
    }

    function fetchRow($query){
        $response = (object) [];
        $connect = $this->connect();
        $prepareQuery = mysqli_query($connect, $query);
        $collect = mysqli_fetch_array($prepareQuery, MYSQLI_ASSOC);
        $response = json_decode(json_encode($collect));
        $connect->close();

        return $response;
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

    function runQuery($query){
        $connect = $this->connect();
        $prepareQuery = mysqli_query($connect, $query);

        $connect->close();

        return $prepareQuery;
    }

    function collectSubject(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM rph_subjek");

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function collectLevel(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM tingkatan");

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function collectBBM(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM tb_bbm");

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function collectEducationWeeks(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $response->data = $this->fetchRows("SELECT * FROM rph_minggu");

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
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

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
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

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
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

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function stdKandunganBySubject($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->level) && isset($param->subject)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM `tb_standard_kandungan` WHERE `id_tingkatan` = $param->level AND `id_subjek` = $param->subject");
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function stdPembelajaranBySubject($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->level) && isset($param->subject)){
            $response->status = 200;
            $response->message = 'done';
            $response->data = $this->fetchRows("SELECT * FROM `tb_standard_pembelajaran` WHERE `id_tingkatan` = $param->level AND `id_subjek` = $param->subject");
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function stdKandunganByTitle($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->title)){
            $response->status = 200;
            $response->message = 'done';
            
            $subjectTitleID = $this->fetchRow("SELECT * FROM `tb_tajuk` WHERE tajuk = '".$param->title."'");

            if(!empty($subjectTitleID)){
                $response->data = $this->fetchRows("SELECT * FROM `tb_standard_kandungan` WHERE `id_tajuk` = $subjectTitleID->id");
            }
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function stdPembelajaranByKandungan($param){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];

        if(isset($param->title)){
            $response->status = 200;
            $response->message = 'done';
            
            $kandungan = $this->fetchRow("SELECT * FROM `tb_standard_kandungan` WHERE standard_kandungan = '".$param->title."'");

            if(!empty($kandungan)){
                $response->data = $this->fetchRows("SELECT * FROM `tb_standard_pembelajaran` WHERE `id_sk` = $kandungan->id");
            }
        }else{
            $response->status = 400;
            $response->message = 'Parameter not found';
        }

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
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

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
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

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response->data;
        }
    }

    function reviewStatus($id = null){
        $status = [
            (object)[
                'id' => null,
                'color' => '',
                'text' => '-- Pilih Status Penilaian --'
            ],
            (object)[
                'id' => 0,
                'color' => 'bg-secondary',
                'text' => 'Belum Disemak'
            ],
            (object)[
                'id' => 1,
                'color' => 'bg-success',
                'text' => 'Diterima'
            ],
            (object)[
                'id' => 2,
                'color' => 'bg-danger',
                'text' => 'Perlu Dibaiki'
            ]
        ];
        
        if(isset($id)){
            $result = (object)[];
            
            foreach($status as $value){
                if($value->id == $id) $result = $value;
            }

            return $result;
        }else{
            return $status;
        }
    }

    function saveReview(){
        $id        = (isset($_POST['id']) ? $_POST['id'] : null);
        $status    = (isset($_POST['status']) ? $_POST['status'] : null);
        $summary   = (isset($_POST['summary']) ? $_POST['summary'] : null);
        $signature = (isset($_POST['signature']) ? $_POST['signature'] : '');

        $response = $this->runQuery("UPDATE `rph_rancangan` SET `komen_penilai` = '$summary', `status_penilai` = '$status', `signature` = '$signature', `tarikh_penilai` = current_timestamp() WHERE `rph_rancangan`.`id` = ".$id);

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response;
        }
    }

    function copyForm(){
        $response = (object) ['status' => 200, 'data' => [], 'message' => ''];
        $userSessionID = random_int(100000, 999999);
        $forminput = (isset($_POST['forminput']) ? $_POST['forminput'] : NULL);

        $this->runQuery("INSERT INTO `rph_copyvalue` (`id`, `json`) VALUES ($userSessionID, '".$forminput."')");

        $response->data = $userSessionID;

        if($this->returnType == 1){
            header('Content-type: application/json');
            echo json_encode($response);
        }else{
            return $response;
        }
    }
}