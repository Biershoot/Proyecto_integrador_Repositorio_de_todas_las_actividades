
-- Create staging database and tables
CREATE DATABASE IF NOT EXISTS JardineriaStaging;
USE JardineriaStaging;

CREATE TABLE IF NOT EXISTS Cliente_Staging (
  id_cliente INT,
  nombre_cliente VARCHAR(100),
  pais VARCHAR(50),
  ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Producto_Staging (
  id_producto INT,
  nombre VARCHAR(100),
  gama VARCHAR(50),
  precio_venta DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS Pedido_Staging (
  id_pedido INT,
  id_cliente INT,
  id_empleado INT,
  fecha_pedido DATE,
  total DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS DimTiempo_Staging (
  fecha DATE,
  anio INT,
  mes INT,
  trimestre INT
);
