-- Consulta completa para informe ejecutivo
SELECT 
    -- Métricas generales
    (SELECT COUNT(*) FROM soporte_tickets) AS total_tickets,
    (SELECT COUNT(*) FROM soporte_tickets WHERE estado = 'Cerrado') AS tickets_cerrados,
    (SELECT COUNT(*) FROM soporte_tickets WHERE estado = 'Abierto') AS tickets_abiertos,
    
    -- Tiempo promedio de resolución
    (SELECT ROUND(AVG(TIMESTAMPDIFF(HOUR, fecha_apertura, fecha_cierre)), 2) 
     FROM soporte_tickets 
     WHERE estado = 'Cerrado') AS horas_promedio_resolucion,
    
    -- Distribución por prioridad
    (SELECT COUNT(*) FROM soporte_tickets WHERE prioridad = 'Alta') AS tickets_alta_prioridad,
    (SELECT COUNT(*) FROM soporte_tickets WHERE prioridad = 'Media') AS tickets_media_prioridad,
    (SELECT COUNT(*) FROM soporte_tickets WHERE prioridad = 'Baja') AS tickets_baja_prioridad,
    
    -- Eficiencia por empleado
    (SELECT e.nombre 
     FROM empleados e 
     JOIN soporte_tickets t ON e.id_empleado = t.id_empleado_asignado 
     WHERE t.estado = 'Cerrado' 
     GROUP BY e.id_empleado 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS empleado_mas_eficiente;