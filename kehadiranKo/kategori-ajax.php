<?php
    require_once('../panggil-database.php');
    $action = $_GET ['action'];

    if($action == "jenis_kokurikulum"){
        $id = $_GET ['id'];
        $json = [];
        $sn1 = "SELECT id,jenis_kokurikulum FROM kategori_kokurikulum WHERE id_kokurikulum='$id' AND id_status=1";
        $rsn1=mysqli_query($sambung,$sn1);
        while ($rw1 = mysqli_fetch_array($rsn1)){
            $json[$rw1['id']] = $rw1['jenis_kokurikulum'];
        }
    
        echo json_encode($json);
    }

    if($action == "tingkatan"){

        $targetCol = null;
        $kategori_kokurikulum_id = $_GET ['kategori_kokurikulum_id'];
        $kokurikulum_id = $_GET ['kokurikulum_id'];

        if($kokurikulum_id == 1){
            $targetCol = "id_kelabP";
        }else if($kokurikulum_id == 2){
            $targetCol = "id_sukanP";
        }else if($kokurikulum_id == 3){
            $targetCol = "id_uniform";
        }else if($kokurikulum_id == 4){
            $targetCol = "id_rumah_sukan";
        }else{
            //invalid
        }

        $json = [];

        $sn1 = "SELECT tingkatan.nama_tingkatan,tingkatan.id FROM maklumat_murid 
                    INNER JOIN kelas_lengkap ON maklumat_murid.id_kelasLengkap = kelas_lengkap.id
                    INNER JOIN tingkatan ON kelas_lengkap.id_tingkatan = tingkatan.id
                    WHERE maklumat_murid.$targetCol='$kokurikulum_id' AND maklumat_murid.id_status=1 
                    GROUP BY tingkatan.id";
        $rsn1=mysqli_query($sambung,$sn1);
        while ($rw1 = mysqli_fetch_array($rsn1)){
            $json[$rw1['id']] = $rw1['nama_tingkatan'];
        }
    
        echo json_encode($json);
    }

    if($action == "studentList"){

        $targetCol = null;
        $kategori_kokurikulum_id = $_GET ['kategori_kokurikulum_id'];
        $kokurikulum_id = $_GET ['kokurikulum_id'];
        $tingkatan_id = $_GET ['tingkatan_id'];

        if($kokurikulum_id == 1){
            $targetCol = "id_kelabP";
        }else if($kokurikulum_id == 2){
            $targetCol = "id_sukanP";
        }else if($kokurikulum_id == 3){
            $targetCol = "id_uniform";
        }else if($kokurikulum_id == 4){
            $targetCol = "id_rumah_sukan";
        }else{
            //invalid
        }
        $sn1 = "SELECT maklumat_murid.id_kelasLengkap,pengguna.id,pengguna.fullname,kelas_lengkap.keterangan,tingkatan.singkatan_tingkatan FROM maklumat_murid 
                    INNER JOIN kelas_lengkap ON maklumat_murid.id_kelasLengkap = kelas_lengkap.id 
                    INNER JOIN tingkatan ON kelas_lengkap.id_tingkatan = tingkatan.id 
                    INNER JOIN pengguna ON maklumat_murid.id_pengguna=pengguna.id
                    WHERE maklumat_murid.$targetCol='$kokurikulum_id' AND maklumat_murid.id_status=1 AND tingkatan.id ='$tingkatan_id'";
        $rsn1=mysqli_query($sambung,$sn1);

        $result = '<table class="table table-bordered">
                        <tr>
                            <th>Hadir</th>
                            <th>Nama</th>
                            <th>Kelas</th>
                        </tr>';
        while ($rw1 = mysqli_fetch_array($rsn1)){
            $result.='<tr>
                        <td style="text-align: center"><div class="form-check"><input name="pelajarHadir[]" class="form-check-input" type="checkbox" value="'.$rw1["id"].'|'.$rw1["id_kelasLengkap"].'"></div></td>
                        <td>'.$rw1["fullname"].'</td>
                        <td>'.$rw1["keterangan"].'</td>
                     </tr>';
        }

        $result .="</table>";

      echo ($result);
    }

?>