/* Este procedure se usa para registrar una nueva venta
    en el sistema */

-- El procedure devuelve el id de la venta registrada --
DELIMITER $$ 
DROP PROCEDURE IF IT EXISTS registrarVenta$$
CREATE PROCEDURE registrarVenta(
    IN inClienteId VARCHAR(10),
    OUT outVentaId INT 
) 
BEGIN 
    /* Se crea una nueva venta con total inicial de 0
        para que luego el sistema calcule el total en
        base a los detalles de la venta */
    INSERT INTO venta(fecha,clienteId,total)
    VALUES (NOW(), inClienteId, 0);

    /* Se saca el valor del id para utilizarlo luego */
    SET outVentaId = LAST_INSERT_ID();
END $$
DELIMITER ;

----------------------------------------------------
----------------------------------------------------


/* Este procedure se usa para registrar los detalles
    una nueva venta */

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
    
    -- Calcular el total del detalle
    SET totalDetalle = precioUnitario * inCantidad;
    
    -- Insertar el detalle de la venta
    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (inVentaId, inBicicletaId, inCantidad, precioUnitario);
    
    -- Actualizar el total de la venta --
    UPDATE venta
    SET total = total + totalDetalle
    WHERE id = inVentaId;
    
    -- Actualizar el inventario de bicicletas --
    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;
END $$
DELIMITER ;
