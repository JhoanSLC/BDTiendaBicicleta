/*
Este procedimiento devuelve el total de ventas que se han hecho
para cada marca de bicicleta
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS ventasPorMarca
CREATE PROCEDURE ventasPorMarca()
BEGIN
    SELECT 
        b.marca, 
        SUM(dv.cantidad * b.precioUnitario) AS total_marca
    FROM detalleVenta dv
    JOIN bicicleta b ON dv.bicicletaId = b.id
    GROUP BY b.marca;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --