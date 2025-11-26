-- --------------------------------------------------------
-- TABLA 6: expedientes_clinicos
-- Propósito: Historial médico del paciente
-- Normalización: cada expediente pertenece a un paciente y puede tener múltiples entradas
-- --------------------------------------------------------
CREATE TABLE expedientes_clinicos (
    id_expediente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT UNSIGNED NOT NULL,
    titulo VARCHAR(100) NOT NULL, -- Ej: "Diagnóstico inicial", "Seguimiento post-cirugía"
    contenido TEXT NOT NULL,
    creado_por INT UNSIGNED NOT NULL, -- médico que lo creó
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (creado_por) REFERENCES medicos(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    
    INDEX idx_paciente (id_paciente)
) ENGINE=InnoDB;