1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de repuestos comprados por proveedor. 
3. El administrador ingresa el ID del proveedor. 
4. El sistema llama a un procedimiento almacenado para calcular el total de repuestos. 
5. El procedimiento almacenado devuelve el total de repuestos comprados al proveedor especificado

DELIMITER $$
DROP PROCEDURE IF EXISTS totalRepuestosPorProveedor$$
CREATE PROCEDURE totalRepuestosPorProveedor(
    IN inProveedorID INT
)
BEGIN
    SELECT 
        p.nombre, 
        SUM(dc.cantidad) AS totalRepuestos
    FROM detalleCompra dc
    JOIN compra c ON dc.compraId = c.id
    JOIN proveedor p ON c.proveedorId = p.id
    WHERE p.id = inProveedorId
    GROUP BY c.proveedorId, p.nombre;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --