-- Consistencia: pedidos con cliente inexistente
SELECT p.CodigoPedido FROM Jardineria.Pedidos p LEFT JOIN Jardineria.Clientes c ON p.CodigoCliente = c.CodigoCliente WHERE c.CodigoCliente IS NULL;