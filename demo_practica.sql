-- DEMO PRÁCTICA: Retail Simple (FIXED)
-- INSERTs, simulación triggers, verificación

-- Datos básicos
INSERT INTO Region VALUES (1, 'Metropolitana');
INSERT INTO Ciudad VALUES (1, 'Santiago', 1);
INSERT INTO Departamento VALUES (1, 'Ventas');
INSERT INTO Empleados VALUES (1, 'Ana', 'Martínez', 1);
INSERT INTO Clientes VALUES (1, 'Pedro', 'Rodríguez');
INSERT INTO Categoria VALUES (1, 'Electrónicos'), (2, 'Ropa');
INSERT INTO Productos VALUES 
(1, 'TV LED', 1, 'LG', 20, 350000.00),  -- FIXED tipos
(2, 'Jeans', 2, 'Levi''s', 50, 45000.00);

-- Venta
INSERT INTO Ventas VALUES (1, '2024-03-15', 1, 1, 1, 'Web');
INSERT INTO Detalle_venta VALUES (1, 1, 1, 2), (2, 1, 2, 1);
-- Simular trigger descuento: UPDATE Productos SET Stock_Actual -= Cantidad WHERE ID_Producto IN (1,2);

-- Cambio precio (auditoría)
UPDATE Productos SET Precio_unitario = 320000.00 WHERE ID_Producto = 1;
-- INSERT Auditoria_Precios (1,1,'TV LED',350000,320000,'2024-03-15');

-- QUERIES
SELECT 'Stock Post-Venta' AS Demo, p.Nombre, p.Stock_Actual FROM Productos p;  -- 18,49 esperados
SELECT v.Tipo_movim, COUNT(*) AS Total_Ventas FROM Ventas v GROUP BY v.Tipo_movim;
SELECT AVG(p.Precio_unitario) AS Precio_Promedio FROM Productos p;

-- Nuevo INSERT
INSERT INTO Productos VALUES (3, 'Celular', 1, 'Samsung', 15, 250000.00);
SELECT 'Total Productos' AS Resultado, COUNT(*) FROM Productos;

