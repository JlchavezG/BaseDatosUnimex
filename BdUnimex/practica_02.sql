SELECT 
    e.nombre AS empleado,
    COUNT(t.id_ticket) AS tickets_atendidos,
    ROUND(AVG(TIMESTAMPDIFF(HOUR, t.fecha_apertura, t.fecha_cierre)), 2) AS horas_promedio
FROM empleados e
LEFT JOIN soporte_tickets t ON e.id_empleado = t.id_empleado_asignado
WHERE t.estado = 'Cerrado'
GROUP BY e.id_empleado, e.nombre;