-- SCHEMA UNIVERSAL: Retail Simple (FIXED)
-- Fixes: Stock_Actual/Precio → DECIMAL/INT, VARCHAR2→VARCHAR
-- Compatible multi-DB

CREATE TABLE Region (ID_Region INT PRIMARY KEY, Nombre VARCHAR(100) NOT NULL);
CREATE TABLE Ciudad (ID_Ciudad INT PRIMARY KEY, Nombre VARCHAR(100) NOT NULL, Region_ID_Region INT, FOREIGN KEY (Region_ID_Region) REFERENCES Region(ID_Region));
CREATE TABLE Clientes (ID_CLI INT PRIMARY KEY, Nombre VARCHAR(100) NOT NULL, Apellido_pat VARCHAR(100) NOT NULL);
CREATE TABLE Departamento (ID_DPTO INT PRIMARY KEY, nombre VARCHAR(100) NOT NULL);
CREATE TABLE Empleados (ID_empleado INT PRIMARY KEY, Nombre VARCHAR(100) NOT NULL, Apellido_Pat VARCHAR(100) NOT NULL, Departamento_ID_DPTO INT, FOREIGN KEY (Departamento_ID_DPTO) REFERENCES Departamento(ID_DPTO));

CREATE TABLE Categoria (ID_categoria INT PRIMARY KEY, Nombre VARCHAR(100) NOT NULL);
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Categoria_ID_categoria INT,
    Marca VARCHAR(100) NOT NULL,
    Stock_Actual INT NOT NULL,  -- FIXED: VARCHAR → INT
    Precio_unitario DECIMAL(10,2) NOT NULL,  -- FIXED: VARCHAR → DECIMAL
    FOREIGN KEY (Categoria_ID_categoria) REFERENCES Categoria(ID_categoria)
);

CREATE TABLE Auditoria_Precios (
    Id_auditoria INT PRIMARY KEY,
    aud_ID_Producto INT,
    nombre_producto VARCHAR(100),
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha_cambio DATE,
    FOREIGN KEY (aud_ID_Producto) REFERENCES Productos(ID_Producto)
);

CREATE TABLE Ventas (
    ID_venta INT PRIMARY KEY,
    Fecha_Emision DATE NOT NULL,
    Ciudad_ID_Ciudad INT,
    Empleados_ID_empleado INT,
    Clientes_ID_CLI INT,
    Tipo_movim VARCHAR(10),
    FOREIGN KEY (Ciudad_ID_Ciudad) REFERENCES Ciudad(ID_Ciudad),
    FOREIGN KEY (Empleados_ID_empleado) REFERENCES Empleados(ID_empleado),
    FOREIGN KEY (Clientes_ID_CLI) REFERENCES Clientes(ID_CLI)
);

CREATE TABLE Detalle_venta (
    ID_Detalle INT PRIMARY KEY,
    Ventas_ID_venta INT,
    Productos_ID_Producto INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (Ventas_ID_venta) REFERENCES Ventas(ID_venta),
    FOREIGN KEY (Productos_ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Listo para demo.

