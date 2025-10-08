-- Tabla de auditoría genérica
CREATE TABLE rescate_animal.Auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    tabla_afectada VARCHAR(50) NOT NULL,
    operacion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    id_registro_afectado INT,
    datos_anteriores JSON,
    datos_nuevos JSON,
    usuario_sistema VARCHAR(50) DEFAULT USER(),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);