USE winelife;
-- Creating junction tables
-- Connect origin with commune
CREATE TABLE `origin_commune` (
    `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
    `commune_id` INT NOT NULL COMMENT 'ID коммуны',
    PRIMARY KEY (`origin_id` , `commune_id`)
);

/* Виноград для вина может быть собран в нескольких коммунах */
ALTER TABLE origin_commune
ADD CONSTRAINT FK_OriginCommune_Origin 
FOREIGN KEY (origin_id) REFERENCES origin (id) ,
ADD CONSTRAINT FK_OriginCommune_Commune 
FOREIGN KEY (commune_id) REFERENCES commune (id);

-- Connect origin with vineyard
CREATE TABLE `origin_vineyard` (
    `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
    `vineyard_id` INT NOT NULL COMMENT 'ID виноградника',
    PRIMARY KEY (`origin_id` , `vineyard_id`)
);

/*Виноград может быть собран с нескольких виноградников */
ALTER TABLE origin_vineyard
ADD CONSTRAINT FK_OriginVineyard_Origin
FOREIGN KEY (origin_id) REFERENCES origin (id),
ADD CONSTRAINT FK_OriginCommune_Vineyard
FOREIGN KEY (vineyard_id) REFERENCES vineyard (id);

-- Connect origin with lieu_dit
CREATE TABLE `origin_lieu_dit` (
    `origin_id` INT NOT NULL COMMENT 'ID места происхождения',
    `lieu_dit_id` INT NOT NULL COMMENT 'ID льё-ди',
    PRIMARY KEY (`origin_id`, `lieu_dit_id`)
);

/* Виноград для вина может быть собран с нескольких льё-ди */
ALTER TABLE origin_lieu_dit
ADD CONSTRAINT FK_OriginLieuDit_Origin
FOREIGN KEY (origin_id) REFERENCES origin (id),
ADD CONSTRAINT FK_OriginCommune_LieuDit
FOREIGN KEY (lieu_dit_id) REFERENCES lieu_dit (id);

-- Connect vintage with grape
CREATE TABLE `vintage_grape_blend` (
    `vintage_id` INT NOT NULL COMMENT 'ID вина',
    `grape_id` INT NOT NULL COMMENT 'ID сорта винограда',
    PRIMARY KEY (`vintage_id`, `grape_id`)
);

/* Вино может быть сделано из множества сортов винограда 'grape_id' */
ALTER TABLE vintage_grape_blend
ADD CONSTRAINT FK_WineGrapeBlend_Wine
FOREIGN KEY (vintage_id) REFERENCES vintage (id),
ADD CONSTRAINT FK_WineGrapeBlend_Grape
FOREIGN KEY (grape_id) REFERENCES grape (id);


-- Connect vintage with wine_image
CREATE TABLE `vintage_wine_image` (
    `vintage_id` INT NOT NULL COMMENT 'ID винтажа',
    `wine_image_id` INT NOT NULL COMMENT 'ID изображения вина',
    PRIMARY KEY (`vintage_id`, `wine_image_id`)
);

/* У одного винтажа вина может быть несколько фотографий */
ALTER TABLE vintage_wine_image
ADD CONSTRAINT FK_VintageWineImage_Vintage
FOREIGN KEY (vintage_id) REFERENCES vintage (id),
ADD CONSTRAINT FK_VintageWineImage_WineImage
FOREIGN KEY (wine_image_id) REFERENCES wine_image (id);


-- Connect producer with producer_image
CREATE TABLE `producer_producer_image` (
    `producer_id` INT NOT NULL COMMENT 'ID of the producer',
    `producer_image_id` INT NOT NULL COMMENT 'ID of producer images',
    PRIMARY KEY (`producer_id`, `producer_image_id`)
);

/* У винодела могут быть несколько фотографий винодельни */
ALTER TABLE producer_producer_image
ADD CONSTRAINT FK_ProducerProducerImage_Producer
FOREIGN KEY (producer_id) REFERENCES producer (id),
ADD CONSTRAINT FK_ProducerProducerImage_ProducerImage
FOREIGN KEY (producer_image_id) REFERENCES producer_image (id);


-- Connect producer with shipper
CREATE TABLE `producer_to_shipper` (
    `producer_id` INT NOT NULL COMMENT 'ID of the producer',
    `shipper_id` INT NOT NULL COMMENT 'ID of shipper',
    PRIMARY KEY (`producer_id`, `shipper_id`)
);

/* У производителя может быть неколько поставщиков. И у поставщика может быть несколько производителей */
ALTER TABLE producer_to_shipper
ADD CONSTRAINT FK_ProducerToShipper_Producer
FOREIGN KEY (producer_id) REFERENCES producer (id),
ADD CONSTRAINT FK_ProducerToShipper_Shipper
FOREIGN KEY (shipper_id) REFERENCES shipper (id);

-- Сonnect vintage_type with origin and give this connection a title
CREATE table vintage_quality (
	`vintage_type_id` INT NOT NULL COMMENT 'ID of the vintage_type',
	`origin_id` INT NOT NULL COMMENT 'ID of the origin',
    `title` ENUM('Слабый', 'Посредственный', 'Хороший', 'Великий', 'Классический', 'NULL') COMMENT 'Качество винтажа',
	PRIMARY KEY (`vintage_type_id`, `origin_id`)
);

-- У каждого места происхождения в разный год разное качество урожая и у всех вин из этого места будет одинаковое качество
ALTER TABLE vintage_quality
ADD CONSTRAINT FK_VintageQuality_VintageType
FOREIGN KEY (vintage_type_id) REFERENCES vintage_type (id),
ADD CONSTRAINT FK_VintageQuality_Origin
FOREIGN KEY (origin_id) REFERENCES origin (id);


-- Create wine categories for the wine table and connect them with the wine_country table
CREATE TABLE `wine_category` (
    `id` INT AUTO_INCREMENT COMMENT 'ID винной категории',
    `wine_country_id` INT NOT NULL COMMENT 'ID страны производства вина',
    `main_id` INT COMMENT 'ID к какой родительской категории относится',
    `title` VARCHAR(255) COMMENT 'Название категории вина',
    `image` BLOB COMMENT 'фотография категории',
    `info` TEXT COMMENT 'Информация об этой категории',
    PRIMARY KEY (`id`,`wine_country_id`)
);

-- Вино может быть без категории. Но если есть категория - она в каждой стране может быть разная
ALTER TABLE wine_category
ADD CONSTRAINT FK_WineCategory_WineCountry
FOREIGN KEY (wine_country_id) REFERENCES wine_country (id),
ADD CONSTRAINT FK_WineCategory_WineCategory -- self-referencing
FOREIGN KEY (main_id) REFERENCES wine_category (id);