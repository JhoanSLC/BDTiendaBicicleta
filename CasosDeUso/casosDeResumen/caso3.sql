/* 
Este procedimiento se encarga de devolver la cantidad de ventas
que se han hecho dentro de un rango de fechas especificado
por el usuario
    RECIBE:
        * La fecha de inicio
        * La fecha final
*/


DELIMITER $$
DROP PROCEDURE IF EXISTS ventasEnRangoFechas $$
CREATE PROCEDURE ventasEnRangoFechas(
    IN inFechaInicio DATE, 
    IN inFechaFin DATE
)
BEGIN
    SELECT COUNT(v.id) AS totalVentas
    FROM venta v
    WHERE v.fecha BETWEEN inFechaInicio AND inFechaFin;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --

