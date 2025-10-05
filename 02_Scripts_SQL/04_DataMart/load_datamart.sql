
-- Load dimensions from staging to DataMart
USE JardineriaDataMart;

-- DimCliente
INSERT INTO DimCliente (id_cliente, nombre_cliente, pais, ciudad)
SELECT DISTINCT id_cliente, nombre_cliente, pais, ciudad FROM JardineriaStaging.Cliente_Staging;

-- DimProducto
INSERT INTO DimProducto (id_producto, nombre, gama, precio_venta)
SELECT DISTINCT id_producto, nombre, gama, precio_venta FROM JardineriaStaging.Producto_Staging;

-- DimTiempo
INSERT INTO DimTiempo (fecha, anio, mes, trimestre)
SELECT DISTINCT fecha, anio, mes, trimestre FROM JardineriaStaging.DimTiempo_Staging;

-- FactVentas (example joining logic - adapt as needed)
INSERT INTO FactVentas (sk_cliente, sk_producto, sk_empleado, sk_oficina, sk_tiempo, total_venta)
SELECT dc.sk_cliente, dp.sk_producto, de.sk_empleado, NULL AS sk_oficina, dt.sk_tiempo, p.total
FROM JardineriaStaging.Pedido_Staging p
JOIN JardineriaDataMart.DimCliente dc ON p.id_cliente = dc.id_cliente
LEFT JOIN JardineriaDataMart.DimProducto dp ON p.id_pedido = dp.id_producto -- placeholder if needed
JOIN JardineriaDataMart.DimTiempo dt ON p.fecha_pedido = dt.fecha;
