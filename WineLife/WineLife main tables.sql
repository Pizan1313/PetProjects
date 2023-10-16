CREATE SCHEMA IF NOT EXISTS `winelife` ;
USE winelife;

-- Create the producer table
CREATE TABLE `producer` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'Название производителя на латинице + диакритические знаки',
    `original_name` VARCHAR(255) NOT NULL COMMENT 'Название на языке оригинала',
    `origin_id` INT NOT NULL COMMENT 'ID зоны производства',
    `info` TEXT COMMENT 'Информация о производителе',
    `image` BLOB COMMENT 'Фотографии винодела',
    `category` ENUM('Negoсiant', 'Grower', 'RM', 'NM') COMMENT 'Категория производителя',
    `main_id` INT COMMENT 'К какому производителю относится',
    `certificate_id` INT COMMENT 'ID сертификата производителя',
    `producer_image_id` INT COMMENT 'ID фото производителя',
    `status` ENUM('Обычный', 'Хороший', 'Топовый') COMMENT 'Статус производителя'
);

-- Create the origin table
CREATE TABLE `origin` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `wine_country_id` INT NOT NULL COMMENT 'ID Страна производства вина',
    `wine_region_id` INT COMMENT 'ID Регион',
    `subregion_id` INT COMMENT 'ID Субрегион',
    `commune_id` INT COMMENT 'ID Коммуна',
    `appellation_id` INT NOT NULL COMMENT 'ID Название аппелласьона',
    `vineyard_id` INT COMMENT 'ID Название виноградника',
    `class_of_cru_id` INT COMMENT 'ID Название класса вина',
    `lieu_dit_id` INT COMMENT 'ID Название льё-ди'
);

-- Create the wine_country table
CREATE TABLE `wine_country` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название страны производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );

-- Create the wine_region table
CREATE TABLE `wine_region` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название региона производства вина',
    `wine_country_id` INT NOT NULL COMMENT 'ID Страна производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );

-- Create the subregion table
CREATE TABLE `subregion` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название субрегина производства вина',
    `wine_region_id` INT NOT NULL COMMENT 'ID Региона производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );

-- Create the commune table
CREATE TABLE `commune` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название коммуны производства вина',
    `wine_region_id` INT NOT NULL COMMENT 'ID Региона производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );
  
-- Create the appellation table
CREATE TABLE `appellation` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название аппелласьона производства вина',
    `wine_country_id` INT NOT NULL COMMENT 'ID Страны производства вина',
    `wine_region_id` INT COMMENT 'ID Региона производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом аппелласьоне'
    );
    
-- Create the class_of_cru table
CREATE TABLE `class_of_cru` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название класса крю',
    `appellation_id` INT NOT NULL COMMENT 'ID Аппелласьона производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом классе крю'
    );

-- Create the vineyard table
CREATE TABLE `vineyard` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название виноградника производства вина',
    `subregion_id` INT NOT NULL COMMENT 'id Субрегиона производства вина',
    `commune_id` INT COMMENT 'id Коммуны производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );

-- Create the lieu_dit table
CREATE TABLE `lieu_dit` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL COMMENT 'Название льё-ди производства вина',
    `subregion_id` INT NOT NULL COMMENT 'id Субрегиона производства вина',
    `commune_id` INT COMMENT 'id Коммуны производства вина',
    `origin_image_id` INT COMMENT 'ID фото места производства',
    `info` TEXT COMMENT 'Информация об этом месте'
    );

-- Create the wine table
CREATE TABLE `wine` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `producer_id` INT NOT NULL COMMENT 'ID производителя',
    `type_id` INT NOT NULL COMMENT 'ID типа вина',
    `wine_category_id` INT NOT NULL COMMENT 'ID категории вина',
    `cuvee_name` VARCHAR(255) COMMENT 'Название вина с учетом диакритических знаков',
    `original_name` VARCHAR(255) COMMENT 'Название вина на языке оригинала',
    `is_alcohol` BOOLEAN COMMENT 'Алкогольное или нет'
);

-- Create the wine_image table
CREATE TABLE `wine_image` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) COMMENT 'Название файла изображения',
    `type` ENUM('Бутылка', 'Этикетка', 'Контр-этикетка', 'Акцизная марка', 'Кольеретка') COMMENT 'Тип фотографии',
    `image` BLOB COMMENT 'Изображение',
    `creator_id` INT COMMENT 'ID пользователя, который добавил изображение',
    `created_at` DATETIME COMMENT 'Дата, в которую было загружено изображение'
);

