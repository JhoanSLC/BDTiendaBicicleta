 SELECT 
        c.id AS ClienteID, 
        c.nombre AS nombre, 
        SUM(v.Total) AS TotalGastado
    FROM 
        cliente c
    JOIN 
        venta v ON c.id = v.clienteId
    WHERE 
        YEAR(v.fecha) = 2024
    GROUP BY 
        c.id, c.nombre
    ORDER BY 
        TotalGastado DESC;

-- TESTEADO --