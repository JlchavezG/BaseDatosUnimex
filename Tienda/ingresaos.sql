-- Ver ingresos reales:
SELECT 
    p.nombre_producto,
    v.cantidad,
    p.precio,
    (v.cantidad * p.precio) AS subtotal
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;