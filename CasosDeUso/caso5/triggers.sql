DELIMITER $$
DROP TRIGGER IF EXISTS stockNegativoRepuestoIns$$
CREATE TRIGGER stockRepuestoIns
BEFORE INSERT ON repuesto
FOR EACH ROW 
BEGIN 
    IF NEW.stock < 0 OR NEW.precio < 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El "STOCK" y el "PRECIO" no pueden ser negativos';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS stockNegativoRepuestoIns$$
CREATE TRIGGER stockRepuestoIns
BEFORE UPDATE ON repuesto
FOR EACH ROW 
BEGIN 
    IF NEW.stock < 0 OR NEW.precio < 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El "STOCK" y el "PRECIO" no pueden ser negativos';
    END IF;
END$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS verificarStockAntesDeCompra$$
CREATE TRIGGER verificarStockAntesDeCompra
BEFORE INSERT ON detalleCompra
FOR EACH ROW
BEGIN   
    DECLARE stockActual INT;
    
    -- Obtener el stock actual del repuesto --
    SELECT stock INTO stockActual
    FROM repuesto
    WHERE id = NEW.repuestoId;
    
    -- Verificar que el stock sea suficiente --
    IF stockActual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la bicicleta seleccionada';
    END IF;
END $$
DELIMITER ;