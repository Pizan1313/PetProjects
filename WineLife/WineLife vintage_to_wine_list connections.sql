USE winelife;

-- Connect vintage_to_wine_list tables with other tables

ALTER TABLE vintage_to_wine_list
-- Connect with the vintage table
ADD CONSTRAINT FK_VintageToWineList_Vintage
FOREIGN KEY (vintage_id) REFERENCES vintage (id),

-- Connect with the volume table
ADD CONSTRAINT FK_VintageToWineList_Volume
FOREIGN KEY (volume_id) REFERENCES volume (id),

-- Connect with the wine_list table
ADD CONSTRAINT FK_VintageToWineList_WineList
FOREIGN KEY (wine_list_id) REFERENCES wine_list (id),

-- Connect with the currency table
ADD CONSTRAINT FK_VintageToWineList_Currency
FOREIGN KEY (currency_id) REFERENCES currency (id),

-- Connect with the shipper table
ADD CONSTRAINT FK_VintageToWineList_Shipper
FOREIGN KEY (shipper_id) REFERENCES shipper (id),

-- Connect with the egais table
ADD CONSTRAINT FK_VintageToWineList_Egais
FOREIGN KEY (egais_id) REFERENCES egais (id),

-- Connect with the pos table
ADD CONSTRAINT FK_VintageToWineList_Pos
FOREIGN KEY (pos_id) REFERENCES pos (id);