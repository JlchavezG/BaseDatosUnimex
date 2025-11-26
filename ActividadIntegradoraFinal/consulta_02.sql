-- 2. Historial clínico completo de un paciente
SELECT titulo, contenido, creado_en, u.nombre_completo AS medico
FROM expedientes_clinicos e
JOIN usuarios u ON e.creado_por = u.id_usuario
WHERE e.id_paciente = 3;