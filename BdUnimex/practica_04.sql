SELECT 
    c.nombre AS cliente,
    COUNT(t.id_ticket) AS total_tickets,
    SUM(CASE WHEN t.estado = 'Cerrado' THEN 1 ELSE 0 END) AS tickets_cerrados
FROM clientes c
LEFT JOIN soporte_tickets t ON c.id_cliente = t.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_tickets DESC
LIMIT 10;