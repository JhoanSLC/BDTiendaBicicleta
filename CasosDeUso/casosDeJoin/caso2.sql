-- El sistema muestra una lista de países con los proveedores en cada país.

SELECT p.nombre AS proveedor, pa.nombre AS pais
FROM proveedor p
JOIN ciudad c ON p.ciudadId = c.id
JOIN pais pa ON c.paisId = pa.id;

-- TESTEADO Y FUNCIONANDO --