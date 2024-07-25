/*
    Este procedimiento se encarga de crear un reporte con los detalles de
    todos los clientes agrupados por ciudad
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS reporteClienteCiudad$$
CREATE PROCEDURE reporteClienteCiudad()
BEGIN

    SELECT 
        ci.nombre AS ciudad,
        c.id AS clienteId,
        c.nombre AS cliente,
        c.correo AS correoCliente,
        c.telefono AS telefonoCliente
    FROM cliente c
    JOIN ciudad ci 
    ON 
        ci.id = c.ciudadId
    ORDER BY
        ci.nombre,
        c.nombre
END $$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --
















