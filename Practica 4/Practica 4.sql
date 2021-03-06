/****** Script for SelectTopNRows command from SSMS  ******/
USE [Ferreteria2.2];

Select * From PROVEEDOR
Select * From CLIENTES

/*INSERT 1*/
INSERT into PROVEEDOR(id_provedor,nombre,direccion,telefono,celular) values (NEWID(),'Cinépolis','Pablo Livas',83,81) 
INSERT into PROVEEDOR(id_provedor,nombre,direccion,telefono,celular) values (NEWID(),'LOWES','Eloy Cavazos',93,71) 

/*INSERT 2*/
INSERT into PROVEEDOR values (NEWID(),'Microsoft','California',66,99)
INSERT into CLIENTES values (NEWID(),'Adrián','Alejandro','Pérez','San Nicolás',33,6,'aapb98@outlook.com','123123')

/*INSERT 3*/
INSERT into PROVEEDOR select NEWID(),'Apple','California',33,45
/*INSERT 4*/
select * from PROVEEDOR 
select * from CLIENTES

INSERT into PROVEEDOR select NEWID(),'Apple','California',33,45 from CLIENTES

/*Tabla temporal*/
select * into #PROVEEDORTemp from PROVEEDOR
select * from #PROVEEDORTemp

/*Update*/
update PROVEEDOR SET nombre = 'ProveedorPrueba'
from PROVEEDOR
WHERE direccion LIKE '%zos'  

select * from PROVEEDOR

/*Delete*/
DELETE FROM PROVEEDOR WHERE direccion not like 'Pablo%'
