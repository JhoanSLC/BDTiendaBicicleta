SELECT 
        b.marca, 
        b.modelo, 
        SUM(dv.cantidad) AS total_vendido
    FROM 
        bicicleta b
    JOIN 
        detalleVenta dv ON b.Id = dv.bicicletaId
    GROUP BY 
        b.marca, b.modelo
    HAVING 
        SUM(dv.cantidad) = (
            SELECT 
                MAX(total_vendido)
            FROM (
                SELECT 
                    b2.marca, 
                    b2.modelo, 
                    SUM(dv2.cantidad) AS total_vendido
                FROM 
                    bicicleta b2
                JOIN 
                    detalleVenta dv2 ON b2.Id = dv2.bicicletaId
                GROUP BY 
                    b2.marca, b2.modelo
            ) AS subquery
            WHERE subquery.marca = b.marca
        )
    ORDER BY 
        total_vendido DESC;

-- TESTEADO --