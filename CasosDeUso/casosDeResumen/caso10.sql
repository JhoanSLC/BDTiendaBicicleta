/*
Este procedimiento devuelve una tabla con el proveedor junto
al total de repuestos que se le ha comprado a ese proveedor
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS totalRepuestos$$
CREATE PROCEDURE totalRepuestos()
BEGIN
    SELECT 
        p.nombre, 
        SUM(dc.cantidad) AS totalRepuestos
    FROM detalleCompra dc
    JOIN compra c ON dc.compraId = c.id
    JOIN proveedor p ON c.proveedorId = p.id
    GROUP BY c.proveedorId, p.nombre;
END $$
DELIMITER ;

-- TESTEADO --