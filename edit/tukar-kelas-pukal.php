<?php
    session_start();

    require_once('../panggil-database.php');
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if( $_POST['id_kelasLengkap'] == null || $_POST['id_kelasLengkap'] == ''){
            exit('Sila pilih kelas');//nnti tukar balik error ni
        }else if(!is_array($_POST['pelajar'])){
            exit('Sila pilih pelajar');//nnti tukar balik error ni
        }


        $kelasId = $_POST['id_kelasLengkap'];
        $id_pengguna = $_POST['pelajar'];
        $kelasLama = $_POST['kelas_lama'];
        
        $sn1 = "UPDATE maklumat_murid SET id_kelasLengkap = $kelasId WHERE id_pengguna IN (".implode(',',$id_pengguna).")";

        if ($sambung->query($sn1) === TRUE) {
            echo '<script type="text/javascript">alert("Penukaran kelas berjaya")
                location.href = "../pengguna/senarai-kemaskini-kelas-pukal.php?id='.$kelasLama.'";
            </script>';
            //header('location: ../pengguna/senarai-kemaskini-kelas-pukal.php?id=' . $kelasLama);
        } else { 
            echo 'Check code semula';
        }

    }

?>