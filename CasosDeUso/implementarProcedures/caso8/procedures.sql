    IF NEW.stock < 0 OR NEW.precio < 0 THEN -- Si se inserta un valor negativo para el stock --
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El "STOCK" y el "PRECIO" no pueden ser negativo'; -- Enviar un mensaje --
    END IF;


DELIMITER $$
DROP PROCEDURE IF EXISTS verificarStockBicicleta$$
CREATE PROCEDURE verificarStockBicicleta(
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN 
    DECLARE stock INT;
    
