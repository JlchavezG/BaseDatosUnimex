-- --------------------------------------------------------
-- TABLA 5: citas
-- Propósito: Almacena las citas médicas
-- Normalización: separa lógica de agenda de usuarios
-- Restricción: no se permite cita en el pasado
-- --------------------------------------------------------
CREATE TABLE citas (
    id_cita INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT UNSIGNED NOT NULL,
    id_medico INT UNSIGNED NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado ENUM('programada', 'completada', 'cancelada', 'no_asistio') DEFAULT 'programada',
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    
    -- Restricción: evitar duplicación de citas (mismo médico, misma hora)
    UNIQUE KEY uk_medico_hora (id_medico, fecha_hora),
    
    -- Índice para búsquedas por paciente y fecha
    INDEX idx_paciente_fecha (id_paciente, fecha_hora),
    INDEX idx_medico_fecha (id_medico, fecha_hora)
) ENGINE=InnoDB;