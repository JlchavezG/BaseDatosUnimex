SELECT 
    estado,
    COUNT(*) AS cantidad_tickets,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM soporte_tickets)), 2) AS porcentaje
FROM soporte_tickets 
GROUP BY estado 
ORDER BY cantidad_tickets DESC;