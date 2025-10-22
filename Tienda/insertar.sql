-- Clientes
INSERT INTO TiendaElectronica.clientes (nombre, email, ciudad, fecha_registro) VALUES
('Ana López', 'ana@email.com', 'Lima', '2024-01-10'),
('Carlos Mendoza', 'carlos@email.com', 'Bogotá', '2024-02-15'),
('Diana Ruiz', 'diana@email.com', 'Lima', '2024-03-22'),
('Eduardo Silva', 'eduardo@email.com', 'Quito', '2024-01-30');

-- Productos
INSERT INTO productos (nombre_producto, categoria, precio, stock) VALUES
('Laptop HP', 'Computadoras', 2500.00, 10),
('Mouse Inalámbrico', 'Accesorios', 25.50, 50),
('Teclado Mecánico', 'Accesorios', 80.00, 30),
('Monitor 24"', 'Periféricos', 180.00, 15),
('Tablet Samsung', 'Tablets', 400.00, 20);

-- Ventas
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 1, '2025-03-10'),
(1, 2, 2, '2025-03-10'),
(2, 3, 1, '2025-04-05'),
(3, 1, 1, '2025-05-12'),
(3, 4, 1, '2025-05-12'),
(4, 5, 2, '2025-06-18'),
(2, 2, 3, '2025-07-01');