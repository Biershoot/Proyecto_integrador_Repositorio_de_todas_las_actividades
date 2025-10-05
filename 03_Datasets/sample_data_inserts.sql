
USE Jardineria;

INSERT INTO Clientes (CodigoCliente, NombreCliente, Pais, Ciudad) VALUES
(1,'Juan Perez','Colombia','Bogota'),
(2,'Maria Gomez','Colombia','Medellin'),
(3,'Carlos Ruiz','Colombia','Cali');

INSERT INTO Productos (CodigoProducto, Nombre, Gama, PrecioVenta) VALUES
(10,'Planta Ficus','Plantas',25000.00),
(11,'Maceta Ceramica','Accesorios',12000.00),
(12,'Abono Universal','Insumos',8000.00);

INSERT INTO Empleados (CodigoEmpleado, NombreEmpleado, Oficina) VALUES
(100,'Ana Lopez','Sucursal Norte'),
(101,'Diego Martinez','Sucursal Sur');

INSERT INTO Pedidos (CodigoPedido, CodigoCliente, CodigoEmpleado, FechaPedido) VALUES
(1000,1,100,'2025-01-05'),
(1001,2,101,'2025-02-10'),
(1002,1,100,'2025-03-12');

INSERT INTO DetallePedidos (CodigoPedido, CodigoProducto, Cantidad, PrecioUnidad) VALUES
(1000,10,2,25000.00),
(1000,11,1,12000.00),
(1001,12,5,8000.00),
(1002,10,1,25000.00),
(1002,12,2,8000.00);
