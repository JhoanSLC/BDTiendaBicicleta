/*
Este procedimiento se encarga de devolver el total de clientes
que se encuentran o encontraron activos durante el mes especificado
del año especificado
    RECIBE:
        * Mes a verificar
        * Año a verificar
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS clientesActivosEnMes $$
CREATE PROCEDURE clientesActivosEnMes(
    IN inMes INT, 
    IN inAño INT)
BEGIN
    SELECT 
        COUNT(DISTINCT v.clienteId) AS clientesActivos
    FROM venta v
    WHERE MONTH(v.fecha) = inMes AND YEAR(v.fecha) = inAño;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --