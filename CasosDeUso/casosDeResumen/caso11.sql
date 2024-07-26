/*
Este procedimiento devuelve una tabla con el cliente junto al total de ingresos
que hay generado ese cliente
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS totalIngresosPorCliente$$
CREATE PROCEDURE totalIngresosPorCliente()
BEGIN
    SELECT 
        c.id AS clienteId, 
        c.nombre, 
        SUM(v.total) AS ingresoTotal
    FROM cliente c
    JOIN venta v ON c.id = v.clienteId
    GROUP BY c.id, c.nombre
END $$
DELIMITER ;

-- TESTEADO --

