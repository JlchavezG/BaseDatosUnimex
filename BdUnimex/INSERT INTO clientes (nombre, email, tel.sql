INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Ana García', 'ana.garcia@email.com', '600123456', 'Calle Principal 123, Madrid'),
('Carlos López', 'carlos.lopez@email.com', '600234567', 'Avenida Central 45, Barcelona'),
('María Rodríguez', 'maria.rodriguez@email.com', '600345678', 'Plaza Mayor 67, Valencia'),
('Javier Martínez', 'javier.martinez@email.com', '600456789', 'Calle Secundaria 89, Sevilla'),
('Laura Fernández', 'laura.fernandez@email.com', '600567890', 'Avenida Norte 12, Bilbao'),
('David Sánchez', 'david.sanchez@email.com', '600678901', 'Calle Este 34, Málaga'),
('Elena Pérez', 'elena.perez@email.com', '600789012', 'Plaza Sur 56, Zaragoza'),
('Miguel Torres', 'miguel.torres@email.com', '600890123', 'Avenida Oeste 78, Murcia'),
('Sofía Ramírez', 'sofia.ramirez@email.com', '600901234', 'Calle Central 90, Palma'),
('Daniel Castro', 'daniel.castro@email.com', '601012345', 'Paseo Marítimo 23, Las Palmas');

-- Insertar empleados
INSERT INTO empleados (nombre, especialidad, email, telefono) VALUES
('Roberto Jiménez', 'Hardware', 'roberto.jimenez@empresa.com', '610123456'),
('Sara Morales', 'Software', 'sara.morales@empresa.com', '610234567'),
('Pablo Ortega', 'Redes', 'pablo.ortega@empresa.com', '610345678'),
('Carmen Vega', 'Base de Datos', 'carmen.vega@empresa.com', '610456789'),
('Alejandro Ruiz', 'Seguridad', 'alejandro.ruiz@empresa.com', '610567890');

-- Insertar categorías de equipo
INSERT INTO categorias_equipo (nombre, descripcion) VALUES
('Laptop', 'Computadoras portátiles de diferentes marcas'),
('Desktop', 'Computadoras de escritorio'),
('Servidor', 'Servidores empresariales'),
('Impresora', 'Equipos de impresión'),
('Red', 'Equipos de networking'),
('Periféricos', 'Dispositivos adicionales');

-- Insertar equipos (continuar con más inserciones...)
INSERT INTO equipos (id_cliente, id_categoria, modelo, numero_serie, fecha_compra, garantia_hasta) VALUES
(1, 1, 'Dell Latitude 5490', 'DL5490XYZ123', '2023-01-15', '2025-01-15'),
(2, 1, 'HP EliteBook 840', 'HP840ABC456', '2023-02-20', '2025-02-20'),
(3, 2, 'Dell OptiPlex 7070', 'DO7070DEF789', '2023-03-10', '2025-03-10');

-- Insertar inventario
INSERT INTO inventario (nombre, descripcion, categoria, stock, stock_minimo, precio_unitario, ubicacion) VALUES
('RAM DDR4 8GB', 'Memoria RAM DDR4 8GB 2666MHz', 'Componentes', 25, 5, 45.50, 'Almacen A'),
('SSD 500GB', 'Disco sólido 500GB SATA', 'Almacenamiento', 15, 3, 89.99, 'Almacen A'),
('Teclado USB', 'Teclado multimedia USB', 'Periféricos', 30, 10, 25.00, 'Almacen B'),
('Mouse Inalámbrico', 'Mouse óptico inalámbrico', 'Periféricos', 40, 15, 18.50, 'Almacen B');

-- Insertar tickets de soporte
INSERT INTO soporte_tickets (id_cliente, id_equipo, id_empleado_asignado, titulo, descripcion, prioridad, estado) VALUES
(1, 1, 1, 'Problema de rendimiento', 'La laptop se encuentra muy lenta al ejecutar aplicaciones', 'Media', 'En Progreso'),
(2, 2, 2, 'Error de software', 'No inicia el sistema operativo, muestra pantalla azul', 'Alta', 'Abierto'),
(3, 3, 3, 'Problema de conexión', 'No se conecta a la red corporativa', 'Media', 'Cerrado');

-- Insertar detalles de tickets
INSERT INTO ticket_detalles (id_ticket, id_empleado, descripcion, horas_trabajadas) VALUES
(1, 1, 'Diagnóstico inicial: posible falta de memoria RAM', 0.5),
(1, 1, 'Instalada memoria RAM adicional - 8GB DDR4', 1.0),
(3, 3, 'Configurada conexión de red y actualizados drivers', 1.5);