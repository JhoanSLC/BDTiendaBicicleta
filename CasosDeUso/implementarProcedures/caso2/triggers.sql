/* Este trigger se usa para asegurar que la cantidad
    del stock sea suficiente para la venta que se 
    hace */

DELIMITER $$
DROP TRIGGER IF EXISTS verificarStockAntesDeVenta$$
CREATE TRIGGER verificarStockAntesDeVenta
BEFORE INSERT ON detalleVenta
FOR EACH ROW
BEGIN
    DECLARE stockActual INT;
    
    -- Obtener el stock actual de la bicicleta --
    SELECT stock INTO stockActual
    FROM bicicleta
    WHERE id = NEW.bicicletaId;
    
    -- Verificar que el stock sea suficiente --
    IF stockActual < NEW.Cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la bicicleta seleccionada';
    END IF;
END $$
DELIMITER ;



-- TESTEADO Y FUNCIONANDO --
