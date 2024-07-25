-- El sistema muestra una lista de clientes que han realizado compras dentro del rango de fechas especificado. --

SELECT DISTINCT c.nombre 
FROM  cliente c
JOIN venta v ON c.id = v.clienteId
WHERE v.fecha BETWEEN '2024-01-01' AND '2024-12-31';


/* 
    Se hace uso de un procedimiento para pedir las fechas
    al usuario
*/ 

DELIMITER $$
DROP PROCEDURE IF EXISTS clientesDentroDeRango$$
CREATE PROCEDURE clientesDentroDeRango(
    IN inFechaInicio DATE, 
    IN inFechaFin DATE
)
BEGIN
    SELECT DISTINCT c.nombre
    FROM cliente c
    JOIN venta v ON c.id = v.clienteId
    WHERE v.fecha BETWEEN inFechaInicio AND inFechaFin;
END $$
DELIMITER ;