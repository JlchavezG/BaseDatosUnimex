-- 5. Encuestas respondidas por pacientes (con calificación)
SELECT u.nombre_completo AS paciente, e.calificacion, e.comentarios, c.fecha_hora
FROM encuestas_citas e
JOIN citas c ON e.id_cita = c.id_cita
JOIN usuarios u ON c.id_paciente = u.id_usuario;
