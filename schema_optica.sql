DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    codigo_postal VARCHAR(10) NOT NULL,
    telefono VARCHAR(9),
    correo VARCHAR(50) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    cliente_id_recomendador INT UNSIGNED,
    FOREIGN KEY (cliente_id_recomendador) REFERENCES cliente(id)
);

CREATE TABLE empleado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50)
);

CREATE TABLE proveedor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    piso VARCHAR(10),
    puerta VARCHAR(10),
    ciudad VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    fax VARCHAR(20),
    NIF VARCHAR(9) UNIQUE NOT NULL
);

CREATE TABLE marca (
    nombre VARCHAR(50) PRIMARY KEY,
    proveedor_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (proveedor_id) REFERENCES proveedor(id)
);

CREATE TABLE gafa (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    graduacion_izquierda FLOAT NOT NULL,
    graduacion_derecha FLOAT NOT NULL,
    tipo_montura ENUM ('flotante', 'pasta', 'metálica') NOT NULL,
    color_montura VARCHAR(15),
    color_vidrio_izquierdo VARCHAR(20),
    color_vidrio_derecho VARCHAR(20),
    precio FLOAT NOT NULL,
    FOREIGN KEY (marca) REFERENCES marca(nombre)
);

CREATE TABLE venta (
    cliente_id INT UNSIGNED NOT NULL,
    empleado_id INT UNSIGNED NOT NULL,
    gafa_id INT UNSIGNED NOT NULL,
    fecha_venta DATE NOT NULL,
    PRIMARY KEY (cliente_id, gafa_id, fecha_venta),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id),
    FOREIGN KEY (gafa_id) REFERENCES gafa(id)
);

