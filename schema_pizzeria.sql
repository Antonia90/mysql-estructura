DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE categoria(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE producto(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    imagen LONGBLOB,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT UNSIGNED,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE cliente(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccion VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10),
    localidad VARCHAR(50),
    provincia VARCHAR(50),
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE tienda(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE empleado(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    NIF VARCHAR(9) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo ENUM('cocinero', 'repartidor') NOT NULL,
    id_tienda INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id)
);

CREATE TABLE pedido(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    tipo ENUM('Reparto a domicilio', 'Recoger en tienda') NOT NULL,
    cantidad_productos INT UNSIGNED NOT NULL,
    precio DECIMAL(10,2) UNSIGNED NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    id_tienda INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id)
);

CREATE TABLE pedido_producto (
    id_pedido INT UNSIGNED,
    id_producto INT UNSIGNED,
    cantidad INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);

CREATE TABLE reparto_domicilio (
    id_pedido INT UNSIGNED PRIMARY KEY,
    id_repartidor INT UNSIGNED NOT NULL,
    fecha_hora_entrega DATETIME NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_repartidor) REFERENCES empleado(id)
);


