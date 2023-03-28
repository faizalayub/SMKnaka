<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kehadiran Lengkap</title>

    <?php
        require_once('../panggil-database.php');

        $kis = $_GET['id_kelas'];
        $kid = $_GET['id_kehadiran'];

        print_r($_GET);
    ?>
</head>
<body>
    <table>
        <!-- dapatkan info kehadiran kelas -->
        <?php
            $sql1 = "SELECT * 
                     FROM kehadiran_harian AS a 
                     JOIN kelas_lengkap AS b ON a.id_kelas = b.id
                     JOIN tingkatan AS c ON a.id_tingkatan = c.id
                     WHERE a.id = '$kid' 
                     GROUP BY a.id_kelas 
                     ORDER BY a.id_kelas ASC";
            $result1 = $sambung->query($sql1);
            
            $row1 = $result1->fetch_assoc();

            $tarikh = date('d m Y', $row1['tarikh']);

            //print_r($row1);
            // Array ( [id] => 1 [tarikh] => 1679702400 [id_kelas] => 1 [id_pengguna] => 116 [id_tingkatan] => 1 [nama_kelas] => AGAMA [singkatan_kelas] => A [id_status] => 1 [nama_tingkatan] => SATU [singkatan_tingkatan] => 1 )

        ?>
        <thead>
            <tr>
                <th>Kelas</th>
                <th><?php echo $row1['keterangan'];?> </th>
            </tr>            
            <tr>
                <th>Tarikh</th>
                <th><?php echo $tarikh; ?></th>
            </tr>
        </thead>
    </table>

    <!-- Senarai tidak hadir  -->
    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">PROFILE</th>
                                        <th scope="col">NAMA TIDAK HADIR</th>
                                      <!--  <th scope="col">NO. KAD PENGENALAN</th> -->
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $sn2 = "SELECT *
                                                FROM kehadiran_harian 
                                                WHERE id = '$kid' 
                                                ORDER BY id_pengguna ASC";
                                        $rsn2 = $sambung->query($sn2);

                                        //echo $sn1;
                                        $i = 0;
                                        while ($row2 = $rsn2->fetch_assoc()){
                                            $mId      = $row2['id_pengguna'];

                                            // dapatkan maklumat pelajar 
                                            $sn3 = "SELECT * 
                                            FROM pengguna AS a JOIN maklumat_murid AS b ON a.id=b.id_pengguna
                                            WHERE a.id = '$mId'";
                                            $rsn3 = mysqli_query($sambung, $sn3);
                                            $rwn3 = mysqli_fetch_assoc($rsn3);
                                    ?>
                                    <tr>
                                    <th scope="row"><?php echo ++$i;?></th>
                                    <!-- <td> <img src="<?php echo (!empty($rwn3['image']) ? '../murid/img/'.$rwn3['image'] : '../murid/img/62c261d4cab27.png'); ?>" width="40"> </td> 
                                    <td><?php echo $rwn3['fullname'];?></td>
                                    <td>
            <a href="?n=9&id=<?php echo $id_murid;?>&id_kelas=<?php echo $_GET['id_kelas'];?>&tarikh=<?php echo $_GET['tarikh'];?>" class="btn btn-danger" onclick="return confirm('Anda pasti untuk padam?')"><i class="fa fa-times"></i> PADAM<?php //echo $id_murid;?></a>
        </td> -->
                                  <!--  <td><?php echo $rwn3['no_ic'];?></td> 
                                    <td><a href="#" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
                                    </tr> --->
                                    <?php } ?>
                                     <!-- untuk datatable -->

                                </tbody>
                            </table>

</body>
</html>