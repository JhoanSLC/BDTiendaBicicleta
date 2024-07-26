/*
Este procedimiento se encarga de devolver los ingresos totales
que hubo en un año especifico
    RECIBE:
        * Año del cual se desea sacar los ingresos totales
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS ingresoTotalPorAño $$
CREATE PROCEDURE ingresoTotalPorAño(
    IN inAño INT
)
BEGIN
    SELECT 
        SUM(v.total) AS ingresoTotal
    FROM venta v
    WHERE 
        YEAR(v.fecha) = inAño;
END $$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --