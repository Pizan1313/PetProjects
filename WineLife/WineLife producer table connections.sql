USE winelife;

-- Connect the producer table with the producer table (self-referencing)
ALTER TABLE producer
ADD CONSTRAINT FK_ProducerProducer_Main_id
FOREIGN KEY (main_id) REFERENCES producer (id),

-- Connect with the origin table 
ADD CONSTRAINT FK_Producer_Origin
FOREIGN KEY (origin_id) REFERENCES origin (id),

-- Connect with the certificate table 
ADD CONSTRAINT FK_Producer_Certificate
FOREIGN KEY (certificate_id) REFERENCES certificate (id),

-- Connect with the producer_image_id table 
ADD CONSTRAINT FK_Producer_ProducerImage
FOREIGN KEY (producer_image_id) REFERENCES producer_image (id);
