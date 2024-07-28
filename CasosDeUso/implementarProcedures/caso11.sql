DELIMITER $$
DROP PROCEDURE IF EXISTS registrarVentaDescuento$$
CREATE PROCEDURE registrarVentaDescuento(
    IN inClienteId INT,
    IN inDescuento DECIMAL(5, 2),
    IN inBicicletaId INT,
    IN inCantidad INT,
    IN inPrecioUnitario DECIMAL(10, 2)
)
BEGIN
    DECLARE v_Total DECIMAL(10, 2);
    DECLARE v_TotalConDescuento DECIMAL(10, 2);
    DECLARE v_VentaID INT;

    -- Calcular el total de la venta
    SET v_Total = inCantidad * inPrecioUnitario;

    -- Calcular el total con el descuento aplicado
    SET v_TotalConDescuento = v_Total - (v_Total * inDescuento / 100);

    -- Insertar la venta
    INSERT INTO venta (fecha, clienteId, total)
    VALUES (NOW(), inClienteId, v_TotalConDescuento);

    -- Obtener el ID de la nueva venta creada
    SET v_VentaID = LAST_INSERT_ID();

    -- Insertar el detalle de la venta
    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (v_VentaID, inBicicletaId, inCantidad, inPrecioUnitario);

    -- Actualizar el stock de la bicicleta
    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;
END $$
DELIMITER ;

-- TESTEADO --