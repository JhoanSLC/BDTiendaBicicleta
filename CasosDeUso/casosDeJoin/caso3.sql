-- El sistema muestra una lista de proveedores con el total de repuestos comprados a cada uno.

SELECT p.nombre, SUM(dc.cantidad) AS totalComprados
FROM detalleCompra dc
JOIN compra c ON  c.id = dc.compraId
JOIN proveedor p ON p.id = c.proveedorId
GROUP BY c.proveedorId;

-- TESTEADO Y FUNCIONANDO --