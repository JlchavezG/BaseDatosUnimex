-- 9. Contar citas por estado para un médico
SELECT estado, COUNT(*) AS total
FROM citas
WHERE id_medico = 2
GROUP BY estado;