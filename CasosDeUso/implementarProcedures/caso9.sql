DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarStockBicicleta$$
CREATE PROCEDURE actualizarStockBicicleta(
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN
    UPDATE bicicleta
    SET stock = stock + inCantidad
    WHERE id = inBicicletaId;
END $$

DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDevolucion$$
CREATE PROCEDURE registrarDevolucion(
    IN inClienteId INT,
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN
    INSERT INTO devolucion (clienteId, bicicletaId, fecha, cantidad)
    VALUES (inClienteId, inBicicletaId, CURDATE(), inCantidad);

    -- Actualizar el stock de la bicicleta
    CALL actualizarStockBicicleta(inBicicletaId, inCantidad);
END $$
DELIMITER ;

-- TESTEADO --