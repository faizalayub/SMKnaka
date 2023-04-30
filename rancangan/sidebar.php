<?php
    $sidebarMenu = [];
    $currentFile = constant("currentFile");
    $currentrole = $_SESSION['role'];

    if($currentrole == 2){
        $sidebarMenu[] = (object) ['label' => 'Cipta RPH', 'icon' => 'file-text', 'path' => 'cipta-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Paparan Borang Harian', 'icon' => 'eye', 'path' => 'lihat-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Tajuk', 'icon' => 'file-plus', 'path' => 'kemaskini-tajuk.php'];
        $sidebarMenu[] = (object) ['label' => 'Tema', 'icon' => 'file-plus', 'path' => 'kemaskini-tema.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Pembelajaran', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-pembelajaran.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Kandungan', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-kandungan.php'];
    }

    if($currentrole == 5){
        $sidebarMenu[] = (object) ['label' => 'Cipta RPH', 'icon' => 'file-text', 'path' => 'cipta-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Paparan Borang Harian', 'icon' => 'eye', 'path' => 'lihat-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Semak & Nilai', 'icon' => 'edit-3', 'path' => 'semak-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Tajuk', 'icon' => 'file-plus', 'path' => 'kemaskini-tajuk.php'];
        $sidebarMenu[] = (object) ['label' => 'Tema', 'icon' => 'file-plus', 'path' => 'kemaskini-tema.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Pembelajaran', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-pembelajaran.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Kandungan', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-kandungan.php'];
    }

    if($currentrole == 6){
        $sidebarMenu[] = (object) ['label' => 'Cipta RPH', 'icon' => 'file-text', 'path' => 'cipta-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Paparan Borang Harian', 'icon' => 'eye', 'path' => 'lihat-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Semak & Nilai', 'icon' => 'edit-3', 'path' => 'semak-borang.php'];
        $sidebarMenu[] = (object) ['label' => 'Tajuk', 'icon' => 'file-plus', 'path' => 'kemaskini-tajuk.php'];
        $sidebarMenu[] = (object) ['label' => 'Tema', 'icon' => 'file-plus', 'path' => 'kemaskini-tema.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Pembelajaran', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-pembelajaran.php'];
        $sidebarMenu[] = (object) ['label' => 'Std. Kandungan', 'icon' => 'file-plus', 'path' => 'kemaskini-standard-kandungan.php'];
    }
?>

<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.php"><span class="align-middle">e-RPH</span></a>
        <ul class="sidebar-nav">
            <?php
                $hasActiveTab = false;

                foreach($sidebarMenu as $menu){
                    $isActive = ($currentFile == $menu->path ? 'active' : '');

                    if($currentFile == $menu->path){
                        $hasActiveTab = true;
                    }

                    echo '<li class="sidebar-item '.$isActive.'">
                        <a class="sidebar-link" href="'.$menu->path.'">
                            <i class="align-middle" data-feather="'.$menu->icon.'"></i>
                            <span class="align-middle">'.$menu->label.'</span>
                        </a>
                    </li>';
                }

                if(!$hasActiveTab){
                    header("Location: ./index.php"); exit;
                }
            ?>
        </ul>
    </div>
</nav>