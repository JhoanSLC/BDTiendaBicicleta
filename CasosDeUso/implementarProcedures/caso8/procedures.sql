/*
    Este procedimiento se encarga de verificar el stock actual de una bicicleta
    comparandolo con la cantidad que se desea vendar, devolviendo un mensaje
    de error en caso de no haber y devolviendo un affected row en caso de 
    contar con el stock suficiente

        RECIBE:
                * Id de la bicicleta a verificar
                * Cantidad de esa bicicleta que se vende
    
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS verificarStockBicicleta$$
CREATE PROCEDURE verificarStockBicicleta(
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN 
    DECLARE stockActual INT;

    SELECT b.stock INTO stockActual
    FROM bicicleta b
    WHERE b.id = inBicicletaId;
    
    IF stockActual < inCantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para esta bicicleta';
    END IF;
END $$
DELIMITER ;

    
-- TESTEADO Y FUNCIONANDO --