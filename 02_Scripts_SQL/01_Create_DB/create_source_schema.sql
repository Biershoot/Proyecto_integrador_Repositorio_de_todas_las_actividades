
-- Create source schema and tables (Jardineria)
CREATE DATABASE IF NOT EXISTS Jardineria;
USE Jardineria;

CREATE TABLE IF NOT EXISTS Clientes (
  CodigoCliente INT PRIMARY KEY,
  NombreCliente VARCHAR(100),
  Pais VARCHAR(50),
  Ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Productos (
  CodigoProducto INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Gama VARCHAR(50),
  PrecioVenta DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS Empleados (
  CodigoEmpleado INT PRIMARY KEY,
  NombreEmpleado VARCHAR(100),
  Oficina VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Pedidos (
  CodigoPedido INT PRIMARY KEY,
  CodigoCliente INT,
  CodigoEmpleado INT,
  FechaPedido DATE,
  FOREIGN KEY (CodigoCliente) REFERENCES Clientes(CodigoCliente),
  FOREIGN KEY (CodigoEmpleado) REFERENCES Empleados(CodigoEmpleado)
);

CREATE TABLE IF NOT EXISTS DetallePedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  CodigoPedido INT,
  CodigoProducto INT,
  Cantidad INT,
  PrecioUnidad DECIMAL(12,2),
  FOREIGN KEY (CodigoPedido) REFERENCES Pedidos(CodigoPedido),
  FOREIGN KEY (CodigoProducto) REFERENCES Productos(CodigoProducto)
);
