/* 
    Este procedure se encarga de registrar las compras hechas por el cliente 
        RECIBE: Id del proveedor
                Fecha de la compra
                Total de la compra
        DEVUELVE: Id de la compra que se acaba de registrar

*/

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCompra$$
CREATE PROCEDURE registrarCompra(
    IN inFecha DATE,
    IN inProveedorId INT,
    IN inTotal DECIMAL(10, 2),
    OUT inCompraId INT
)
BEGIN
    -- Crear una nueva compra --
    INSERT INTO compra (fecha, proveedorId, total)
    VALUES (inFecha, inProveedorId, inTotal);

    -- Obtener el ID de la nueva compra creada --
    SET CompraID = LAST_INSERT_ID();
END $$
DELIMITER ;



/*
    Este procedure se encarga de registrar los detalles de la compra
        RECIBE: El id de la compra que se va a detallar (inCompraId)
                El id del repuesto que se compra (inRepuestoId)
                La cantidad de ese producto que se compra (inCantidad)
                El precio unitario del producto
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDetalleCompra$$
CREATE PROCEDURE registrarDetalleCompra(
    IN inCompraId INT,
    IN inRepuestoId INT,
    IN inCantidad INT,
    IN inPrecioUnitario DECIMAL(10, 2)
)
BEGIN
    DECLARE totalDetalle DECIMAL(10, 2);

    SET totalDetalle = inPrecioUnitario * inCantidad;

    INSERT INTO detalleCompra (compraId, repuestoId, cantidad, precioUnitario)
    VALUES (inCompraId, inRepuestoId, inCantidad, inPrecioUnitario);

    UPDATE repuesto
    SET stock = stock + inCantidad
    WHERE id = inRepuestoId;

    UPDATE compra
    SET total = total + totalDetalle
    WHERE id = inCompraId;
END $$
DELIMITER ;

-- TESTEADO Y FUNCIONANDO --