/*
    Este procedimiento se encarga de actualizar el stock de las bicicletas 
    basandose en los detalles de la venta
        RECIBE:
                id de la venta a verificar
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarStockBicicleta
CREATE PROCEDURE actualizarStockBicicleta(
    IN inVentaId INT
)
BEGIN
    UPDATE bicicleta b
    JOIN detalleVenta dv ON b.id = dv.bicicletaId
    SET b.stock = b.stock - dv.cantidad
    WHERE dv.ventaId = inVentaId;
END $$
DELIMITER ;

------------------------------------------------------------------
------------------------------------------------------------------



/* 
    Esta es una versión modificada del procedure del caso de uso 2
    de los primeros flujos.

    En esta versión del procedure se agrega la llamada al procedimiento
    que se encarga de actualizar correctamente el stock de bicicletas
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDetalleVenta$$
CREATE PROCEDURE RegistrarDetalleVenta(
    IN inVentaId INT,
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE totalDetalle DECIMAL(10, 2);
    
    -- Obtener el precio unitario de la bicicleta --
    SELECT precio INTO precioUnitario
    FROM bicicleta
    WHERE id = inBicicletaId;
    
    -- Calcular el total del detalle --
    SET totalDetalle = precioUnitario * inCantidad;
    
    -- Insertar el detalle de la venta --
    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (inVentaId, inBicicletaId, inCantidad, precioUnitario);
    
    -- Actualizar el total de la venta --
    UPDATE venta
    SET total = totalDetalle
    WHERE id = inVentaId;
    
    -- Actualizar el inventario de bicicletas --
    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;
    
    CALL actualizarStockBicicleta(inVentaId);
END $$
DELIMITER ;

