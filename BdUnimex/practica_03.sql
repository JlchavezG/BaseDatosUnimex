SELECT 
    nombre,
    stock,
    stock_minimo,
    (stock - stock_minimo) AS diferencia,
    CASE 
        WHEN stock <= stock_minimo THEN 'URGENTE'
        WHEN stock <= stock_minimo + 5 THEN 'ALERTA'
        ELSE 'OK'
    END AS estado_inventario
FROM inventario
ORDER BY diferencia ASC;