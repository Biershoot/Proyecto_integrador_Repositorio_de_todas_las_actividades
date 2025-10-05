
-- Transformations in staging
USE JardineriaStaging;

-- Normalize client names to uppercase
UPDATE Cliente_Staging SET nombre_cliente = UPPER(nombre_cliente);

-- Create dimension time data
INSERT INTO DimTiempo_Staging (fecha, anio, mes, trimestre)
SELECT fecha_pedido,
       YEAR(fecha_pedido) AS anio,
       MONTH(fecha_pedido) AS mes,
       CASE WHEN MONTH(fecha_pedido) BETWEEN 1 AND 3 THEN 1
            WHEN MONTH(fecha_pedido) BETWEEN 4 AND 6 THEN 2
            WHEN MONTH(fecha_pedido) BETWEEN 7 AND 9 THEN 3
            ELSE 4 END AS trimestre
FROM Pedido_Staging
GROUP BY fecha_pedido;
