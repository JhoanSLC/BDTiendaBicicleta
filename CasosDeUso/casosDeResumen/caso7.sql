/*
Este procedimiento devuelve el promedio del valor total de las compras
hechas a un proveedor especifico
    RECIBE:
        * Id del proveedor a sacar promedio
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS promedioComprasPorProveedor $$
CREATE PROCEDURE promedioComprasPorProveedor(
    IN inProveedorId INT
)
BEGIN
    SELECT 
        p.nombre, 
        TRUNCATE((AVG(c.total)),2) AS promedioCompras
    FROM compra c
    JOIN proveedor p ON c.proveedorId = p.id
    WHERE p.id = inProveedorId
    GROUP BY c.proveedorId, p.nombre;
END $$ 
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --