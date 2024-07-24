/* Este trigger se encarga de actualizar el stock de la bicicleta 
que se vende y además se verifica que haya suficiente stock para vender la cantidad
que se pide  */

DELIMITER $$
DROP TRIGGER IF EXISTS stockEnVentaIns$$
CREATE TRIGGER stockEnVentaIns
AFTER INSERT ON detalleVenta
FOR EACH ROW
BEGIN
    UPDATE bicicleta
    SET stock = stock - NEW.cantidad
    WHERE ID = NEW.bicicletaId;
    
        /* Se hace uso de una sub consulta para traer la cantidad de stock actual
        de la bicicleta que se vende y si es menor que 0, se devuelve un error y no se hace
        la venta */
    IF (SELECT stock FROM bicicleta WHERE id = NEW.bicicletaId) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la venta';
    END IF;
END $$

DELIMITER $$

DROP PROCEDURE IF EXISTS actualizarPrecioUnitario$$
CREATE PROCEDURE actualizarPrecioUnitario(
    IN p_detalleVentaId INT,
    IN p_bicicletaId INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    
    -- Obtener el precio de la bicicleta
    SELECT precio INTO v_precio
    FROM bicicleta
    WHERE id = p_bicicletaId;

    -- Actualizar el precioUnitario en detalleVenta
    UPDATE detalleVenta
    SET precioUnitario = v_precio
    WHERE id = p_detalleVentaId;
END $$

DELIMITER ;


/* Este trigger */
DELIMITER $$
DROP TRIGGER IF EXISTS agregarPrecioUnitarioIns$$
CREATE TRIGGER agregarPrecioUnitarioIns
BEFORE INSERT ON detalleVenta
FOR EACH ROW
BEGIN
    CALL actualizarPrecioUnitario(NEW.id,NEW.bicicletaId);
END $$
DELIMITER ;



