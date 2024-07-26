/* 
Este procedimiento se encarga de devolver el promedio
de ventas que ha realizado un cliente especifico

    RECIBE:
            * Id del cliente del que se desea sacar promedio
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS promedioVentasPorCliente$$
CREATE PROCEDURE promedioVentasPorCliente(
    IN inClienteId INT
)
BEGIN
    SELECT 
        c.nombre, 
        TRUNCATE((AVG(v.total)),2) AS promedioVentas
    FROM 
        venta v
    JOIN cliente c ON v.clienteId = c.id
    WHERE 
        c.id = inClienteId
    GROUP BY 
        c.id, c.nombre;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --