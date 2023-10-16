USE winelife;

-- Connect the origin table with all origin tables
ALTER TABLE origin

-- Connect with the wine_country table
ADD CONSTRAINT FK_Origin_WineCountry
FOREIGN KEY (wine_country_id) REFERENCES wine_country (id),

-- Connect with the wine_region table
ADD CONSTRAINT FK_Origin_WineRegion
FOREIGN KEY (wine_region_id) REFERENCES wine_region (id),

-- Connect with the subregion table
ADD CONSTRAINT FK_Origin_Subregion
FOREIGN KEY (subregion_id) REFERENCES subregion (id),

-- Connect with the commune table
ADD CONSTRAINT FK_Origin_Commune
FOREIGN KEY (commune_id) REFERENCES commune (id),

-- Connect with the appellation table
ADD CONSTRAINT FK_Origin_Appellation
FOREIGN KEY (appellation_id) REFERENCES appellation (id),

-- Connect with the class_of_cru table
ADD CONSTRAINT FK_Origin_ClassOfCru
FOREIGN KEY (class_of_cru_id) REFERENCES class_of_cru (id),

-- Connect with the lieu_dit table
ADD CONSTRAINT FK_Origin_LieuDit
FOREIGN KEY (lieu_dit_id) REFERENCES lieu_dit (id),

-- Connect with the vineyard table
ADD CONSTRAINT FK_Origin_Vineyard
FOREIGN KEY (vineyard_id) REFERENCES vineyard (id);

-- Connect the wine_region table with the wine_country table
ALTER TABLE wine_region
ADD CONSTRAINT FK_WineRegion_WineCountry
FOREIGN KEY (wine_country_id) REFERENCES wine_country (id);

-- Connect the subregion table with the wine_region table
ALTER TABLE subregion
ADD CONSTRAINT FK_Subregion_WineRegion
FOREIGN KEY (wine_region_id) REFERENCES wine_region (id);

-- Connect the commune table with the wine_region table
ALTER TABLE commune
ADD CONSTRAINT FK_Commune_WineRegion
FOREIGN KEY (wine_region_id) REFERENCES wine_region (id);

-- Connect the appellation table with the wine_country
ALTER TABLE appellation
ADD CONSTRAINT FK_Appellation_WineCountry
FOREIGN KEY (wine_country_id) REFERENCES wine_country (id),

-- Connect with the wine_region
ADD CONSTRAINT FK_Appellation_WineRegion
FOREIGN KEY (wine_region_id) REFERENCES wine_region (id);

-- Connect the class_of_cru table with the appellation table
ALTER TABLE class_of_cru
ADD CONSTRAINT FK_ClassOfCru_Appellation
FOREIGN KEY (appellation_id) REFERENCES appellation (id);

-- Connect the vineyard table with the subregion table
ALTER TABLE vineyard
ADD CONSTRAINT FK_Vineyard_Subregion
FOREIGN KEY (subregion_id) REFERENCES subregion (id),

-- Connect with the commune table
ADD CONSTRAINT FK_Vineyard_Commune
FOREIGN KEY (commune_id) REFERENCES commune (id);

-- Connect the lieu_dit table with the subregion table
ALTER TABLE lieu_dit
ADD CONSTRAINT FK_LieuDit_Subregion
FOREIGN KEY (subregion_id) REFERENCES subregion (id),

-- Connect with the commune table 
ADD CONSTRAINT FK_LieuDit_Commune
FOREIGN KEY (commune_id) REFERENCES commune (id);
