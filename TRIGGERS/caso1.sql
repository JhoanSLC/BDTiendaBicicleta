-- ······· FLUJO PRINCIPAL ·········· --

    -- ·· Trigger para validar que los campos obligatorios sean llenados por el usuario ·· --

            -- TRIGGER PARA BEFORE INSERT --
DELIMITER $$ 
DROP TRIGGER IF EXISTS validar_campos_obligatorios_ins$$
CREATE TRIGGER validar_campos_obligatorios_ins
BEFORE INSERT ON bicicleta
FOR EACH ROW
BEGIN
    IF NEW.modelo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo modelo es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.marca IS NULL THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo marca es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo precio es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo stock es OBLIGATORIO y no puede ser NULL';
    END IF;
END$$
DELIMITER ;

            -- TRIGGER PARA BEFORE UPDATE --
DELIMITER $$ 
DROP TRIGGER IF EXISTS validar_campos_obligatorios_upd$$
CREATE TRIGGER validar_campos_obligatorios_upd
BEFORE UPDATE ON bicicleta
FOR EACH ROW
BEGIN
    IF NEW.modelo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo modelo es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.marca IS NULL THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo marca es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo precio es OBLIGATORIO y no puede ser NULL';
    END IF;
    IF NEW.stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El campo stock es OBLIGATORIO y no puede ser NULL';
    END IF;
END$$
DELIMITER ;


    -- TRIGGER PARA VERIFICAR TIPO DE DATO --
        -- TRIGGER INSERT PRECIO --
DELIMITER $$
DROP TRIGGER IF EXISTS validar_tipo_dato_ins;
CREATE TRIGGER validar_tipo_dato_ins
BEFORE INSERT ON bicicleta
FOR EACH ROW
BEGIN
    DECLARE precio_correcto DOUBLE;





