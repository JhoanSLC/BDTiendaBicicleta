/* Este procedure se encarga de agregar una nueva bicicleta a la base de datos */

DELIMITER $$
DROP PROCEDURE IF EXISTS agregarBicicleta$$
CREATE PROCEDURE agregarBicicleta(
    IN newModelo VARCHAR(255),
    IN newMarca VARCHAR(255),
    IN newPrecio DECIMAL(10, 2),
    IN newStock INT
)
BEGIN
    -- Validar que el precio y el stock sean mayores o iguales a 0 --
    IF newPrecio < 0 OR newStock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio y el stock deben ser mayores a 0';
    END IF;

    -- Insertar la nueva bicicleta en la tabla bicicleta --
    INSERT INTO bicicleta (modelo, marca, precio, stock)
    VALUES (newModelo, newMarca, newPrecio, newStock);
END$$
DELIMITER ;


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


/* Este procedure se usa para actualizar el stock y precio de una bicicleta ya existente */

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarBicicleta$$
CREATE PROCEDURE actualizarBicicleta(
    IN inBicicletaId INT,
    IN inPrecio DECIMAL(10, 2),
    IN inStock INT
)
BEGIN
    -- Validar que el precio y el stock sean mayores o iguales a 0 --
    IF inPrecio < 0 OR inStock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio y el stock deben ser mayores o iguales a 0';
    END IF;

    -- Actualizar la información de la bicicleta --
    UPDATE bicicleta
    SET precio = inPrecio, stock = inStock
    WHERE id = inBicicletaId;
END$$
DELIMITER ;


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


/* Este procedure se usa para eliminar una bicicleta existente */

DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarBicicleta$$
CREATE PROCEDURE eliminarBicicleta(
    IN inBicicletaId INT
)
BEGIN
    -- Eliminar la bicicleta de la tabla Bicicletas --
    DELETE FROM bicicleta
    WHERE id = inBicicletaID;
END $$
DELIMITER ;
