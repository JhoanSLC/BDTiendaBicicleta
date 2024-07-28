DELIMITER $$
DROP PROCEDURE IF EXISTS reporteComprasPorProveedor$$
CREATE PROCEDURE reporteComprasPorProveedor(
    IN inProveedorId INT
)
BEGIN
    
    SELECT 
        c.id AS CompraID, 
        c.fecha, 
        c.total, 
        dc.repuestoID, 
        r.nombre AS RepuestoNombre, 
        dc.cantidad, 
        dc.precioUnitario
    FROM 
        compra c
    JOIN 
        detalleCompra dc ON c.id = dc.compraId
    JOIN 
        Repuestos r ON dc.RepuestoID = r.ID
    WHERE 
        c.proveedorId = inProveedorId
    ORDER BY 
        c.fecha DESC;
END $$
DELIMITER ;
