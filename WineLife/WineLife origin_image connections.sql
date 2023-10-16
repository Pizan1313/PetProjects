USE winelife;
-- Connect origin_image table with wine_country table
ALTER TABLE wine_country
ADD CONSTRAINT FK_OriginImage_WineCountry
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with wine_region table
ALTER TABLE wine_region
ADD CONSTRAINT FK_OriginImage_WineRegion
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with subregion table
ALTER TABLE subregion
ADD CONSTRAINT FK_OriginImage_Subregion
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with commune table
ALTER TABLE commune
ADD CONSTRAINT FK_OriginImage_Commune
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with appellation table
ALTER TABLE appellation
ADD CONSTRAINT FK_OriginImage_Appellation
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with class_of_cru table
ALTER TABLE class_of_cru
ADD CONSTRAINT FK_OriginImage_ClassOfCru
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with vineyard table
ALTER TABLE vineyard
ADD CONSTRAINT FK_OriginImage_Vineyard
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);

-- Connect origin_image table with lieu_dit table
ALTER TABLE lieu_dit
ADD CONSTRAINT FK_OriginImage_LieuDit
FOREIGN KEY (origin_image_id) REFERENCES origin_image (id);
