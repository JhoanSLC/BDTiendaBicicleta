DROP DATABASE IF EXISTS campusBike;
CREATE DATABASE campusbike;
USE campusbike;

CREATE TABLE pais(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    CONSTRAINT PkPais PRIMARY KEY (id),
    CONSTRAINT UcPais UNIQUE (nombre)
);

CREATE TABLE ciudad(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
	paisId INT NOT NULL,
    CONSTRAINT Pk_ciudad PRIMARY KEY (id),
    CONSTRAINT Fk_CiudadPais FOREIGN KEY (paisId) REFERENCES pais(id), 
    CONSTRAINT Uc_Ciudad UNIQUE (nombre,paisId)
);

CREATE TABLE bicicleta(
	id INT AUTO_INCREMENT,
	modelo VARCHAR(30) NOT NULL,
	marca VARCHAR(30) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	stock INT NOT NULL,
	CONSTRAINT Pk_bicicletas PRIMARY KEY (id),
	CONSTRAINT Uc_bicicleta UNIQUE (modelo,marca)
);

CREATE TABLE cliente(
	id VARCHAR(10) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	correo VARCHAR(100),
	telefono VARCHAR(20),
	ciudadId INT NOT NULL,
	CONSTRAINT Pk_cliente PRIMARY KEY (id),
	CONSTRAINT Fk_clienteCiudad FOREIGN KEY (ciudadId) REFERENCES ciudad(id),
    CONSTRAINT Uc_ClienteCorreo UNIQUE (correo)
);

CREATE TABLE venta(
	id INT AUTO_INCREMENT,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
	clienteId VARCHAR(10) NOT NULL,
	total DECIMAL(10,2),
	CONSTRAINT Pk_ventas PRIMARY KEY (id),
	CONSTRAINT Fk_ventasCliente FOREIGN KEY (clienteId) REFERENCES cliente(id)
);

CREATE TABLE detalleVenta(
	id INT AUTO_INCREMENT,
	ventaId INT NOT NULL,
	bicicletaId INT NOT NULL,
	cantidad INT NOT NULL,
	precioUnitario DECIMAL(10,2) NOT NULL,
	CONSTRAINT Pk_detalleVenta PRIMARY KEY (id),
	CONSTRAINT Fk_VentaADetalle FOREIGN KEY (ventaId) REFERENCES venta(id),
    CONSTRAINT Fk_detalleVentaBicicleta FOREIGN KEY (bicicletaId) REFERENCES bicicleta(id)
);

CREATE TABLE proveedor(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	contacto VARCHAR(30) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	correo VARCHAR(100),
	ciudadId INT NOT NULL,
	CONSTRAINT Pk_proveedores PRIMARY KEY (id),
	CONSTRAINT Fk_proveedoresCiudad FOREIGN  KEY (ciudadId) REFERENCES ciudad(id),
    CONSTRAINT Uc_Proveedor UNIQUE (correo)
);

CREATE TABLE repuesto(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(50),
	precio DECIMAL(10,2) NOT NULL,
	stock INT NOT NULL,
	proveedorId INT NOT NULL,
	CONSTRAINT Pk_repuestos PRIMARY KEY (id),
	CONSTRAINT Fk_repuestosProveedor FOREIGN  KEY (proveedorId) REFERENCES proveedor(id),
    CONSTRAINT Uc_Repuesto UNIQUE (nombre,proveedorId)
);

CREATE TABLE compra(
	id INT AUTO_INCREMENT,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
	proveedorId INT NOT NULL,
	total DECIMAL(10,2),
	CONSTRAINT Pk_compras PRIMARY KEY (id),
	CONSTRAINT Fk_comprasProveedor FOREIGN KEY (proveedorId) REFERENCES proveedor(id)
);

CREATE TABLE detalleCompra(
	id INT AUTO_INCREMENT,
	compraId INT NOT NULL,
	repuestoId INT NOT NULL,
	cantidad INT NOT NULL,
	precioUnitario DECIMAL(10,2),
	CONSTRAINT Pk_DetalleCompra PRIMARY KEY(id),
	CONSTRAINT Fk_Compra FOREIGN KEY (compraId) REFERENCES compra(id),
	CONSTRAINT Fk_Repuesto FOREIGN KEY (repuestoId) REFERENCES repuesto(id)
);

-- DDL TERMINADO --