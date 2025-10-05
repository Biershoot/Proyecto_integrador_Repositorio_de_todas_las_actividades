---------------------------------------------------
-- CREACIÓN DE BASES DE DATOS
---------------------------------------------------
CREATE DATABASE JardineriaStaging;
CREATE DATABASE JardineriaDataMart;

---------------------------------------------------
-- TABLAS EN STAGING
---------------------------------------------------
USE JardineriaStaging;

-- Clientes
CREATE TABLE Cliente_Staging (
    id_cliente INT,
    nombre_cliente VARCHAR(100),
    pais VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Productos
CREATE TABLE Producto_Staging (
    id_producto VARCHAR(20),
    nombre VARCHAR(100),
    gama VARCHAR(50),
    precio_venta DECIMAL(10,2)
);

-- Pedidos
CREATE TABLE Pedido_Staging (
    id_pedido INT,
    id_cliente INT,
    id_empleado INT,
    fecha_pedido DATE,
    total DECIMAL(12,2)
);

-- Tiempo (se llena en transformación)
CREATE TABLE DimTiempo_Staging (
    fecha DATE,
    anio INT,
    mes INT,
    trimestre INT
);

---------------------------------------------------
-- TABLAS EN DATA MART
---------------------------------------------------
USE JardineriaDataMart;

-- Dimensiones
CREATE TABLE DimCliente (
    sk_cliente INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    nombre_cliente VARCHAR(100),
    pais VARCHAR(50),
    ciudad VARCHAR(50)
);

CREATE TABLE DimProducto (
    sk_producto INT IDENTITY(1,1) PRIMARY KEY,
    id_producto VARCHAR(20),
    nombre VARCHAR(100),
    gama VARCHAR(50),
    precio_venta DECIMAL(10,2)
);

CREATE TABLE DimEmpleado (
    sk_empleado INT IDENTITY(1,1) PRIMARY KEY,
    id_empleado INT,
    nombre VARCHAR(100),
    puesto VARCHAR(50),
    oficina VARCHAR(50)
);

CREATE TABLE DimOficina (
    sk_oficina INT IDENTITY(1,1) PRIMARY KEY,
    id_oficina INT,
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE DimTiempo (
    sk_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    anio INT,
    mes INT,
    trimestre INT
);

-- Tabla de Hechos
CREATE TABLE FactVentas (
    id_fact INT IDENTITY(1,1) PRIMARY KEY,
    sk_cliente INT,
    sk_producto INT,
    sk_empleado INT,
    sk_oficina INT,
    sk_tiempo INT,
    total_venta DECIMAL(12,2),
    FOREIGN KEY (sk_cliente) REFERENCES DimCliente(sk_cliente),
    FOREIGN KEY (sk_producto) REFERENCES DimProducto(sk_producto),
    FOREIGN KEY (sk_empleado) REFERENCES DimEmpleado(sk_empleado),
    FOREIGN KEY (sk_oficina) REFERENCES DimOficina(sk_oficina),
    FOREIGN KEY (sk_tiempo) REFERENCES DimTiempo(sk_tiempo)
);

---------------------------------------------------
-- ETAPA DE EXTRACCIÓN (Origen -> Staging)
---------------------------------------------------
-- Clientes
INSERT INTO JardineriaStaging.Cliente_Staging
(id_cliente, nombre_cliente, pais, ciudad)
SELECT CodigoCliente, NombreCliente, Pais, Ciudad
FROM Jardineria.Clientes;

-- Productos
INSERT INTO JardineriaStaging.Producto_Staging
(id_producto, nombre, gama, precio_venta)
SELECT CodigoProducto, Nombre, Gama, PrecioVenta
FROM Jardineria.Productos;

-- Pedidos
INSERT INTO JardineriaStaging.Pedido_Staging
(id_pedido, id_cliente, id_empleado, fecha_pedido, total)
SELECT p.CodigoPedido, p.CodigoCliente, e.CodigoEmpleado, p.FechaPedido,
       SUM(dp.Cantidad * dp.PrecioUnidad)
FROM Jardineria.Pedidos p
JOIN Jardineria.DetallePedidos dp ON p.CodigoPedido = dp.CodigoPedido
JOIN Jardineria.Empleados e ON p.CodigoEmpleado = e.CodigoEmpleado
GROUP BY p.CodigoPedido, p.CodigoCliente, e.CodigoEmpleado, p.FechaPedido;

---------------------------------------------------
-- ETAPA DE TRANSFORMACIÓN
---------------------------------------------------
-- Normalización de clientes
UPDATE JardineriaStaging.Cliente_Staging
SET nombre_cliente = UPPER(nombre_cliente);

-- Dimensión tiempo
INSERT INTO JardineriaStaging.DimTiempo_Staging (fecha, anio, mes, trimestre)
SELECT fecha_pedido,
       YEAR(fecha_pedido),
       MONTH(fecha_pedido),
       CASE
         WHEN MONTH(fecha_pedido) BETWEEN 1 AND 3 THEN 1
         WHEN MONTH(fecha_pedido) BETWEEN 4 AND 6 THEN 2
         WHEN MONTH(fecha_pedido) BETWEEN 7 AND 9 THEN 3
         ELSE 4
       END
FROM JardineriaStaging.Pedido_Staging;

---------------------------------------------------
-- ETAPA DE CARGA (Staging -> Data Mart)
---------------------------------------------------
-- Clientes
INSERT INTO JardineriaDataMart.DimCliente (id_cliente, nombre_cliente, pais, ciudad)
SELECT id_cliente, nombre_cliente, pais, ciudad
FROM JardineriaStaging.Cliente_Staging;

-- Tiempo
INSERT INTO JardineriaDataMart.DimTiempo (fecha, anio, mes, trimestre)
SELECT fecha, anio, mes, trimestre
FROM JardineriaStaging.DimTiempo_Staging;

-- Productos
INSERT INTO JardineriaDataMart.DimProducto (id_producto, nombre, gama, precio_venta)
SELECT id_producto, nombre, gama, precio_venta
FROM JardineriaStaging.Producto_Staging;

-- Hechos
INSERT INTO JardineriaDataMart.FactVentas (sk_cliente, sk_producto, sk_empleado, sk_oficina, sk_tiempo, total_venta)
SELECT dc.sk_cliente, dp.sk_producto, de.sk_empleado, dof.sk_oficina, dt.sk_tiempo, p.total
FROM JardineriaStaging.Pedido_Staging p
JOIN JardineriaDataMart.DimCliente dc ON p.id_cliente = dc.id_cliente
JOIN JardineriaDataMart.DimTiempo dt ON p.fecha_pedido = dt.fecha
JOIN JardineriaDataMart.DimProducto dp ON p.id_producto = dp.id_producto
JOIN JardineriaDataMart.DimEmpleado de ON p.id_empleado = de.id_empleado
JOIN JardineriaDataMart.DimOficina dof ON de.oficina = dof.ciudad;
