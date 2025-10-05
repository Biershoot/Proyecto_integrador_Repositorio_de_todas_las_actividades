
-- Create DataMart schema and tables
CREATE DATABASE IF NOT EXISTS JardineriaDataMart;
USE JardineriaDataMart;

CREATE TABLE IF NOT EXISTS DimCliente (
  sk_cliente INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  nombre_cliente VARCHAR(100),
  pais VARCHAR(50),
  ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimProducto (
  sk_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT,
  nombre VARCHAR(100),
  gama VARCHAR(50),
  precio_venta DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS DimEmpleado (
  sk_empleado INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT,
  nombre_empleado VARCHAR(100),
  oficina VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimOficina (
  sk_oficina INT AUTO_INCREMENT PRIMARY KEY,
  id_oficina INT,
  ciudad VARCHAR(50),
  pais VARCHAR(50),
  region VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimTiempo (
  sk_tiempo INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  anio INT,
  mes INT,
  trimestre INT
);

CREATE TABLE IF NOT EXISTS FactVentas (
  id_fact INT AUTO_INCREMENT PRIMARY KEY,
  sk_cliente INT,
  sk_producto INT,
  sk_empleado INT,
  sk_oficina INT,
  sk_tiempo INT,
  total_venta DECIMAL(12,2)
);
