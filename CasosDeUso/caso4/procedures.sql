/* Este procedure se encarga de mostrar todas las ventas
    hechas por un usuario.
        recibe: El id del cliente a mostrar historial*/

DELIMITER $$
DROP PROCEDURE IF EXISTS mostrarHistorialVentas$$
CREATE PROCEDURE mostrarHistorialVentas(
    IN inClienteID INT
)
BEGIN
    /* 
        Se hace uso de una consulta que devuelve 
        el id, la fecha y el total de todas 
        las ventas cuyo cliente coincida con 
        el id del cliente que recibe el procedure
    */
    SELECT v.id AS ventaID, v.fecha, v.total
    FROM venta v
    WHERE v.clienteId = inClienteId
    ORDER BY v.fecha DESC;
END $$
DELIMITER ;

------------------------------------------------------
------------------------------------------------------


/* 
    Este procedure se encarga de mostrar los detalles
    de una venta especifica
        RECIBE: El id de la venta a mostrar
*/

DELIMITER $$ 
DROP PROCEDURE IF EXISTS consultarDetallesVenta$$
CREATE PROCEDURE consultarDetallesVenta(
    IN inVentaId INT
)
BEGIN
    /* 
        Se hace uso de una consulta para 
        sacar los detalles de la venta usando el
        id de venta que recibe el procedure

        Además se hace uso del join para mostrar
        detalles de la bicicleta que se vende
    */
    SELECT dv.bicicletaId, b.modelo, b.marca, dv.cantidad, dv.precioUnitario
    FROM detalleVenta dv
    JOIN bicicleta b ON dv.bicicletaId = b.id
    WHERE dv.ventaId = inVentaId;
END $$
DELIMITER ; 






