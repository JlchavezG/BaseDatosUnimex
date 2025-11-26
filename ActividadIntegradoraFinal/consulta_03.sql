-- 3. Citas programadas para un médico en los próximos 7 días
SELECT p.nombre_completo AS paciente, c.fecha_hora
FROM citas c
JOIN usuarios p ON c.id_paciente = p.id_usuario
WHERE c.id_medico = 2
  AND c.estado = 'programada'
  AND c.fecha_hora BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY);