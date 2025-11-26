-- 10. Pacientes sin citas en los últimos 6 meses
SELECT u.nombre_completo, u.email
FROM pacientes p
JOIN usuarios u ON p.id_usuario = u.id_usuario
LEFT JOIN citas c ON p.id_usuario = c.id_paciente
   AND c.fecha_hora >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
WHERE c.id_cita IS NULL;