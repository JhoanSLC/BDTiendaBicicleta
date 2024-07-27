/* 
Este procedimiento devuelve una tabla con el nombre del día junto
al total de ventas que se han hecho en ese día
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS totalVentasPorDiaSemana$$
CREATE PROCEDURE totalVentasPorDiaSemana(
    IN inDia INT
)
BEGIN
    SELECT 
        DAY(v.fecha) AS dia, 
        SUM(v.total) AS totalVentas
    FROM venta v
    WHERE DAY(v.fecha) = inDia
    GROUP BY DAY(v.fecha);
END $$
DELIMITER ;

-- TESTEADO --
