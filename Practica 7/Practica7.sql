USE [Ferreteria2]
GO

/*Crear una función*/

CREATE FUNCTION Total (@Subtotal float)
returns float   
as
begin
return @Subtotal *1.15
end
GO
select dbo.Total (500) as Total
GO


/*5 Procedimientos almacenados*/
CREATE PROCEDURE Procedimiento_1
as 
begin
SELECT v.id_folio ,v.monto, v.Fecha_Hora ,e.nombre + ' ' + e.apellidoP as 'Nombre_Empleado', p.tipo as 'Pago'  
FROM VENTAS as v
RIGHT JOIN EMPLEADO as e on e.id_empleado = v.id_empleado
RIGHT JOIN PAGO as p on p.id_pago = v.id_pago
end

exec Procedimiento_1
GO

/*2*/
CREATE PROCEDURE Procedimiento_2
as
begin
SELECT c.nombre + ' ' + c.apellidoP + ' ' + apellidoM AS Cliente , (f.fecha_factura) , f.id_factura , c.id_cliente,f.folio
FROM CLIENTES as c
INNER JOIN FACTURAS as f on f.id_factura = c.id_cliente
GROUP BY c.id_cliente,f.fecha_factura, c.nombre + ' ' + c.apellidoP + ' ' + apellidoM, f.id_factura,f.folio
end

exec Procedimiento_2
GO

/*3*/
CREATE PROCEDURE Procedimiento_3
@NombreProducto varchar(50)
as
begin
SELECT e.id_entrada, e.id_producto, p.nombre, pr.nombre
FROM ENTRADAS as e 
LEFT JOIN PRODUCTOS as p on p.id_producto = e.id_producto
LEFT JOIN PROVEEDOR as pr on pr.id_provedor = e.id_provedor 
where p.nombre = @NombreProducto
end

exec Procedimiento_3 'Martillo'
GO

/*4*/
CREATE PROCEDURE Procedimiento_4
@Proveedor int
as
begin
SELECT prov.nombre, p.id_producto, p.nombre,max (p.cant_disp) as 'Cantidad Producto'
FROM PRODUCTOS as p
INNER JOIN PROVEEDOR as prov on p.id_provedor = prov.id_provedor
where prov.id_provedor = @Proveedor
GROUP BY prov.nombre, p.id_producto, p.nombre
end

exec Procedimiento_4 1
GO

/*5*/
CREATE PROCEDURE Procedimiento_5
as
begin
SELECT COUNT(dv.id_producto) as 'TiposDeProductos' , SUM(dv.cantidad) as 'CantidadDeProductos', COUNT(v.id_folio) as 'Total de ventas' ,SUM (v.monto) as 'TotalVendido', MAX(v.Fecha_Hora) as 'Ultima  Venta'
FROM DETALLE_VENTA as dv
LEFT JOIN VENTAS as v on v.id_folio= dv.id_folio
end

exec Procedimiento_5
GO


/*Crear un trigger tipo After*/
create trigger trigger_After
on CLIENTES
after update
as begin 
select*from Clientes as TablaClientesActualizada
end 
GO


/*Crear un trigger tipo Instead*/
create trigger trigger_Instead
on PRODUCTOS
instead of INSERT 
as begin
select* from PRODUCTOS
end
