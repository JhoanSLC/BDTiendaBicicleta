DELIMITER $$
DROP PROCEDURE IF EXISTS agregarProveedor$$
CREATE PROCEDURE agregarProveedor (
    IN inNombreProveedor VARCHAR(50),
    IN inNombreContacto VARCHAR(50),
    IN inTelefono VARCHAR(20),
    IN inCorreo VARCHAR(100),
    IN inCiudadId INT
)
BEGIN
    DECLARE proveedorExistente INT;

    SELECT COUNT(p.id) INTO proveedorExistente
    FROM proveedor p
    WHERE p.nombre = inNombreProveedor
    IF proveedorExistente = 0 THEN
        INSERT INTO proveedor (nombre, contacto, telefono, correo, ciudadId)
        VALUES (inNombreProveedor, inNombreContacto, inTelefono, inCorreo, inCiudadId);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El proveedor ya existe con el mismo nombre, teléfono o correo electrónico';
    END IF;

END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS agregarRepuesto$$
CREATE PROCEDURE agregarRepuesto(
IN inNombreRepuesto VARCHAR(20),
IN inDescripcionRepuesto TEXT,
IN inPrecio DOUBLE,
IN inStock INT,
IN inProveedorId INT
)
BEGIN
-- Valida que el nombre del repuesto no esté vacío
IF inNombreRepuesto IS NULL OR inNombreRepuesto = '' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El nombre del repuesto no puede estar vacío';
END IF;

-- Valida que el precio sea mayor que 0
IF inPrecio <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El precio debe ser mayor que 0';
END IF;

-- Valida que el stock sea mayor o igual que 0
IF inStock < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El stock no puede ser negativo';
END IF;

-- Valida que el proveedor exista
IF (SELECT COUNT(id) FROM proveedor WHERE id = inProveedorId) = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El proveedor no existe';
END IF;

-- Inserta el nuevo repuesto si todas las validaciones pasan
INSERT INTO repuesto (nombre, descripcion, precio, stock, proveedorId)
VALUES (inNombreRepuesto, inDescripcionRepuesto, inPrecio, inStock, inProveedorId);
END $$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarProveedor$$
CREATE PROCEDURE actualizarProveedor(
    IN inId INT,
    IN inNombre VARCHAR(20),
    IN inContacto VARCHAR(20),
    IN inTelefono VARCHAR(15),
    IN inCorreo VARCHAR(50),
    IN inCiudadId INT
)
BEGIN
	-- Valida que el proveedor exista
	IF (SELECT COUNT(id) FROM proveedor WHERE id = inId) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El proveedor no existe';
	END IF;

	-- Valida que el nombre del proveedor no esté vacío
	IF inNombre IS NULL OR inNombre = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El nombre del proveedor no puede estar vacío';
	END IF;

	-- Valida que el nombre del contacto no esté vacío
	IF inContacto IS NULL OR inContacto = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El nombre del contacto no puede estar vacío';
	END IF;

	-- Valida que el teléfono no esté vacío y sea único
	IF inTelefono IS NULL OR inTelefono = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El teléfono no puede estar vacío';
	ELSEIF (SELECT COUNT(id) FROM proveedor WHERE telefono = inTelefono AND id <> inId) > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El teléfono ya está en uso por otro proveedor';
	END IF;

	-- Valida que el correo electrónico no esté vacío y sea único
	IF inCorreo IS NULL OR inCorreo = '' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico no puede estar vacío';
	ELSEIF (SELECT COUNT(id) FROM proveedor WHERE correo = inCorreo AND id = inId) > 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso por otro proveedor';
	END IF;

	-- Valida que la ciudad exista
	IF (SELECT COUNT(id) FROM ciudad WHERE id = inCiudadId) = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La ciudad no existe';
	END IF;

	
	UPDATE proveedor
	SET nombre = inNombre,
		contacto = inContacto,
		telefono = inTelefono,
		correo = inCorreo,
		ciudadId = inCiudadId 
	WHERE id = inId;
END $$

DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarRepuesto$$
CREATE PROCEDURE actualizarRepuesto(
    IN inId INT,
    IN inNombre VARCHAR(20),
    IN inDescripcion TEXT,
    IN inPrecio DOUBLE,
    IN inStock INT,
    IN inProveedorId INT
)
BEGIN
-- Valida que el repuesto exista
IF (SELECT COUNT(id) FROM repuesto WHERE id = inId) = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El repuesto no existe';
END IF;

-- Valida que el nombre del repuesto no esté vacío
IF inNombre IS NULL OR inNombre = '' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El nombre del repuesto no puede estar vacío';
END IF;

-- Valida que el precio sea mayor que 0
IF inPrecio <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El precio debe ser mayor que 0';
END IF;

-- Valida que el stock no sea negativo
IF inStocl < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El stock no puede ser negativo';
END IF;

-- Valida que el proveedor exista
IF (SELECT COUNT(id) FROM proveedor WHERE id = inProveedorId) = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El proveedor no existe';
END IF;

-- Actualiza el repuesto si todas las validaciones pasan
UPDATE repuesto
SET nombre = inNombre,
    descripcion = inDescripcion,
    precio = inPrecio,
    stock = inStock,
    proveedorId = inProveedorId
WHERE id = inId;
END $$

DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarProveedor$$
CREATE PROCEDURE eliminarProveedor(
    IN inId INT
)
BEGIN
    DECLARE proveedorExistente INT;

    -- Valida que el proveedor exista
    SELECT COUNT(id) INTO proveedorExistente
    FROM proveedor
    WHERE id = inId;

    IF proveedorExistente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El proveedor no existe';
    END IF;

    -- Elimina repuestos asociados al proveedor
    DELETE FROM repuesto WHERE proveedorId = inId;

    -- Elimina compras asociadas al proveedor
    DELETE FROM compra WHERE proveedorId = inId;

    -- Elimina el proveedor
    DELETE FROM proveedor WHERE id = inId;
    END $$

DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarRepuesto$$ 
CREATE PROCEDURE eliminarRepuesto(
    IN inId INT
)
BEGIN
    DECLARE repuestoExistente INT;

    -- Valida que el repuesto exista
    SELECT COUNT(id) INTO repuestoExistente
    FROM repuesto
    WHERE id = inId;

    IF repuestoExistente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El repuesto no existe';
    END IF;

    -- Elimina registros relacionados en detalle_venta
    DELETE FROM detalleVenta WHERE repuestoId = inId;

    -- Elimina registros relacionados en detalle_compra
    DELETE FROM detalleCompra WHERE repuestoId = inId;

    -- Elimina el repuesto
    DELETE FROM repuesto WHERE id = inId;
END $$
DELIMITER ;

