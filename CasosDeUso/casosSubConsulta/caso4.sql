SELECT r.nombre, sub.cantidadVendida
FROM repuesto r
JOIN (
   SELECT dv.repuestoId, SUM(dv.cantidad) AS cantidadVendida
   FROM detalleCompra dv
   GROUP BY dv.repuestoId
) sub ON sub.repuestoId = r.id 
ORDER BY sub.cantidadVendida DESC;

-- TESTEADO --