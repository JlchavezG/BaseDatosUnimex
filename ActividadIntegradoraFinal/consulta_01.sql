-- 1. Listar todas las citas del paciente "Carlos Méndez"
SELECT c.id_cita, u.nombre_completo AS medico, c.fecha_hora, c.estado
FROM citas c
JOIN usuarios u ON c.id_medico = u.id_usuario
WHERE c.id_paciente = 3;