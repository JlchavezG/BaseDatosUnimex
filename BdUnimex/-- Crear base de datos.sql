-- Crear base de datos
CREATE DATABASE IF NOT EXISTS soporte_tecnico;
USE soporte_tecnico;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro DATE DEFAULT CURDATE()
);

-- Tabla de empleados (soporte técnico)
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla de categorías de equipo
CREATE TABLE categorias_equipo (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de equipos
CREATE TABLE equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_categoria INT,
    modelo VARCHAR(100),
    numero_serie VARCHAR(100) UNIQUE,
    fecha_compra DATE,
    garantia_hasta DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_categoria) REFERENCES categorias_equipo(id_categoria)
);

-- Tabla de inventario
CREATE TABLE inventario (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(100),
    stock INT DEFAULT 0,
    stock_minimo INT DEFAULT 5,
    precio_unitario DECIMAL(10,2),
    ubicacion VARCHAR(100)
);

-- Tabla principal de tickets de soporte
CREATE TABLE soporte_tickets (
    id_ticket INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_equipo INT,
    id_empleado_asignado INT,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    prioridad ENUM('Baja', 'Media', 'Alta', 'Crítica') DEFAULT 'Media',
    estado ENUM('Abierto', 'En Progreso', 'Espera Repuesto', 'Cerrado') DEFAULT 'Abierto',
    fecha_apertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_empleado_asignado) REFERENCES empleados(id_empleado)
);

-- Tabla de detalles del ticket (seguimiento)
CREATE TABLE ticket_detalles (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_ticket INT,
    id_empleado INT,
    descripcion TEXT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    horas_trabajadas DECIMAL(4,2) DEFAULT 0,
    FOREIGN KEY (id_ticket) REFERENCES soporte_tickets(id_ticket),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de informes
CREATE TABLE informes_soporte (
    id_informe INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    tipo_informe ENUM('Diario', 'Semanal', 'Mensual', 'Anual'),
    fecha_generacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    datos_informe JSON
);