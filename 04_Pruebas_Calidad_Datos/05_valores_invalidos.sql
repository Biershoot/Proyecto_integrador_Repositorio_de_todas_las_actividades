-- Exactitud: precios o cantidades inválidas
SELECT * FROM Jardineria.Productos WHERE PrecioVenta <= 0;
SELECT * FROM Jardineria.DetallePedidos WHERE Cantidad <= 0;