/* Este trigger se encarga de actualizar  */

CREATE TRIGGER AfterInsertDetallesVentas
AFTER INSERT ON Detalles_Ventas
FOR EACH ROW
BEGIN
    UPDATE Bicicletas
    SET Stock = Stock - NEW.Cantidad
    WHERE ID = NEW.BicicletaID;
    
    IF (SELECT Stock FROM Bicicletas WHERE ID = NEW.BicicletaID) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la venta';
    END IF;
END;
