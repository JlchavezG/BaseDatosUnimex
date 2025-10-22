SELECT SUM(p.precio * v.cantidad) AS ingresos_totales
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;