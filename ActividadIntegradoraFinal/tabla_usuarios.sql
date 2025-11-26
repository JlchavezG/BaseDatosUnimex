-- --------------------------------------------------------
-- TABLA 2: usuarios
-- Propósito: Almacena todos los usuarios del sistema.
-- Normalización: atributos comunes en una tabla, sin redundancia.
-- Se relaciona con roles (1:N: un rol → muchos usuarios)
-- --------------------------------------------------------
CREATE TABLE usuarios (
    id_usuario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_rol TINYINT UNSIGNED NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL, -- Almacenado como hash (seguridad)
    activo BOOLEAN DEFAULT TRUE,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_email (email),
    INDEX idx_rol (id_rol)
) ENGINE=InnoDB;