

DELIMITER $$
DROP PROCEDURE IF EXISTS ventasPorBicicleta$$
CREATE PROCEDURE ventasPorBicicleta(
    IN inBicicletaId INT
)
BEGIN
    SELECT 
        dv.bicicletaId, 
        SUM(dv.cantidad) AS cantidad, 
        dv.precioUnitario
    FROM detalleVenta dv
    WHERE dv.bicicletaId = inBicicletaId
    GROUP BY dv.bicicletaId, dv.precioUnitario;
END$$
DELIMITER ;

-- TESTEADO --