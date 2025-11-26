-- 6. Notificaciones no leídas de un paciente
SELECT titulo, mensaje, creado_en
FROM notificaciones
WHERE id_usuario_destino = 3 AND leido = FALSE;
