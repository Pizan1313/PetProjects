-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema winelife
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema winelife
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `winelife` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `winelife` ;

-- -----------------------------------------------------
-- Table `winelife`.`aging_length_measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`aging_length_measure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `measure` ENUM('день', 'месяц', 'год', 'неделя') NULL DEFAULT NULL COMMENT 'Название (день, месяц, год, неделя)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`aging_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`aging_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `aging_type` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название типа выдержки',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`origin_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`origin_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название файла изображения',
  `image` BLOB NULL DEFAULT NULL COMMENT 'Изображение',
  `creator_id` INT NULL DEFAULT NULL COMMENT 'ID пользователя, который добавил изображение',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT 'Дата, в которую было загружено изображение',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine_country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название страны производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_OriginImage_WineCountry` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginImage_WineCountry`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine_region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine_region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название региона производства вина',
  `wine_country_id` INT NOT NULL COMMENT 'ID Страна производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_WineRegion_WineCountry` (`wine_country_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_WineRegion` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginImage_WineRegion`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`),
  CONSTRAINT `FK_WineRegion_WineCountry`
    FOREIGN KEY (`wine_country_id`)
    REFERENCES `winelife`.`wine_country` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`appellation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`appellation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название аппелласьона производства вина',
  `wine_country_id` INT NOT NULL COMMENT 'ID Страны производства вина',
  `wine_region_id` INT NULL DEFAULT NULL COMMENT 'ID Региона производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом аппелласьоне',
  PRIMARY KEY (`id`),
  INDEX `FK_Appellation_WineCountry` (`wine_country_id` ASC) VISIBLE,
  INDEX `FK_Appellation_WineRegion` (`wine_region_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_Appellation` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_Appellation_WineCountry`
    FOREIGN KEY (`wine_country_id`)
    REFERENCES `winelife`.`wine_country` (`id`),
  CONSTRAINT `FK_Appellation_WineRegion`
    FOREIGN KEY (`wine_region_id`)
    REFERENCES `winelife`.`wine_region` (`id`),
  CONSTRAINT `FK_OriginImage_Appellation`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`certificate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`certificate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название сертификата',
  `logo` BLOB NULL DEFAULT NULL COMMENT 'Логотип сертификата',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом сертификате',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`class_of_cru`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`class_of_cru` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название класса крю',
  `appellation_id` INT NOT NULL COMMENT 'ID Аппелласьона производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом классе крю',
  PRIMARY KEY (`id`),
  INDEX `FK_ClassOfCru_Appellation` (`appellation_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_ClassOfCru` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_ClassOfCru_Appellation`
    FOREIGN KEY (`appellation_id`)
    REFERENCES `winelife`.`appellation` (`id`),
  CONSTRAINT `FK_OriginImage_ClassOfCru`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`commune`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`commune` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название коммуны производства вина',
  `wine_region_id` INT NOT NULL COMMENT 'ID Региона производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_Commune_WineRegion` (`wine_region_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_Commune` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_Commune_WineRegion`
    FOREIGN KEY (`wine_region_id`)
    REFERENCES `winelife`.`wine_region` (`id`),
  CONSTRAINT `FK_OriginImage_Commune`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`currency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название валюты',
  `sign` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Символ валюты',
  `abbreviation` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Аббревиатура валюты',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`type_of_wine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`type_of_wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `color` ENUM('Белое', 'Красное', 'Розовое', 'Оранжевое') NULL DEFAULT NULL COMMENT 'Цвет вина',
  `type` ENUM('Тихое', 'Игристое', 'Сладкое/Креплёное') NULL DEFAULT NULL COMMENT 'Тип вина',
  `prod_method` ENUM('Классический (Classic)', 'Акратофорный (Charmat)', 'Пет-Нат (Ancestrale/Pét-Nat)', 'Col Fondo') NULL DEFAULT NULL COMMENT 'Метод производства (если вина игристое, если не игристое, то Null)',
  `variation` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Разновидность крепкого/сладкого вина (если игристое или тихое, то null)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`dosage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`dosage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dosage_title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название дозажа',
  `dosage_year` DATE NULL DEFAULT NULL COMMENT 'Дата дозажа (только для типа вина \"игристые\")',
  `type_id` INT NULL DEFAULT NULL COMMENT 'Тип вина (для определения игристое вино или нет)',
  PRIMARY KEY (`id`),
  INDEX `FK_Dosage_TypeOfWine` (`type_id` ASC) VISIBLE,
  CONSTRAINT `FK_Dosage_TypeOfWine`
    FOREIGN KEY (`type_id`)
    REFERENCES `winelife`.`type_of_wine` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`egais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`egais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Код вина в системе ЕГАИС',
  `qr` BLOB NULL DEFAULT NULL COMMENT 'qr-code ЕГАИС вина на бутылке',
  `barcode` VARCHAR(255) NULL DEFAULT NULL COMMENT 'bar-code ЕГАИС вина на бутылке',
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Официальное название товара в системе ЕГАИС',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`establishment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`establishment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`grape`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`grape` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `main_id` INT NULL DEFAULT NULL COMMENT 'ID родительского сорта винограда',
  `title` VARCHAR(255) NOT NULL COMMENT 'Название сорта винограда или его синонима',
  `percentage` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'Процентное содержание винограда',
  PRIMARY KEY (`id`),
  INDEX `FK_GrapeGrape_Main_id` (`main_id` ASC) VISIBLE,
  CONSTRAINT `FK_GrapeGrape_Main_id`
    FOREIGN KEY (`main_id`)
    REFERENCES `winelife`.`grape` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`subregion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`subregion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название субрегина производства вина',
  `wine_region_id` INT NOT NULL COMMENT 'ID Региона производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_Subregion_WineRegion` (`wine_region_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_Subregion` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginImage_Subregion`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`),
  CONSTRAINT `FK_Subregion_WineRegion`
    FOREIGN KEY (`wine_region_id`)
    REFERENCES `winelife`.`wine_region` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`lieu_dit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`lieu_dit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название льё-ди производства вина',
  `subregion_id` INT NOT NULL COMMENT 'id Субрегиона производства вина',
  `commune_id` INT NULL DEFAULT NULL COMMENT 'id Коммуны производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_LieuDit_Subregion` (`subregion_id` ASC) VISIBLE,
  INDEX `FK_LieuDit_Commune` (`commune_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_LieuDit` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_LieuDit_Commune`
    FOREIGN KEY (`commune_id`)
    REFERENCES `winelife`.`commune` (`id`),
  CONSTRAINT `FK_LieuDit_Subregion`
    FOREIGN KEY (`subregion_id`)
    REFERENCES `winelife`.`subregion` (`id`),
  CONSTRAINT `FK_OriginImage_LieuDit`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vineyard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vineyard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT 'Название виноградника производства вина',
  `subregion_id` INT NOT NULL COMMENT 'id Субрегиона производства вина',
  `commune_id` INT NULL DEFAULT NULL COMMENT 'id Коммуны производства вина',
  `origin_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото места производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этом месте',
  PRIMARY KEY (`id`),
  INDEX `FK_Vineyard_Subregion` (`subregion_id` ASC) VISIBLE,
  INDEX `FK_Vineyard_Commune` (`commune_id` ASC) VISIBLE,
  INDEX `FK_OriginImage_Vineyard` (`origin_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginImage_Vineyard`
    FOREIGN KEY (`origin_image_id`)
    REFERENCES `winelife`.`origin_image` (`id`),
  CONSTRAINT `FK_Vineyard_Commune`
    FOREIGN KEY (`commune_id`)
    REFERENCES `winelife`.`commune` (`id`),
  CONSTRAINT `FK_Vineyard_Subregion`
    FOREIGN KEY (`subregion_id`)
    REFERENCES `winelife`.`subregion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`origin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`origin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wine_country_id` INT NOT NULL COMMENT 'ID Страна производства вина',
  `wine_region_id` INT NULL DEFAULT NULL COMMENT 'ID Регион',
  `subregion_id` INT NULL DEFAULT NULL COMMENT 'ID Субрегион',
  `commune_id` INT NULL DEFAULT NULL COMMENT 'ID Коммуна',
  `appellation_id` INT NOT NULL COMMENT 'ID Название аппелласьона',
  `vineyard_id` INT NULL DEFAULT NULL COMMENT 'ID Название виноградника',
  `class_of_cru_id` INT NULL DEFAULT NULL COMMENT 'ID Название класса вина',
  `lieu_dit_id` INT NULL DEFAULT NULL COMMENT 'ID Название льё-ди',
  PRIMARY KEY (`id`),
  INDEX `FK_Origin_WineCountry` (`wine_country_id` ASC) VISIBLE,
  INDEX `FK_Origin_WineRegion` (`wine_region_id` ASC) VISIBLE,
  INDEX `FK_Origin_Subregion` (`subregion_id` ASC) VISIBLE,
  INDEX `FK_Origin_Commune` (`commune_id` ASC) VISIBLE,
  INDEX `FK_Origin_Appellation` (`appellation_id` ASC) VISIBLE,
  INDEX `FK_Origin_ClassOfCru` (`class_of_cru_id` ASC) VISIBLE,
  INDEX `FK_Origin_LieuDit` (`lieu_dit_id` ASC) VISIBLE,
  INDEX `FK_Origin_Vineyard` (`vineyard_id` ASC) VISIBLE,
  CONSTRAINT `FK_Origin_Appellation`
    FOREIGN KEY (`appellation_id`)
    REFERENCES `winelife`.`appellation` (`id`),
  CONSTRAINT `FK_Origin_ClassOfCru`
    FOREIGN KEY (`class_of_cru_id`)
    REFERENCES `winelife`.`class_of_cru` (`id`),
  CONSTRAINT `FK_Origin_Commune`
    FOREIGN KEY (`commune_id`)
    REFERENCES `winelife`.`commune` (`id`),
  CONSTRAINT `FK_Origin_LieuDit`
    FOREIGN KEY (`lieu_dit_id`)
    REFERENCES `winelife`.`lieu_dit` (`id`),
  CONSTRAINT `FK_Origin_Subregion`
    FOREIGN KEY (`subregion_id`)
    REFERENCES `winelife`.`subregion` (`id`),
  CONSTRAINT `FK_Origin_Vineyard`
    FOREIGN KEY (`vineyard_id`)
    REFERENCES `winelife`.`vineyard` (`id`),
  CONSTRAINT `FK_Origin_WineCountry`
    FOREIGN KEY (`wine_country_id`)
    REFERENCES `winelife`.`wine_country` (`id`),
  CONSTRAINT `FK_Origin_WineRegion`
    FOREIGN KEY (`wine_region_id`)
    REFERENCES `winelife`.`wine_region` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`origin_commune`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`origin_commune` (
  `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
  `commune_id` INT NOT NULL COMMENT 'ID коммуны',
  PRIMARY KEY (`origin_id`, `commune_id`),
  INDEX `FK_OriginCommune_Commune` (`commune_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginCommune_Commune`
    FOREIGN KEY (`commune_id`)
    REFERENCES `winelife`.`commune` (`id`),
  CONSTRAINT `FK_OriginCommune_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`origin_lieu_dit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`origin_lieu_dit` (
  `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
  `lieu_dit_id` INT NOT NULL COMMENT 'ID льё-ди',
  PRIMARY KEY (`origin_id`, `lieu_dit_id`),
  INDEX `FK_OriginCommune_LieuDit` (`lieu_dit_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginCommune_LieuDit`
    FOREIGN KEY (`lieu_dit_id`)
    REFERENCES `winelife`.`lieu_dit` (`id`),
  CONSTRAINT `FK_OriginLieuDit_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`origin_vineyard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`origin_vineyard` (
  `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
  `vineyard_id` INT NOT NULL COMMENT 'ID виноградника',
  PRIMARY KEY (`origin_id`, `vineyard_id`),
  INDEX `FK_OriginCommune_Vineyard` (`vineyard_id` ASC) VISIBLE,
  CONSTRAINT `FK_OriginCommune_Vineyard`
    FOREIGN KEY (`vineyard_id`)
    REFERENCES `winelife`.`vineyard` (`id`),
  CONSTRAINT `FK_OriginVineyard_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`pos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`pos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`producer_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`producer_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название файла изображения',
  `image` BLOB NULL DEFAULT NULL COMMENT 'Изображение',
  `creator_id` INT NULL DEFAULT NULL COMMENT 'ID пользователя, который добавил изображение',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT 'Дата, в которую было загружено изображение',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`producer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL COMMENT 'Название производителя на латинице + диакритические знаки',
  `original_name` VARCHAR(255) NOT NULL COMMENT 'Название на языке оригинала',
  `origin_id` INT NOT NULL COMMENT 'ID зоны производства',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация о производителе',
  `image` BLOB NULL DEFAULT NULL COMMENT 'Фотографии винодела',
  `category` ENUM('Negoсiant', 'Grower', 'RM', 'NM') NULL DEFAULT NULL COMMENT 'Категория производителя',
  `main_id` INT NULL DEFAULT NULL COMMENT 'К какому производителю относится',
  `certificate_id` INT NULL DEFAULT NULL COMMENT 'ID сертификата производителя',
  `producer_image_id` INT NULL DEFAULT NULL COMMENT 'ID фото производителя',
  `status` ENUM('Обычный', 'Хороший', 'Топовый') NULL DEFAULT NULL COMMENT 'Статус производителя',
  PRIMARY KEY (`id`),
  INDEX `FK_ProducerProducer_Main_id` (`main_id` ASC) VISIBLE,
  INDEX `FK_Producer_Origin` (`origin_id` ASC) VISIBLE,
  INDEX `FK_Producer_Certificate` (`certificate_id` ASC) VISIBLE,
  INDEX `FK_Producer_ProducerImage` (`producer_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_Producer_Certificate`
    FOREIGN KEY (`certificate_id`)
    REFERENCES `winelife`.`certificate` (`id`),
  CONSTRAINT `FK_Producer_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`),
  CONSTRAINT `FK_Producer_ProducerImage`
    FOREIGN KEY (`producer_image_id`)
    REFERENCES `winelife`.`producer_image` (`id`),
  CONSTRAINT `FK_ProducerProducer_Main_id`
    FOREIGN KEY (`main_id`)
    REFERENCES `winelife`.`producer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`producer_producer_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`producer_producer_image` (
  `producer_id` INT NOT NULL COMMENT 'ID of the producer',
  `producer_image_id` INT NOT NULL COMMENT 'ID of producer images',
  PRIMARY KEY (`producer_id`, `producer_image_id`),
  INDEX `FK_ProducerProducerImage_ProducerImage` (`producer_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_ProducerProducerImage_Producer`
    FOREIGN KEY (`producer_id`)
    REFERENCES `winelife`.`producer` (`id`),
  CONSTRAINT `FK_ProducerProducerImage_ProducerImage`
    FOREIGN KEY (`producer_image_id`)
    REFERENCES `winelife`.`producer_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`shipper` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название поставщика',
  `off_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название ООО',
  `manager` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Имя менеджера',
  `phone` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Телефон',
  `email` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Почтовый адрес',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`producer_to_shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`producer_to_shipper` (
  `producer_id` INT NOT NULL COMMENT 'ID of the producer',
  `shipper_id` INT NOT NULL COMMENT 'ID of shipper',
  PRIMARY KEY (`producer_id`, `shipper_id`),
  INDEX `FK_ProducerToShipper_Shipper` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `FK_ProducerToShipper_Producer`
    FOREIGN KEY (`producer_id`)
    REFERENCES `winelife`.`producer` (`id`),
  CONSTRAINT `FK_ProducerToShipper_Shipper`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `winelife`.`shipper` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year` INT NULL DEFAULT NULL COMMENT 'Год урожая',
  `is_nv` TINYINT(1) NULL DEFAULT NULL COMMENT 'True - если вино невинтажное, false - если вино винтажное',
  `assemblage_year` INT NULL DEFAULT NULL COMMENT 'Для невинтажных вин. Дата ассамбляжа',
  `assemblage_from` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Для невинтажных вин. Список винтажей из которых сделано вино',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID винной категории',
  `wine_country_id` INT NOT NULL COMMENT 'ID страны производства вина',
  `main_id` INT NULL DEFAULT NULL COMMENT 'ID к какой родительской категории относится',
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название категории вина',
  `image` BLOB NULL DEFAULT NULL COMMENT 'фотография категории',
  `info` TEXT NULL DEFAULT NULL COMMENT 'Информация об этой категории',
  PRIMARY KEY (`id`, `wine_country_id`),
  INDEX `FK_WineCategory_WineCountry` (`wine_country_id` ASC) VISIBLE,
  INDEX `FK_WineCategory_WineCategory` (`main_id` ASC) VISIBLE,
  CONSTRAINT `FK_WineCategory_WineCategory`
    FOREIGN KEY (`main_id`)
    REFERENCES `winelife`.`wine_category` (`id`),
  CONSTRAINT `FK_WineCategory_WineCountry`
    FOREIGN KEY (`wine_country_id`)
    REFERENCES `winelife`.`wine_country` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `producer_id` INT NOT NULL COMMENT 'ID производителя',
  `type_id` INT NOT NULL COMMENT 'ID типа вина',
  `wine_category_id` INT NOT NULL COMMENT 'ID категории вина',
  `cuvee_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название вина с учетом диакритических знаков',
  `original_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название вина на языке оригинала',
  `is_alcohol` TINYINT(1) NULL DEFAULT NULL COMMENT 'Алкогольное или нет',
  PRIMARY KEY (`id`),
  INDEX `FK_Wine_WineCategory` (`wine_category_id` ASC) VISIBLE,
  INDEX `FK_Wine_TypeOfWine` (`type_id` ASC) VISIBLE,
  INDEX `FK_Wine_Producer` (`producer_id` ASC) VISIBLE,
  CONSTRAINT `FK_Wine_Producer`
    FOREIGN KEY (`producer_id`)
    REFERENCES `winelife`.`producer` (`id`),
  CONSTRAINT `FK_Wine_TypeOfWine`
    FOREIGN KEY (`type_id`)
    REFERENCES `winelife`.`type_of_wine` (`id`),
  CONSTRAINT `FK_Wine_WineCategory`
    FOREIGN KEY (`wine_category_id`)
    REFERENCES `winelife`.`wine_category` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название файла изображения',
  `type` ENUM('Бутылка', 'Этикетка', 'Контр-этикетка', 'Акцизная марка', 'Кольеретка') NULL DEFAULT NULL COMMENT 'Тип фотографии',
  `image` BLOB NULL DEFAULT NULL COMMENT 'Изображение',
  `creator_id` INT NULL DEFAULT NULL COMMENT 'ID пользователя, который добавил изображение',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT 'Дата, в которую было загружено изображение',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wine_id` INT NOT NULL COMMENT 'ID вина',
  `grape_id` INT NULL DEFAULT NULL COMMENT 'ID сорта винограда',
  `vintage_type_id` INT NULL DEFAULT NULL COMMENT 'ID типа винтажа',
  `dosage_id` INT NULL DEFAULT NULL COMMENT 'ID уровня сахара в вине',
  `origin_id` INT NULL DEFAULT NULL COMMENT 'ID зоны производства',
  `aging_type_id` INT NULL DEFAULT NULL COMMENT 'ID типа выдержки',
  `measure_id` INT NULL DEFAULT NULL COMMENT 'ID единицы измерения для продолжительности выдержки',
  `aging_length` INT NULL DEFAULT NULL COMMENT 'Продолжительность выдержки',
  `certificate_id` INT NULL DEFAULT NULL COMMENT 'ID сертификата вина',
  `sugar_content` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'Содержание сахара в вине',
  `alcohol` DECIMAL(4,2) NULL DEFAULT NULL COMMENT 'Содержание алкоголя в вине',
  `wine_image_id` INT NULL DEFAULT NULL COMMENT 'ID изображения вина',
  `drink_from` DECIMAL(4,0) NULL DEFAULT NULL COMMENT 'Плато зрелости от (год)',
  `drink_to` DECIMAL(4,0) NULL DEFAULT NULL COMMENT 'Плато зрелости до (год)',
  `rarity` ENUM('Массовый продукт', 'Не редкое', 'Редкое', 'Очень редкое', '«Единорог»') NULL DEFAULT NULL COMMENT 'Редкость вина',
  `critics_scr` ENUM('Низкие', 'Средние или отсутствуют', 'Высокие', 'Очень высокие', 'Самые высокие') NULL DEFAULT NULL COMMENT 'Редкость вина',
  PRIMARY KEY (`id`),
  INDEX `FK_Vintage_Wine` (`wine_id` ASC) VISIBLE,
  INDEX `FK_Vintage_Grape` (`grape_id` ASC) VISIBLE,
  INDEX `FK_Vintage_VintageType` (`vintage_type_id` ASC) VISIBLE,
  INDEX `FK_Vintage_Dosage` (`dosage_id` ASC) VISIBLE,
  INDEX `FK_Vintage_Origin` (`origin_id` ASC) VISIBLE,
  INDEX `FK_Vintage_AgingType` (`aging_type_id` ASC) VISIBLE,
  INDEX `FK_Vintage_Measure` (`measure_id` ASC) VISIBLE,
  INDEX `FK_Vintage_Certificate` (`certificate_id` ASC) VISIBLE,
  INDEX `FK_Vintage_WineImage` (`wine_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_Vintage_AgingType`
    FOREIGN KEY (`aging_type_id`)
    REFERENCES `winelife`.`aging_type` (`id`),
  CONSTRAINT `FK_Vintage_Certificate`
    FOREIGN KEY (`certificate_id`)
    REFERENCES `winelife`.`certificate` (`id`),
  CONSTRAINT `FK_Vintage_Dosage`
    FOREIGN KEY (`dosage_id`)
    REFERENCES `winelife`.`dosage` (`id`),
  CONSTRAINT `FK_Vintage_Grape`
    FOREIGN KEY (`grape_id`)
    REFERENCES `winelife`.`grape` (`id`),
  CONSTRAINT `FK_Vintage_Measure`
    FOREIGN KEY (`measure_id`)
    REFERENCES `winelife`.`aging_length_measure` (`id`),
  CONSTRAINT `FK_Vintage_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`),
  CONSTRAINT `FK_Vintage_VintageType`
    FOREIGN KEY (`vintage_type_id`)
    REFERENCES `winelife`.`vintage_type` (`id`),
  CONSTRAINT `FK_Vintage_Wine`
    FOREIGN KEY (`wine_id`)
    REFERENCES `winelife`.`wine` (`id`),
  CONSTRAINT `FK_Vintage_WineImage`
    FOREIGN KEY (`wine_image_id`)
    REFERENCES `winelife`.`wine_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage_grape_blend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage_grape_blend` (
  `vintage_id` INT NOT NULL COMMENT 'ID вина',
  `grape_id` INT NOT NULL COMMENT 'ID сорта винограда',
  PRIMARY KEY (`vintage_id`, `grape_id`),
  INDEX `FK_WineGrapeBlend_Grape` (`grape_id` ASC) VISIBLE,
  CONSTRAINT `FK_WineGrapeBlend_Grape`
    FOREIGN KEY (`grape_id`)
    REFERENCES `winelife`.`grape` (`id`),
  CONSTRAINT `FK_WineGrapeBlend_Wine`
    FOREIGN KEY (`vintage_id`)
    REFERENCES `winelife`.`vintage` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage_quality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage_quality` (
  `vintage_type_id` INT NOT NULL COMMENT 'ID of the vintage_type',
  `origin_id` INT NOT NULL COMMENT 'ID of the origin',
  `title` ENUM('Слабый', 'Посредственный', 'Хороший', 'Великий', 'Классический', 'NULL') NULL DEFAULT NULL COMMENT 'Качество винтажа',
  PRIMARY KEY (`vintage_type_id`, `origin_id`),
  INDEX `FK_VintageQuality_Origin` (`origin_id` ASC) VISIBLE,
  CONSTRAINT `FK_VintageQuality_Origin`
    FOREIGN KEY (`origin_id`)
    REFERENCES `winelife`.`origin` (`id`),
  CONSTRAINT `FK_VintageQuality_VintageType`
    FOREIGN KEY (`vintage_type_id`)
    REFERENCES `winelife`.`vintage_type` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`volume`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`volume` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `volume_type` ENUM('Бутылка', 'Бокал') NULL DEFAULT NULL COMMENT 'Тип объёма',
  `measure_type` ENUM('l', 'ml', 'oz') NULL DEFAULT NULL COMMENT 'Тип измерения объёма. Это возможно пригодится позже, пока можно обойтись \"ml\", а позже перейти на автоматическую конвертацию для разных стран',
  `glass` FLOAT NULL DEFAULT NULL COMMENT 'Объём бокала',
  `btl` FLOAT NULL DEFAULT NULL COMMENT 'Объём бутылки',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`wine_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`wine_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Название винной карты',
  `last_edition` DATE NULL DEFAULT NULL COMMENT 'Дата последнего изменения',
  `est_id` INT NOT NULL COMMENT 'ID бизнеса, к которому принадлежит эта винная карта',
  PRIMARY KEY (`id`),
  INDEX `FK_WineList_Est` (`est_id` ASC) VISIBLE,
  CONSTRAINT `FK_WineList_Est`
    FOREIGN KEY (`est_id`)
    REFERENCES `winelife`.`establishment` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage_to_wine_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage_to_wine_list` (
  `vintage_id` INT NOT NULL COMMENT 'ID of the vintage',
  `wine_list_id` INT NOT NULL COMMENT 'ID of wine list',
  `volume_id` INT NOT NULL COMMENT 'ID объёма вина',
  `currency_id` INT NOT NULL COMMENT 'ID валюты в которой измеряется вино. Начало с рубля. Но в дальнейшем необходимо будет подключить конвертацию валют',
  `price` FLOAT NOT NULL COMMENT 'Стоимость вина в винной карте',
  `wine_added` DATE NULL DEFAULT NULL COMMENT 'Дата добавления в винную карту',
  `is_deleted` TINYINT(1) NULL DEFAULT NULL COMMENT 'Удалено или нет',
  `date_deleted` DATE NULL DEFAULT NULL COMMENT 'Дата удаления из винной карты',
  `cellar_1` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Погреб №1',
  `bin_1` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Место вина в погребе №1',
  `cellar_2` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Погреб №2',
  `bin_2` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Место вина в погребе №2',
  `cellar_3` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Погреб №3',
  `bin_3` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Место вина в погребе №3',
  `qty` FLOAT NULL DEFAULT NULL COMMENT 'Количество этого вина в винной карте',
  `cost` FLOAT NULL DEFAULT NULL COMMENT 'Последняя себестоимость',
  `shipper_id` INT NOT NULL COMMENT 'ID поставщика, у которого было куплено вино',
  `pos_id` INT NULL DEFAULT NULL COMMENT 'ID для привязки вина к PoS',
  `egais_id` INT NULL DEFAULT NULL COMMENT 'ID товара в системе ЕГАИС',
  PRIMARY KEY (`vintage_id`, `wine_list_id`),
  INDEX `FK_VintageToWineList_Volume` (`volume_id` ASC) VISIBLE,
  INDEX `FK_VintageToWineList_WineList` (`wine_list_id` ASC) VISIBLE,
  INDEX `FK_VintageToWineList_Currency` (`currency_id` ASC) VISIBLE,
  INDEX `FK_VintageToWineList_Shipper` (`shipper_id` ASC) VISIBLE,
  INDEX `FK_VintageToWineList_Egais` (`egais_id` ASC) VISIBLE,
  INDEX `FK_VintageToWineList_Pos` (`pos_id` ASC) VISIBLE,
  CONSTRAINT `FK_VintageToWineList_Currency`
    FOREIGN KEY (`currency_id`)
    REFERENCES `winelife`.`currency` (`id`),
  CONSTRAINT `FK_VintageToWineList_Egais`
    FOREIGN KEY (`egais_id`)
    REFERENCES `winelife`.`egais` (`id`),
  CONSTRAINT `FK_VintageToWineList_Pos`
    FOREIGN KEY (`pos_id`)
    REFERENCES `winelife`.`pos` (`id`),
  CONSTRAINT `FK_VintageToWineList_Shipper`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `winelife`.`shipper` (`id`),
  CONSTRAINT `FK_VintageToWineList_Vintage`
    FOREIGN KEY (`vintage_id`)
    REFERENCES `winelife`.`vintage` (`id`),
  CONSTRAINT `FK_VintageToWineList_Volume`
    FOREIGN KEY (`volume_id`)
    REFERENCES `winelife`.`volume` (`id`),
  CONSTRAINT `FK_VintageToWineList_WineList`
    FOREIGN KEY (`wine_list_id`)
    REFERENCES `winelife`.`wine_list` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `winelife`.`vintage_wine_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `winelife`.`vintage_wine_image` (
  `vintage_id` INT NOT NULL COMMENT 'ID винтажа',
  `wine_image_id` INT NOT NULL COMMENT 'ID изображения вина',
  PRIMARY KEY (`vintage_id`, `wine_image_id`),
  INDEX `FK_VintageWineImage_WineImage` (`wine_image_id` ASC) VISIBLE,
  CONSTRAINT `FK_VintageWineImage_Vintage`
    FOREIGN KEY (`vintage_id`)
    REFERENCES `winelife`.`vintage` (`id`),
  CONSTRAINT `FK_VintageWineImage_WineImage`
    FOREIGN KEY (`wine_image_id`)
    REFERENCES `winelife`.`wine_image` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
