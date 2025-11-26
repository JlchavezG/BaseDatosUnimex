-- --------------------------------------------------------
-- TABLA 10: notificaciones
-- Propósito: Comunicación interna (recordatorios, alertas)
-- --------------------------------------------------------
CREATE TABLE notificaciones (
    id_notificacion INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_usuario_destino INT UNSIGNED NOT NULL, -- paciente o médico
    titulo VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    leido BOOLEAN DEFAULT FALSE,
    tipo ENUM('recordatorio', 'alerta', 'informacion') DEFAULT 'informacion',
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_usuario_destino) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_destino_leido (id_usuario_destino, leido)
) ENGINE=InnoDB;