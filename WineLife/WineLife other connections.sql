USE winelife;

-- Connect the grape table with the grape table (self-referencing)
ALTER TABLE grape
ADD CONSTRAINT FK_GrapeGrape_Main_id
FOREIGN KEY (main_id) REFERENCES grape (id);

-- Connect the wine_list table with the establishment table
ALTER TABLE wine_list
ADD CONSTRAINT FK_WineList_Est
FOREIGN KEY (est_id) REFERENCES establishment (id);

-- Connect the dosage table with the type_of_wine table
ALTER TABLE dosage
ADD CONSTRAINT FK_Dosage_TypeOfWine
FOREIGN KEY (type_id) REFERENCES type_of_wine (id);