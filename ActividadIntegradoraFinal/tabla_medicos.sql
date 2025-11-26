-- --------------------------------------------------------
-- TABLA 3: medicos (atributos específicos de médicos)
-- Propósito: Extensión de usuarios con datos propios del médico
-- Relación 1:1 con usuarios (solo si rol = 'medico')
-- --------------------------------------------------------
CREATE TABLE medicos (
    id_usuario INT UNSIGNED PRIMARY KEY,
    especialidad VARCHAR(100) NOT NULL,
    cedula_profesional VARCHAR(50) UNIQUE NOT NULL,
    consultorio VARCHAR(50),
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;