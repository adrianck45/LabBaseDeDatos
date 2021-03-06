use [Ferreteria2]

/*1.- Select con Group By*/
SELECT nombre FROM PROVEEDOR GROUP BY nombre;

/*2.- Select (con al menos una columna) y 3 funciones agregadas*/

SELECT AVG(monto_pago) as Promedio_Pagos, SUM(monto_pago) as Suma_Pagos, MIN(monto_pago) as Min_Pagos FROM PAGO;

/*3.- Dos Select con WHERE*/
SELECT nombre FROM CLIENTES WHERE id_cliente = '1';
SELECT nombre FROM PROVEEDOR WHERE celular>'50';


/*4.- Tres Select con HAVING*/

SELECT id_folio, SUM(monto) as Montos_Folio1 FROM VENTAS GROUP BY id_folio HAVING SUM(monto) > 400
SELECT COUNT(telefono) as Promedio_Tel FROM PROVEEDOR GROUP BY telefono HAVING COUNT(telefono) > 0;
SELECT nombre, AVG(cant_disp) as Promedio_Inventario FROM PRODUCTOS GROUP BY nombre HAVING AVG(cant_disp) > 5

/*5.- Select con TOP*/

SELECT TOP 100 * FROM PRODUCTOS;
