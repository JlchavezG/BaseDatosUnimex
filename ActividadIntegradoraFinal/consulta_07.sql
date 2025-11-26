-- 7. Seguimientos de un paciente (ordenados por fecha)
SELECT fecha, datos
FROM seguimientos
WHERE id_paciente = 3
ORDER BY fecha DESC;