-- Usuario sistema
INSERT INTO usuarios (id_rol, nombre_completo, email, password_hash, telefono)
VALUES (1, 'Admin Sistema', 'admin@hospital.com', SHA2('admin123', 256), '555-0000');

-- Médico
INSERT INTO usuarios (id_rol, nombre_completo, email, password_hash, telefono)
VALUES (2, 'Dr. Ana López', 'ana@hospital.com', SHA2('medico123', 256), '555-1111');
INSERT INTO medicos (id_usuario, especialidad, cedula_profesional, consultorio)
VALUES (2, 'Cardiología', 'C123456', 'C-205');

-- Paciente
INSERT INTO usuarios (id_rol, nombre_completo, email, password_hash, telefono)
VALUES (3, 'Carlos Méndez', 'carlos@email.com', SHA2('paciente123', 256), '555-2222');
INSERT INTO pacientes (id_usuario, fecha_nacimiento, genero, direccion)
VALUES (3, '1985-06-15', 'M', 'Av. Siempre Viva 123');

-- Cita
INSERT INTO citas (id_paciente, id_medico, fecha_hora, estado)
VALUES (3, 2, '2025-11-28 10:00:00', 'programada');

-- Expediente
INSERT INTO expedientes_clinicos (id_paciente, titulo, contenido, creado_por)
VALUES (3, 'Primera consulta', 'Hipertensión leve. Se indica dieta baja en sodio.', 2);

-- Receta
INSERT INTO recetas (id_paciente, id_medico, medicamentos, instrucciones)
VALUES (3, 2, 'Lisinopril 10mg', 'Tomar 1 tableta diaria por 30 días.');

-- Seguimiento
INSERT INTO seguimientos (id_paciente, id_medico, datos)
VALUES (3, 2, '{"peso": 78, "presion": "130/85", "notas": "Estable"}');

-- Notificación
INSERT INTO notificaciones (id_usuario_destino, titulo, mensaje, tipo)
VALUES (3, 'Recordatorio de cita', 'Tienes una cita mañana a las 10:00 AM con el Dr. Ana López.', 'recordatorio');