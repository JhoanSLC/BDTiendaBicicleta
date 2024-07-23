-- Inserción de datos
-- Insertar en pais
INSERT INTO pais (nombre) VALUES ('Colombia');
INSERT INTO pais (nombre) VALUES ('España');
INSERT INTO pais (nombre) VALUES ('México');

-- Insertar en ciudad
INSERT INTO ciudad (nombre, paisId) VALUES ('Bogotá', 1); -- Bogotá, Colombia
INSERT INTO ciudad (nombre, paisId) VALUES ('Madrid', 2); -- Madrid, España
INSERT INTO ciudad (nombre, paisId) VALUES ('Ciudad de México', 3); -- Ciudad de México, México

-- Insertar en bicicleta
INSERT INTO bicicleta (modelo, marca, precio, stock) VALUES ('Mountain X', 'Specialized', 1200.00, 10);
INSERT INTO bicicleta (modelo, marca, precio, stock) VALUES ('Roadster Pro', 'Trek', 800.00, 15);
INSERT INTO bicicleta (modelo, marca, precio, stock) VALUES ('Urban Glide', 'Giant', 600.00, 20);
INSERT INTO bicicleta (modelo, marca, precio, stock) VALUES ('E-Bike 3000', 'Cannondale', 2500.00, 5);

-- Insertar en cliente
INSERT INTO cliente (id, nombre, correo, telefono, ciudadId) VALUES ('001', 'Juan Pérez', 'juan.perez@example.com', '3001234567', 1);
INSERT INTO cliente (id, nombre, correo, telefono, ciudadId) VALUES ('002', 'Ana Gómez', 'ana.gomez@example.com', '3009876543', 2);
INSERT INTO cliente (id, nombre, correo, telefono, ciudadId) VALUES ('003', 'Luis Martínez', 'luis.martinez@example.com', '3005647382', 3);

-- Insertar en venta
INSERT INTO venta (id, clienteId, total) VALUES (1, '001', 1800.00);
INSERT INTO venta (id, clienteId, total) VALUES (2, '002', 800.00);

-- Insertar en detalleVenta
INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario) VALUES (1, 1, 1, 1200.00);
INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario) VALUES (2, 2, 1, 800.00);

-- Insertar en proveedor
INSERT INTO proveedor (nombre, contacto, telefono, correo, ciudadId) VALUES ('Proveedores Bicis S.A.', 'Carlos Ruiz', '3001122334', 'contacto@bicissas.com', 1);
INSERT INTO proveedor (nombre, contacto, telefono, correo, ciudadId) VALUES ('Accesorios Bike Ltda.', 'Laura López', '3005566778', 'info@accesoriosbike.com', 2);

-- Insertar en repuesto
INSERT INTO repuesto (nombre, descripcion, precio, stock, proveedorId) VALUES ('Frenos Shimano', 'Juego de frenos Shimano para MTB', 150.00, 50, 1);
INSERT INTO repuesto (nombre, descripcion, precio, stock, proveedorId) VALUES ('Cinta de Manillar', 'Cinta de manillar negra', 20.00, 100, 2);

-- Insertar en compra
INSERT INTO compra (proveedorId, total) VALUES (1, 7500.00);
INSERT INTO compra (proveedorId, total) VALUES (2, 2000.00);

-- Insertar en detalleCompra
INSERT INTO detalleCompra (compraId, repuestoId, cantidad, precioUnitario) VALUES (1, 1, 20, 150.00);
INSERT INTO detalleCompra (compraId, repuestoId, cantidad, precioUnitario) VALUES (2, 2, 100, 20.00);