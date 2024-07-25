/*
    Este procedimiento se encarga de sumar a todos los precios
    de una misma marca, el porcentaje de incremento
    dado por el usuario.

    RECIBE:
            * Marca de bicicletas a los que se les va a actualizar
                el precio
            * Porcentaje de incremento (SIN EL PORCENTAJE) que se le 
                va a sumar a todos los precios de las bicicletas
                de esa marca
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarPreciosPorMarca$$
CREATE PROCEDURE actualizarPreciosPorMarca(
    IN inMarca VARCHAR(255),
    IN inPorcentaje DECIMAL(5, 2)
)
BEGIN
    -- Actualizar los precios de todas las bicicletas de la marca especificada --
    UPDATE bicicleta
    SET precio = precio * (1 + inPorcentaje / 100)
    WHERE marca = inMarca;
END $$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO -- 