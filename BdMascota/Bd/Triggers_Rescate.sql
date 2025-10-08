-- Crear base de datos
CREATE DATABASE IF NOT EXISTS rescate_animal;
USE rescate_animal;

-- Tabla de tipos de usuario (para normalizar el tipo)
CREATE TABLE TipoUsuario (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(20) NOT NULL UNIQUE CHECK (nombre_tipo IN ('rescatista', 'adoptante', 'veterinario'))
);

-- Tabla de usuarios
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    id_tipo INT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    FOREIGN KEY (id_tipo) REFERENCES TipoUsuario(id_tipo) ON DELETE RESTRICT
);

-- Tabla de veterinarias
CREATE TABLE Veterinaria (
    id_veterinaria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    telefono VARCHAR(20),
    email VARCHAR(100),
    estado ENUM('activa', 'inactiva') DEFAULT 'activa'
);

-- Tabla de animales
CREATE TABLE Animal (
    id_animal INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    especie VARCHAR(30) NOT NULL CHECK (especie IN ('perro', 'gato', 'otro')),
    raza VARCHAR(50),
    edad_aprox INT CHECK (edad_aprox >= 0 AND edad_aprox <= 30),
    sexo ENUM('macho', 'hembra') NOT NULL,
    estado_salud VARCHAR(100),
    fecha_rescate DATE NOT NULL,
    ubicacion_rescate VARCHAR(255),
    estado ENUM('disponible', 'adoptado', 'en_tratamiento', 'fallecido') DEFAULT 'disponible',
    id_rescatista INT NOT NULL,
    FOREIGN KEY (id_rescatista) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT
);

-- Expediente médico
CREATE TABLE ExpedienteMedico (
    id_expediente INT PRIMARY KEY AUTO_INCREMENT,
    id_animal INT NOT NULL,
    id_veterinaria INT,
    fecha_consulta DATE NOT NULL,
    diagnostico TEXT,
    tratamiento TEXT,
    vacunas JSON, -- Almacena lista de vacunas como JSON: {"rabia": "2024-01-01", "parvo": "2024-02-01"}
    observaciones TEXT,
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal) ON DELETE CASCADE,
    FOREIGN KEY (id_veterinaria) REFERENCES Veterinaria(id_veterinaria) ON DELETE SET NULL
);

-- Adopción
CREATE TABLE Adopcion (
    id_adopcion INT PRIMARY KEY AUTO_INCREMENT,
    id_animal INT NOT NULL,
    id_adoptante INT NOT NULL,
    fecha_adopcion DATE NOT NULL,
    estado ENUM('pendiente', 'aprobada', 'rechazada') DEFAULT 'pendiente',
    acta_generada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal) ON DELETE RESTRICT,
    FOREIGN KEY (id_adoptante) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT,
    UNIQUE(id_animal) -- Un animal solo puede ser adoptado una vez
);

-- Seguimiento post-adopción
CREATE TABLE SeguimientoAdopcion (
    id_seguimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_adopcion INT NOT NULL,
    fecha_seguimiento DATE NOT NULL,
    observaciones TEXT,
    estado_seguimiento ENUM('bueno', 'regular', 'malo') NOT NULL,
    acta_generada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_adopcion) REFERENCES Adopcion(id_adopcion) ON DELETE CASCADE
);

-- Tabla de auditoría genérica
CREATE TABLE Auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    tabla_afectada VARCHAR(50) NOT NULL,
    operacion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    id_registro_afectado INT,
    datos_anteriores JSON,
    datos_nuevos JSON,
    usuario_sistema VARCHAR(50) DEFAULT USER(),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
DELIMITER ;