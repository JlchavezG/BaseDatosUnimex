-- --------------------------------------------------------
-- TABLA 4: pacientes (atributos específicos de pacientes)
-- Propósito: Extensión de usuarios con datos propios del paciente
-- Relación 1:1 con usuarios (solo si rol = 'paciente')
-- --------------------------------------------------------
CREATE TABLE pacientes (
    id_usuario INT UNSIGNED PRIMARY KEY,
    fecha_nacimiento DATE NOT NULL,
    genero ENUM('M', 'F', 'Otro') NOT NULL,
    direccion TEXT,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;