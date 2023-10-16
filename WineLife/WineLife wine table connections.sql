USE winelife;

-- Connect the wine table with the wine_category table 
ALTER TABLE wine
ADD CONSTRAINT FK_Wine_WineCategory
FOREIGN KEY (wine_category_id) REFERENCES wine_category (id),

-- Connect the wine table with the type_of_wine table 
ADD CONSTRAINT FK_Wine_TypeOfWine
FOREIGN KEY (type_id) REFERENCES type_of_wine (id),

-- Connect the wine table with the producer table 
ADD CONSTRAINT FK_Wine_Producer
FOREIGN KEY (producer_id) REFERENCES producer (id);