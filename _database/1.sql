CREATE TABLE `dbsmkn`.`rph_rancangan` ( `id` INT NOT NULL AUTO_INCREMENT , `id_pengguna` INT NULL DEFAULT NULL , `id_kelasLengkap` INT NULL DEFAULT NULL , `id_subjek` INT NULL DEFAULT NULL , `id_minggu` INT NULL DEFAULT NULL , `tarikh` VARCHAR(100) NULL DEFAULT NULL , `masa_mula` VARCHAR(100) NULL DEFAULT NULL , `masa_tamat` VARCHAR(100) NULL DEFAULT NULL , `tema` VARCHAR(255) NOT NULL , `tajuk` VARCHAR(255) NOT NULL , `standard_kandungan` VARCHAR(255) NULL DEFAULT NULL , `standard_pembelajaran` VARCHAR(255) NULL DEFAULT NULL , `objektif` TEXT NULL DEFAULT NULL , `aktiviti` TEXT NULL DEFAULT NULL , `refleksi` VARCHAR(255) NOT NULL , `bahan_bantuan` TEXT NULL DEFAULT NULL , `created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , `changes_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `dbsmkn`.`tb_bbm` (`id` INT NOT NULL AUTO_INCREMENT , `barang` VARCHAR(255) NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `rph_rancangan` ADD `bbm` TEXT NULL DEFAULT NULL AFTER `changes_date`;

ALTER TABLE `rph_rancangan` ADD `penilai` INT NOT NULL AFTER `bbm`;

ALTER TABLE `rph_rancangan` ADD `id_tingkatan` INT NOT NULL AFTER `minggu_sekolah`;
