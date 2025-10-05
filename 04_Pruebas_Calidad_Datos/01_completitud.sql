-- Completitud: campos clave no deben ser NULL
SELECT COUNT(*) AS null_clientes FROM Jardineria.Clientes WHERE CodigoCliente IS NULL OR NombreCliente IS NULL;
SELECT COUNT(*) AS null_pedidos FROM Jardineria.Pedidos WHERE CodigoPedido IS NULL OR FechaPedido IS NULL;