-- Create the producer_image table
CREATE TABLE `producer_image` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) COMMENT 'Название файла изображения',
    `image` BLOB COMMENT 'Изображение',
    `creator_id` INT COMMENT 'ID пользователя, который добавил изображение',
    `created_at` DATETIME COMMENT 'Дата, в которую было загружено изображение'
);

-- Create the origin_image table
CREATE TABLE `origin_image` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) COMMENT 'Название файла изображения',
    `image` BLOB COMMENT 'Изображение',
    `creator_id` INT COMMENT 'ID пользователя, который добавил изображение',
    `created_at` DATETIME COMMENT 'Дата, в которую было загружено изображение'
);

-- Create the vintage table
CREATE TABLE `vintage` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `wine_id` INT NOT NULL COMMENT 'ID вина',
    `grape_id` INT COMMENT 'ID сорта винограда',
    `vintage_type_id` INT COMMENT 'ID типа винтажа',
    `dosage_id` INT COMMENT 'ID уровня сахара в вине',
    `origin_id` INT COMMENT 'ID зоны производства',
    `aging_type_id` INT COMMENT 'ID типа выдержки',
    `measure_id` INT COMMENT 'ID единицы измерения для продолжительности выдержки',
    `aging_length` INT COMMENT 'Продолжительность выдержки',
    `certificate_id` INT COMMENT 'ID сертификата вина',
    `sugar_content` DECIMAL(5, 2) COMMENT 'Содержание сахара в вине',
    `alcohol` DECIMAL(4, 2) COMMENT 'Содержание алкоголя в вине',
    `wine_image_id` INT COMMENT 'ID изображения вина',
    `drink_from` DECIMAL(4, 0) COMMENT 'Плато зрелости от (год)',
    `drink_to` DECIMAL(4, 0) COMMENT 'Плато зрелости до (год)',
    `rarity` ENUM('Массовый продукт', 'Не редкое', 'Редкое', 'Очень редкое', '«Единорог»') COMMENT 'Редкость вина',
	`critics_scr` ENUM('Низкие', 'Средние или отсутствуют', 'Высокие', 'Очень высокие', 'Самые высокие') COMMENT 'Редкость вина'
);

-- Create the grape table
CREATE TABLE `grape` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `main_id` INT COMMENT 'ID родительского сорта винограда',
    `title` VARCHAR(255) NOT NULL COMMENT 'Название сорта винограда или его синонима',
    `percentage` DECIMAL(5, 2) COMMENT 'Процентное содержание винограда'
);

-- Create the vintage_type table
CREATE TABLE `vintage_type` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `year` INT COMMENT 'Год урожая',
    `is_nv` BOOLEAN COMMENT 'True - если вино невинтажное, false - если вино винтажное',
    `assemblage_year` INT COMMENT 'Для невинтажных вин. Дата ассамбляжа',
	`assemblage_from` VARCHAR(255) COMMENT 'Для невинтажных вин. Список винтажей из которых сделано вино'
);

-- Create the dosage table
CREATE TABLE `dosage` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `dosage_title` VARCHAR(255) COMMENT 'Название дозажа',
    `dosage_year` DATE COMMENT 'Дата дозажа (только для типа вина "игристые")',
    `type_id` INT COMMENT 'Тип вина (для определения игристое вино или нет)'
);

-- Create the aging_type table
CREATE TABLE `aging_type` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `aging_type` VARCHAR(255) COMMENT 'Название типа выдержки'
);

-- Create the aging_length_measure table
CREATE TABLE `aging_length_measure` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `measure` ENUM('день', 'месяц', 'год', 'неделя') COMMENT 'Название (день, месяц, год, неделя)'
);

-- Create the certificate table
CREATE TABLE `certificate` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) COMMENT 'Название сертификата',
    `logo` BLOB COMMENT 'Логотип сертификата',
    `info` TEXT COMMENT 'Информация об этом сертификате'
);



