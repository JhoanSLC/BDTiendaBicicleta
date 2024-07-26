/*
Este procedimiento devuelve una tabla con el año, el mes y el promedio de compras de ese
mes en ese año
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS promedioComprasMensuales$$
CREATE PROCEDURE promedioComprasMensuales()
BEGIN
    SELECT 
        YEAR(v.fecha) AS año, 
        MONTH(v.fecha) AS mes, 
        TRUNCATE((AVG(v.total)),2) AS promedio
    FROM venta v
    GROUP BY YEAR(v.fecha), MONTH(v.fecha);
END $$
DELIMITER ;

-- TESTEADO --