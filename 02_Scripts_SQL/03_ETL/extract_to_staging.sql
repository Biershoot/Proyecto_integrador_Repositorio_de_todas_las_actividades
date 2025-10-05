
-- ETL: Extract from source (Jardineria) into staging
USE Jardineria;

-- Load clients to staging
INSERT INTO JardineriaStaging.Cliente_Staging (id_cliente, nombre_cliente, pais, ciudad)
SELECT CodigoCliente, NombreCliente, Pais, Ciudad FROM Clientes;

-- Load products to staging
INSERT INTO JardineriaStaging.Producto_Staging (id_producto, nombre, gama, precio_venta)
SELECT CodigoProducto, Nombre, Gama, PrecioVenta FROM Productos;

-- Aggregate orders into staging (one row per pedido with total)
INSERT INTO JardineriaStaging.Pedido_Staging (id_pedido, id_cliente, id_empleado, fecha_pedido, total)
SELECT p.CodigoPedido, p.CodigoCliente, p.CodigoEmpleado, p.FechaPedido,
       SUM(dp.Cantidad * dp.PrecioUnidad) AS total
FROM Pedidos p
JOIN DetallePedidos dp ON p.CodigoPedido = dp.CodigoPedido
GROUP BY p.CodigoPedido, p.CodigoCliente, p.CodigoEmpleado, p.FechaPedido;
