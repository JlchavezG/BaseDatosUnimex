SELECT 
    c.nombre,
    COUNT(v.id_venta) AS num_compras
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente;