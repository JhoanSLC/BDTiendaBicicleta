/*
    Este procedimiento se encarga de mostrar un reporte de todo el 
    inventario de bicicletas y repuestos almacenados en la base
    de datos.
    
    El procedimiento devuelve 2 tablas.
*/

DELIMITER $$ 
DROP PROCEDURE IF EXISTS reporteInventario$$
CREATE PROCEDURE reporteInventario()
BEGIN
    -- Mostrar una tabla que devuelve todo el inventario de bicicleta --
    SELECT 
        b.id,
        b.modelo,
        b.marca,
        b.precio,
        b.stock
    FROM bicicleta b
    ORDER BY b.id DESC;

    -- Mostrar otra tabla que devuelve todo el inventario de repuestos --
    SELECT 
        r.id,
        r.nombre,
        r.descripcion,
        r.precio,
        r.stock,
        r.proveedorId AS id_proveedor
    FROM repuesto r
    ORDER BY r.id DESC;
END $$
DELIMITER ;