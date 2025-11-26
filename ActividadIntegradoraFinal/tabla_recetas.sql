-- --------------------------------------------------------
-- TABLA 7: recetas
-- Propósito: Recetas médicas asociadas a un paciente y una cita (opcional)
-- Normalización: evita mezclar con expedientes; entidad independiente pero relacionada
-- --------------------------------------------------------
CREATE TABLE recetas (
    id_receta INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT UNSIGNED NOT NULL,
    id_medico INT UNSIGNED NOT NULL,
    id_cita INT UNSIGNED NULL, -- opcional: puede no estar ligada a cita
    medicamentos TEXT NOT NULL, -- JSON o texto estructurado (puede normalizarse más si se requiere farmacia)
    instrucciones TEXT,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita) ON DELETE SET NULL ON UPDATE CASCADE,
    
    INDEX idx_paciente (id_paciente),
    INDEX idx_medico (id_medico)
) ENGINE=InnoDB;