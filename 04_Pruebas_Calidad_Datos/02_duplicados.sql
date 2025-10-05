-- Duplicados: buscar clientes duplicados por nombre
SELECT NombreCliente, COUNT(*) AS cnt FROM Jardineria.Clientes GROUP BY NombreCliente HAVING COUNT(*) > 1;