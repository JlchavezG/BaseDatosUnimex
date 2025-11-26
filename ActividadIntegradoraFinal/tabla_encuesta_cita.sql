-- --------------------------------------------------------
-- TABLA 9: encuestas_citas
-- Propósito: Encuestas post-cita (una por cita completada)
-- Normalización: evita nulos innecesarios; solo existe si hay encuesta
-- --------------------------------------------------------
CREATE TABLE encuestas_citas (
    id_encuesta INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_cita INT UNSIGNED NOT NULL,
    calificacion TINYINT UNSIGNED NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    comentarios TEXT,
    respondido_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY uk_cita (id_cita) -- una encuesta por cita
) ENGINE=InnoDB;