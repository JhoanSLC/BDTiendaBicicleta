SELECT 
    ci.nombre,
    sub.cantidadVentas
FROM 
    ciudad ci
JOIN 
    (SELECT 
        cl.ciudadId,
        COUNT(v.id) AS cantidadVentas
     FROM 
        venta v
     JOIN 
        cliente cl ON v.clienteId = cl.id
     GROUP BY 
        cl.ciudadId
    ) sub ON ci.id = sub.ciudadId
ORDER BY 
    sub.cantidadVentas DESC;

-- TESTEADO --