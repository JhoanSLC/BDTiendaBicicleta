-- TRIGGER PARA VERIFICAR QUE NO SE INGRESE UNA BICICLETA CON STOCK NEGATIVO --

    -- !!!!!!!! BEFORE INSERT !!!!!!!!!! --
DELIMITER $$
DROP TRIGGER IF EXISTS stockNegativoIns $$
CREATE TRIGGER stockNegativoIns
BEFORE INSERT ON bicicleta
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 OR NEW.precio < 0 THEN -- Si se inserta un valor negativo para el stock --
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El "STOCK" y el "PRECIO" no pueden ser negativo'; -- Enviar un mensaje --
    END IF;
END $$
DELIMITER ;


    -- !!!!!!!!! BEFORE UPDATE !!!!!!!! --
DELIMITER $$
DROP TRIGGER IF EXISTS stockNegativoUpd$$
CREATE TRIGGER stockNegativoUpd
BEFORE UPDATE ON bicicleta
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 OR NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El "STOCK" y el "PRECIO" no pueden ser negativo';
    END IF;
END $$
DELIMITER ;
