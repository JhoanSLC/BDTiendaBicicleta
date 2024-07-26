/*
Este procedimiento devuelve una tabla con todas las marcas
de bicicletas que se encuentran en el inventario junto al promedio de 
los precios de las bicicletas de esa marca
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS promedioPorMarca$$
CREATE PROCEDURE promedioPorMarca()
BEGIN 
    SELECT 
        b.marca, 
        TRUNCATE((AVG(b.precio)),2) AS promedio
    FROM bicicleta b
    GROUP BY b.marca;
END$$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --