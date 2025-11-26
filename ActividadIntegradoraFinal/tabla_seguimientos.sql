-- --------------------------------------------------------
-- TABLA 8: seguimientos
-- Propósito: Registrar evolución del paciente (peso, presión, notas, etc.)
-- --------------------------------------------------------
CREATE TABLE seguimientos (
    id_seguimiento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT UNSIGNED NOT NULL,
    id_medico INT UNSIGNED NOT NULL,
    datos JSON NOT NULL, -- flexible: { "peso": 70, "presion": "120/80", "notas": "..." }
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    
    INDEX idx_paciente_fecha (id_paciente, fecha)
) ENGINE=InnoDB;