-- Integridad referencial: detalle sin pedido
SELECT dp.id FROM Jardineria.DetallePedidos dp LEFT JOIN Jardineria.Pedidos p ON dp.CodigoPedido = p.CodigoPedido WHERE p.CodigoPedido IS NULL;