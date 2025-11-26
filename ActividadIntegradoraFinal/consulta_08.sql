-- 8. Verificar que un usuario es médico
SELECT u.nombre_completo, m.especialidad
FROM usuarios u
JOIN medicos m ON u.id_usuario = m.id_usuario
WHERE u.email = 'ana@hospital.com';