/* 
    Este procedure se encarga de registrar las compras hechas por el cliente 
        RECIBE: Id del proveedor
        DEVUELVE: Id de la compra que se acaba de registrar

*/

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCompra$$
CREATE PROCEDURE registrarCompra(
    IN inProveedorId INT,
    OUT outCompraId INT
)
BEGIN
    -- Crear una nueva compra --
    INSERT INTO compras (fecha, proveedorId, total)
    VALUES (NOW(), inProveedorId, 0);

    -- Obtener el ID de la nueva compra creada --
    SET CompraID = LAST_INSERT_ID();
END $$
DELIMITER ;


/*
    Este procedure se encarga de registrar los detalles de la compra
        RECIBE: El id de la compra que se va a detallar (inCompraId)
                El id del repuesto que se compra (inRepuestoId)
                La cantidad de ese producto que se compra (inCantidad)
*/

DELIMITER $$
DROP PROCEDURE registrarDetalleCompra$$
CREATE PROCEDURE registrarDetalleCompra(
    IN inCompraId INT,
    IN inRepuestoId INT,
    IN inCantidad INT,
)
BEGIN
    DECLARE totalDetalle DECIMAL(10, 2);
    DECLARE precioUnitario DECIMAL(10,2);

    -- Obtener el precio unitario del repuesto --
    SELECT precio INTO precioUnitario
    FROM repuesto
    WHERE id = inRepuestoId;

    -- Calcular el total del detalle --
    SET totalDetalle = precioUnitario * inCantidad;

    -- Insertar el detalle de la compra
    INSERT INTO DetallesDeCompras (compraId, repuestoId, cantidad, precioUnitario)
    VALUES (inCompraId, inRepuestoId, inCantidad, precioUnitario);

    -- Actualizar el stock de los repuestos
    UPDATE repuesto
    SET stock = stock + inCantidad
    WHERE id = inRepuestoId;

    -- Actualizar el total de la compra
    UPDATE compra
    SET total = total + totalDetalle
    WHERE id = inCompraId;
END $$
DELIMITER ;
