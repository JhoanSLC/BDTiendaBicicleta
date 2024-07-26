/* 
Este procedimiento devuelve una tabla con el nombre del día junto
al total de ventas que se han hecho en ese día
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS totalVentasPorDiaSemana$$
CREATE PROCEDURE totalVentasPorDiaSemana()
BEGIN
    SELECT 
        DAYNAME(v.fecha) AS dia, 
        SUM(v.total) AS totalVentas
    FROM venta v
    GROUP BY DAYNAME(v.fecha);
END $$
DELIMITER ;

-- TESTEADO --
