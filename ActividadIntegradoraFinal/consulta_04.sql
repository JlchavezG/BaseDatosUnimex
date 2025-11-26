-- 4. Recetas emitidas por un médico
SELECT r.id_receta, p.nombre_completo AS paciente, r.medicamentos, r.creado_en
FROM recetas r
JOIN usuarios p ON r.id_paciente = p.id_usuario
WHERE r.id_medico = 2;