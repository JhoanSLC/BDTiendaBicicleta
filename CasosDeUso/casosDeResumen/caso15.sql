/* 
Este procedimiento devuelve el total de ventas que se hizo
en el mes especificado del año especificado 
    RECIBE:
        * Mes a verificar
        * Año a verificar
*/
DELIMITER $$
CREATE PROCEDURE totalVentasAñoMes(
    IN inMes INT,
    IN inAño INT
)
BEGIN 
    SELECT  
        SUM(v.total) AS totalVentas_año_mes
    FROM venta v
    WHERE (MONTH(v.fecha) = inMes) AND (YEAR(v.fecha) = inAño)
    GROUP BY MONTH(v.fecha), YEAR(v.fecha);
END$$
DELIMITER ;

-- TESTEADO --