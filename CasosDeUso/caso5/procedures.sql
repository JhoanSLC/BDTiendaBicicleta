DELIMITER $$

CREATE PROCEDURE registrarDetalleCompra(
    IN p_compraId INT,
    IN p_repuestoId INT,
    IN p_cantidad INT,
    IN p_precioUnitario DECIMAL(10,2)
)
BEGIN
    -- Insertar el detalle de compra
    INSERT INTO detalleCompra (compraId, repuestoId, cantidad, precioUnitario)
    VALUES (p_compraId, p_repuestoId, p_cantidad, p_precioUnitario);
    
    -- Actualizar el stock del repuesto
    UPDATE repuesto
    SET stock = stock + p_cantidad
    WHERE id = p_repuestoId;
END$$

DELIMITER ;

DELIMITER $$

DROP TRIGGER IF EXISTS actualizar_stock_repuestos$$

CREATE TRIGGER actualizar_stock_repuestos 
AFTER INSERT ON detalleCompra
FOR EACH ROW
BEGIN
    -- Llamar al procedimiento para actualizar el stock
    CALL registrarDetalleCompra(NEW.compraId, NEW.repuestoId, NEW.cantidad, NEW.precioUnitario);
END$$

DELIMITER ;
