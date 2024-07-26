/* 
Este procedimiento se encarga de devolver
el total de ventas que se realizaron en
un mes especifico 

    RECIBE:
            * El mes en NÚMERO del cual se calculara el total
                de ventas
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS ventasPorMes$$
CREATE PROCEDURE ventasPorMes(
    in inMes INT
)
BEGIN
    SELECT SUM(total) AS totalVentas
    FROM venta
    WHERE MONTH(fecha) = inMes
    GROUP BY MONTH(fecha);
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --