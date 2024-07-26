1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de compras mensuales.
3. El sistema llama a un procedimiento almacenado para calcular el promedio de compras mensuales.
4. El procedimiento almacenado devuelve el promedio de compras realizadas mensualmente.


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