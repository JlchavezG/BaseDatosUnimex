CREATE VIEW vista_adopciones_aprobadas AS
SELECT a.nombre AS animal, u.nombre_completo AS adoptante, ad.fecha_adopcion
FROM Adopcion ad
JOIN Animal a ON ad.id_animal = a.id_animal
JOIN Usuario u ON ad.id_adoptante = u.id_usuario
WHERE ad.estado = 'aprobada';