SELECT p.nombre, sub.comprasProveedor
FROM proveedor p
JOIN (
    SELECT proveedorId, COUNT(c.id) AS comprasProveedor
    FROM compra c
    WHERE MONTH(c.fecha) = 7
    GROUP BY c.proveedorId
) sub ON sub.proveedorId = p.id;


-- TESTEADO --