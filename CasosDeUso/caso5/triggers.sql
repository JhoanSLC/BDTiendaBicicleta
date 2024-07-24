DELIMITER $$

CREATE TRIGGER actualizar_stock_repuestos 
AFTER INSERT ON detalleCompra
FOR EACH ROW
BEGIN
    UPDATE repuesto
    SET stock = stock + NEW.cantidad
    WHERE id = NEW.repuestoId;
END$$

DELIMITER ;
