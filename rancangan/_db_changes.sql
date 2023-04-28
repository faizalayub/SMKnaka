CREATE TABLE `tb_standard_kandungan` (`id` INT NOT NULL AUTO_INCREMENT , `id_tingkatan` INT NULL , `id_subjek` INT NULL , `standard_kandungan` VARCHAR(255) NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `tb_standard_pembelajaran` (`id` INT NOT NULL AUTO_INCREMENT , `id_tingkatan` INT NULL , `id_subjek` INT NULL , `standard_pembelajaran` VARCHAR(255) NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `rph_copyvalue` (`id` INT NOT NULL AUTO_INCREMENT, `json` TEXT NOT NULL , PRIMARY KEY (`id`) ) ENGINE = InnoDB;