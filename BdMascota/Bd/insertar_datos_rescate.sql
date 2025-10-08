-- Tipos de usuario
INSERT INTO TipoUsuario (nombre_tipo) VALUES ('rescatista'), ('adoptante'), ('veterinario');

-- Usuarios
INSERT INTO Usuario (nombre_completo, email, telefono, id_tipo) VALUES
('Ana López', 'ana@rescate.org', '555-1234', 1),
('Carlos Méndez', 'carlos@gmail.com', '555-5678', 2),
('Dra. Martínez', 'veterinaria@clinica.com', '555-9999', 3);

-- Veterinaria
INSERT INTO Veterinaria (nombre, direccion, latitud, longitud, telefono, email) VALUES
('Clínica Patitas Sanas', 'Av. Siempre Viva 123', -33.45678901, -70.67890123, '555-8888', 'contacto@patitassanas.cl');

-- Animal
INSERT INTO Animal (nombre, especie, raza, edad_aprox, sexo, estado_salud, fecha_rescate, ubicacion_rescate, id_rescatista)
VALUES ('Luna', 'gato', 'Siamés', 2, 'hembra', 'Sano', '2024-03-15', 'Parque Central', 1);

-- Expediente médico
INSERT INTO ExpedienteMedico (id_animal, id_veterinaria, fecha_consulta, diagnostico, tratamiento, vacunas, observaciones)
VALUES (1, 1, '2024-03-16', 'Control general', 'Ninguno', '{"rabia": "2024-03-16"}', 'Primera consulta post-rescate');

-- Adopción
INSERT INTO Adopcion (id_animal, id_adoptante, fecha_adopcion, estado, acta_generada)
VALUES (1, 2, '2024-06-01', 'aprobada', TRUE);

-- Seguimiento
INSERT INTO SeguimientoAdopcion (id_adopcion, fecha_seguimiento, observaciones, estado_seguimiento, acta_generada)
VALUES (1, '2024-07-01', 'Luna se adapta bien', 'bueno', TRUE);