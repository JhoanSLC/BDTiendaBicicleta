/* Este trigger se encarga de actualizar el stock de la bicicleta 
que se vende y además se verifica que haya suficiente stock para vender la cantidad
que se pide  */

DELIMITER $$
DROP TRIGGER IF EXISTS stockEnVentaIns$$
CREATE TRIGGER stockEnVentaIns
AFTER INSERT ON detalles_Ventas
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
