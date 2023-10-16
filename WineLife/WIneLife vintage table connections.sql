USE winelife;

-- Connect the vintage table with the wine table 
ALTER TABLE vintage
ADD CONSTRAINT FK_Vintage_Wine
FOREIGN KEY (wine_id) REFERENCES wine (id),

-- Connect with the grape table
ADD CONSTRAINT FK_Vintage_Grape
FOREIGN KEY (grape_id) REFERENCES grape (id),

-- Connect with the vintage_type table 
ADD CONSTRAINT FK_Vintage_VintageType
FOREIGN KEY (vintage_type_id) REFERENCES vintage_type (id),

-- Connect with the dosage table 
ADD CONSTRAINT FK_Vintage_Dosage
FOREIGN KEY (dosage_id) REFERENCES dosage (id),

-- Connect with the origin table 
ADD CONSTRAINT FK_Vintage_Origin
FOREIGN KEY (origin_id) REFERENCES origin (id),

-- Connect with the aging_type table 
ADD CONSTRAINT FK_Vintage_AgingType
FOREIGN KEY (aging_type_id) REFERENCES aging_type (id),

-- Connect with the aging_length_measure table 
ADD CONSTRAINT FK_Vintage_Measure
FOREIGN KEY (measure_id) REFERENCES aging_length_measure (id),

-- Connect with the certificate table 
ADD CONSTRAINT FK_Vintage_Certificate
FOREIGN KEY (certificate_id) REFERENCES certificate (id),

-- Connect with the wine_image table 
ADD CONSTRAINT FK_Vintage_WineImage
FOREIGN KEY (wine_image_id) REFERENCES wine_image (id);