-- Create the type_of_wine table
CREATE TABLE `type_of_wine` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `color` ENUM('Белое', 'Красное', 'Розовое', 'Оранжевое')  COMMENT 'Цвет вина',
    `type` ENUM('Тихое', 'Игристое', 'Сладкое/Креплёное') COMMENT 'Тип вина',
    `prod_method` ENUM('Классический (Classic)', 'Акратофорный (Charmat)', 'Пет-Нат (Ancestrale/Pét-Nat)', 'Col Fondo') COMMENT 'Метод производства (если вина игристое, если не игристое, то Null)',
    `variation` VARCHAR(255) COMMENT 'Разновидность крепкого/сладкого вина (если игристое или тихое, то null)'
);

-- Create the vintage_to_wine_list table
CREATE TABLE `vintage_to_wine_list` (
    `vintage_id` INT NOT NULL COMMENT 'ID of the vintage',
    `wine_list_id` INT NOT NULL COMMENT 'ID of wine list',
    `volume_id` INT NOT NULL COMMENT 'ID объёма вина',
    `currency_id` INT NOT NULL COMMENT 'ID валюты в которой измеряется вино. Начало с рубля. Но в дальнейшем необходимо будет подключить конвертацию валют',
    `price` FLOAT NOT NULL  COMMENT 'Стоимость вина в винной карте',
    `wine_added` DATE COMMENT 'Дата добавления в винную карту',
	`is_deleted` BOOLEAN COMMENT 'Удалено или нет',
    `date_deleted` DATE COMMENT 'Дата удаления из винной карты',
    `cellar_1` VARCHAR(255)  COMMENT 'Погреб №1',
    `bin_1` VARCHAR(255)  COMMENT 'Место вина в погребе №1',
    `cellar_2` VARCHAR(255)  COMMENT 'Погреб №2',
    `bin_2` VARCHAR(255)  COMMENT 'Место вина в погребе №2',
    `cellar_3` VARCHAR(255)  COMMENT 'Погреб №3',
    `bin_3` VARCHAR(255)  COMMENT 'Место вина в погребе №3',
	`qty` FLOAT COMMENT 'Количество этого вина в винной карте',
    `cost` FLOAT COMMENT 'Последняя себестоимость',
    `shipper_id` INT NOT NULL COMMENT 'ID поставщика, у которого было куплено вино',
    `pos_id` INT COMMENT 'ID для привязки вина к PoS',
    `egais_id` INT COMMENT 'ID товара в системе ЕГАИС',
    PRIMARY KEY (`vintage_id`, `wine_list_id`)
);

-- Create the wine_list table
CREATE TABLE `wine_list` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255)  COMMENT 'Название винной карты',
    `last_edition` DATE COMMENT 'Дата последнего изменения',
    `est_id` INT NOT NULL COMMENT 'ID бизнеса, к которому принадлежит эта винная карта'
);


-- Create the volume table
CREATE TABLE `volume` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `volume_type` ENUM('Бутылка', 'Бокал')  COMMENT 'Тип объёма',
    `measure_type` ENUM('l','ml', 'oz')  COMMENT 'Тип измерения объёма. Это возможно пригодится позже, пока можно обойтись "ml", а позже перейти на автоматическую конвертацию для разных стран',
    `glass` FLOAT COMMENT 'Объём бокала',
    `btl` FLOAT COMMENT 'Объём бутылки'
);

-- Create the currency table
CREATE TABLE `currency` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255)  COMMENT 'Название валюты',
    `sign` VARCHAR(255)  COMMENT 'Символ валюты',
    `abbreviation` VARCHAR(255)  COMMENT 'Аббревиатура валюты'
);

-- Create the shipper table
CREATE TABLE `shipper` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255)  COMMENT 'Название поставщика',
    `off_name` VARCHAR(255)  COMMENT 'Название ООО',
    `manager` VARCHAR(255)  COMMENT 'Имя менеджера',
    `phone` VARCHAR(255)  COMMENT 'Телефон',
    `email` VARCHAR(255)  COMMENT 'Почтовый адрес'
);

-- Create the egais table
CREATE TABLE `egais` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `number` VARCHAR(255)  COMMENT 'Код вина в системе ЕГАИС',
    `qr` BLOB COMMENT 'qr-code ЕГАИС вина на бутылке',
    `barcode` VARCHAR(255) COMMENT 'bar-code ЕГАИС вина на бутылке',
    `title` VARCHAR(255)  COMMENT 'Официальное название товара в системе ЕГАИС'
);

-- Create the pos table
CREATE TABLE `pos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY
);

-- Create the establishment table
CREATE TABLE `establishment` (
    `id` INT AUTO_INCREMENT PRIMARY KEY);