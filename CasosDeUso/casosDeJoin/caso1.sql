--El sistema muestra una lista de ciudades con el total de ventas realizadas en cada una.

SELECT c.nombre, SUM(v.total) AS ventasTotales
FROM ciudad c
JOIN cliente cl ON c.id = cl.ciudadId
JOIN venta v ON cl.id = v.clienteId
GROUP BY c.nombre, cl.ciudadId;

-- TESTEADO Y FUNCIONANDO --
