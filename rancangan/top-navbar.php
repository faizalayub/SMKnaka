<?php
    $profilePicture = 'img/default_avatar.jpeg';
    
    $utils = new Controller('RETURN');
    $accountID = ($_SESSION['id'] ?? null);
    $accountData = $utils->fetchRow("SELECT * FROM `pengguna` WHERE `id` = '".$accountID."'");
    $accountPicture = $utils->fetchRow("SELECT image FROM `maklumat_guru` WHERE id_pengguna = ".$accountID);

    if(!empty($accountPicture)){
        $profilePicture = '../dist/img/profile/'.$accountPicture->image;
    }
?>
<nav class="navbar navbar-expand navbar-light navbar-bg">
    <a class="sidebar-toggle js-sidebar-toggle">
        <i class="hamburger align-self-center"></i>
    </a>

    <ul class="navbar-nav">
        <li class="nav-item px-2 dropdown">
            <a class="nav-link bg-secondary rounded-5 text-white px-3" href="../pengguna/index.php">My Dashboard</a>
        </li>
    </ul>

    <div class="navbar-collapse collapse">
        <ul class="navbar-nav navbar-align">            
            <li class="nav-item dropdown">
                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                    <i class="align-middle" data-feather="settings"></i>
                </a>

                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                    <img style="object-fit: contain;" src="<?php echo $profilePicture; ?>" class="avatar img-fluid rounded-circle me-1" alt="<?php echo (!empty($accountData) ? $accountData->fullname : '') ?>" />
                    <span class="text-dark">
                        <?php echo (!empty($accountData) ? $accountData->fullname : '') ?>
                    </span>
                </a>

                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="./logout.php"><i class="align-middle me-1" data-feather="log-out"></i> Log Out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>