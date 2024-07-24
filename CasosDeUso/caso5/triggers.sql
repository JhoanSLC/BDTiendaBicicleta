/* 
    Este trigger se encarga de actualizar correctamente
    el stock de repuestos después de la insersión en
    la tabla detallesCompra
*/

DELIMITER $$
DROP TRIGGER IF EXISTS actualizarStockRepuestos$$
CREATE TRIGGER actualizarStockRepuestos
AFTER INSERT ON detalleCompra
FOR EACH ROW
BEGIN
    UPDATE repuesto
    SET stock = stock + NEW.cantidad
    WHERE id = NEW.repuestoID;
END $$
DELIMITER ;


-- TESTEADO Y FUNCIONANDO --