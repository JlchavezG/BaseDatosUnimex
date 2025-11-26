-- --------------------------------------------------------
-- TABLA 1: roles
-- Propósito: Normalizar los roles de usuario (1FN, 2FN, 3FN cumplidas)
-- Evita duplicación de valores de texto y permite extensibilidad
-- --------------------------------------------------------
CREATE TABLE roles (
    id_rol TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(20) NOT NULL UNIQUE CHECK (nombre_rol IN ('sistema', 'medico', 'paciente'))
) ENGINE=InnoDB;

INSERT INTO roles (nombre_rol) VALUES ('sistema'), ('medico'), ('paciente');
