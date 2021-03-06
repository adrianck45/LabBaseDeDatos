USE [master]
GO
/****** Object:  Database [ExtraordinarioV1]    Script Date: 14/12/2017 10:19:25 p. m. ******/
CREATE DATABASE [ExtraordinarioV1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExtraordinarioV1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\ExtraordinarioV1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExtraordinarioV1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\ExtraordinarioV1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExtraordinarioV1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExtraordinarioV1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExtraordinarioV1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExtraordinarioV1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExtraordinarioV1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExtraordinarioV1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExtraordinarioV1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExtraordinarioV1] SET  MULTI_USER 
GO
ALTER DATABASE [ExtraordinarioV1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExtraordinarioV1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExtraordinarioV1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExtraordinarioV1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExtraordinarioV1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExtraordinarioV1] SET QUERY_STORE = OFF
GO
USE [ExtraordinarioV1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExtraordinarioV1]
GO
/****** Object:  Table [dbo].[Detalle_Producto]    Script Date: 14/12/2017 10:19:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Producto](
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Precio_Producto] [money] NOT NULL,
	[Descripción_Producto] [varchar](250) NULL,
	[Cantidad_Disponible] [int] NULL,
 CONSTRAINT [PK_Detalle_Producto] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Ventas]    Script Date: 14/12/2017 10:19:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Ventas](
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Cantidad_Producto] [int] NOT NULL,
	[Precio_Unitario] [money] NOT NULL,
	[Total_Producto] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dir_Usuario]    Script Date: 14/12/2017 10:19:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dir_Usuario](
	[ID_Usuario] [uniqueidentifier] NOT NULL,
	[Calle] [varchar](100) NOT NULL,
	[Código_Postal] [varchar](10) NOT NULL,
	[Colonia] [varchar](150) NOT NULL,
	[Municipio] [varchar](100) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[País] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Entradas]    Script Date: 14/12/2017 10:19:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Entradas](
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Clientes]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Clientes](
	[ID_Cliente] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](75) NOT NULL,
	[Apellido_Materno] [varchar](75) NOT NULL,
	[Correo_Electrónico] [varchar](100) NOT NULL,
	[Teléfono] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tabla_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Empleados]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Empleados](
	[ID_Empleado] [uniqueidentifier] NOT NULL,
	[ID_Usuario] [uniqueidentifier] NOT NULL,
	[Nombre_Empleado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tabla_Empleados] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Usuarios]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Usuarios](
	[ID_Usuario] [uniqueidentifier] NOT NULL,
	[Nickname] [varchar](20) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Correo_Electrónico] [varchar](80) NOT NULL,
	[Teléfono] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Registro_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Ventas]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Ventas](
	[ID_Folio] [uniqueidentifier] NOT NULL,
	[ID_Cliente] [uniqueidentifier] NOT NULL,
	[ID_Empleado] [uniqueidentifier] NOT NULL,
	[Fecha_Venta] [date] NOT NULL,
	[Cantidad_Productos] [int] NULL,
	[Total_Venta] [money] NOT NULL,
 CONSTRAINT [PK_Registro_Ventas] PRIMARY KEY CLUSTERED 
(
	[ID_Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalle_Producto] ADD  CONSTRAINT [DF_Tabla_Producto_Nombre_Producto]  DEFAULT ('Sin Nombre') FOR [Nombre_Producto]
GO
ALTER TABLE [dbo].[Detalle_Producto] ADD  CONSTRAINT [DF_Tabla_Producto_Descripción_Producto]  DEFAULT ('Sin Descripción') FOR [Descripción_Producto]
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Ventas_Detalle_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Detalle_Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Detalle_Ventas] CHECK CONSTRAINT [FK_Detalle_Ventas_Detalle_Producto]
GO
ALTER TABLE [dbo].[Dir_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Dir_Usuario_Registro_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Registro_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Dir_Usuario] CHECK CONSTRAINT [FK_Dir_Usuario_Registro_Usuarios]
GO
ALTER TABLE [dbo].[Historial_Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Entradas_Detalle_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Detalle_Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Historial_Entradas] CHECK CONSTRAINT [FK_Historial_Entradas_Detalle_Producto]
GO
ALTER TABLE [dbo].[Info_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Info_Empleados_Registro_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Registro_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Info_Empleados] CHECK CONSTRAINT [FK_Info_Empleados_Registro_Usuarios]
GO
ALTER TABLE [dbo].[Registro_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Tabla_Ventas_Info_Empleados] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Info_Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Registro_Ventas] CHECK CONSTRAINT [FK_Tabla_Ventas_Info_Empleados]
GO
ALTER TABLE [dbo].[Registro_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Tabla_Ventas_Registro_Usuarios] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Registro_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Registro_Ventas] CHECK CONSTRAINT [FK_Tabla_Ventas_Registro_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Productos]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

CREATE PROCEDURE [dbo].[Agregar_Productos]
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
GO
/****** Object:  StoredProcedure [dbo].[Añadir_Al_Carrito]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

CREATE PROCEDURE [dbo].[Añadir_Al_Carrito]
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @producto),
@producto, 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto),
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto) * @cantidad
)
SELECT * FROM Detalle_Ventas
SELECT SUM(Total_Producto) AS TOTAL FROM Detalle_Ventas

GO
/****** Object:  StoredProcedure [dbo].[Cancelar_Compra]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END
*/

/*Ejemplo de compra
Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'
*/

/*Procedimiento para mostrar las ventas de hoy
CREATE PROCEDURE Mostrar_Ventas_Hoy
AS
SELECT * FROM Registro_Ventas WHERE Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
ORDER BY Fecha_Venta
*/

/*Mostrar ventas por empleado en una fecha determinada
CREATE PROCEDURE Mostrar_Ventas_Empleado
(
@ID_Empleado uniqueidentifier,
@Fecha date
)
AS
SELECT * FROM Registro_Ventas WHERE ID_Empleado = @ID_Empleado AND Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
*/

/*ELiminar USuario
CREATE PROCEDURE Eliminar_Usuario
(
@ID_Usuario uniqueidentifier
)
AS
DELETE FROM Registro_Usuarios WHERE ID_Usuario = @ID_Usuario
*/

/*Eliminar Producto
CREATE PROCEDURE Eliminar_Producto
(
@ID_Producto uniqueidentifier
)
AS
DELETE FROM Detalle_Producto WHERE ID_Producto = @ID_Producto
*/

/*Eliminar Empleado
CREATE PROCEDURE Eliminar_Empleado
(
@ID_Empleado uniqueidentifier
)
AS
DELETE FROM Info_Empleados WHERE ID_Empleado = @ID_Empleado
*/

/*Eliminar elemento del carrito
CREATE PROCEDURE Eliminar_Del_Carrito
(
@nombre_Producto varchar(50)
)
AS
DELETE FROM Detalle_Ventas WHERE Nombre_Producto = @nombre_Producto
*/

CREATE PROCEDURE [dbo].[Cancelar_Compra]
AS
DELETE FROM Detalle_Ventas
GO
/****** Object:  StoredProcedure [dbo].[Confirmar_Compra]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END

Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'*/

CREATE PROCEDURE [dbo].[Confirmar_Compra]
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas (ID_Folio, ID_Cliente, ID_Empleado, Fecha_Venta, Cantidad_Productos, Total_Venta) VALUES
(
NEWID(),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select count(ID_Producto) as Cantidad_Productos from Detalle_Ventas),
(select SUM(Total_Producto) as TOTAL from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Del_Carrito]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END
*/

/*Ejemplo de compra
Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'
*/

/*Procedimiento para mostrar las ventas de hoy
CREATE PROCEDURE Mostrar_Ventas_Hoy
AS
SELECT * FROM Registro_Ventas WHERE Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
ORDER BY Fecha_Venta
*/

/*Mostrar ventas por empleado en una fecha determinada
CREATE PROCEDURE Mostrar_Ventas_Empleado
(
@ID_Empleado uniqueidentifier,
@Fecha date
)
AS
SELECT * FROM Registro_Ventas WHERE ID_Empleado = @ID_Empleado AND Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
*/

/*ELiminar USuario
CREATE PROCEDURE Eliminar_Usuario
(
@ID_Usuario uniqueidentifier
)
AS
DELETE FROM Registro_Usuarios WHERE ID_Usuario = @ID_Usuario
*/

/*Eliminar Producto
CREATE PROCEDURE Eliminar_Producto
(
@ID_Producto uniqueidentifier
)
AS
DELETE FROM Detalle_Producto WHERE ID_Producto = @ID_Producto
*/

/*Eliminar Empleado
CREATE PROCEDURE Eliminar_Empleado
(
@ID_Empleado uniqueidentifier
)
AS
DELETE FROM Info_Empleados WHERE ID_Empleado = @ID_Empleado
*/

CREATE PROCEDURE [dbo].[Eliminar_Del_Carrito]
(
@nombre_Producto varchar(50)
)
AS
DELETE FROM Detalle_Ventas WHERE Nombre_Producto = @nombre_Producto
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Empleado]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END
*/

/*Ejemplo de compra
Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'
*/

/*Procedimiento para mostrar las ventas de hoy
CREATE PROCEDURE Mostrar_Ventas_Hoy
AS
SELECT * FROM Registro_Ventas WHERE Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
ORDER BY Fecha_Venta
*/

/*Mostrar ventas por empleado en una fecha determinada
CREATE PROCEDURE Mostrar_Ventas_Empleado
(
@ID_Empleado uniqueidentifier,
@Fecha date
)
AS
SELECT * FROM Registro_Ventas WHERE ID_Empleado = @ID_Empleado AND Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
*/

/*ELiminar USuario
CREATE PROCEDURE Eliminar_Usuario
(
@ID_Usuario uniqueidentifier
)
AS
DELETE FROM Registro_Usuarios WHERE ID_Usuario = @ID_Usuario
*/

/*Eliminar Producto
CREATE PROCEDURE Eliminar_Producto
(
@ID_Producto uniqueidentifier
)
AS
DELETE FROM Detalle_Producto WHERE ID_Producto = @ID_Producto
*/

CREATE PROCEDURE [dbo].[Eliminar_Empleado]
(
@ID_Empleado uniqueidentifier
)
AS
DELETE FROM Info_Empleados WHERE ID_Empleado = @ID_Empleado

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Producto]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END

Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'*/


/*ELiminar USuario
CREATE PROCEDURE Eliminar_Usuario
(
@ID_Usuario uniqueidentifier
)
AS
DELETE FROM Registro_Usuarios WHERE ID_Usuario = @ID_Usuario
*/

CREATE PROCEDURE [dbo].[Eliminar_Producto]
(
@ID_Producto uniqueidentifier
)
AS
DELETE FROM Detalle_Producto WHERE ID_Producto = @ID_Producto
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Usuario]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END

Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'*/

CREATE PROCEDURE [dbo].[Eliminar_Usuario]
(
@ID_Usuario uniqueidentifier
)
AS
DELETE FROM Registro_Usuarios WHERE ID_Usuario = @ID_Usuario
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Ventas_Empleado]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END
*/

/*Ejemplo de compra
Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'
*/

/*Procedimiento para mostrar las ventas de hoy
CREATE PROCEDURE Mostrar_Ventas_Hoy
AS
SELECT * FROM Registro_Ventas WHERE Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
ORDER BY Fecha_Venta
*/

CREATE PROCEDURE [dbo].[Mostrar_Ventas_Empleado]
(
@ID_Empleado uniqueidentifier,
@Fecha date
)
AS
SELECT * FROM Registro_Ventas WHERE (ID_Empleado = @ID_Empleado)
AND (Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE())))
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Ventas_Hoy]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

/*
CREATE PROCEDURE Nuevo_Producto
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Agregar una cantidad de producto
CREATE PROCEDURE Agregar_Productos
(
@nombre varchar(50),
@cantidad int
)
AS
INSERT INTO Historial_Entradas VALUES
(
(select ID_Producto from Detalle_Producto where Nombre_Producto = @nombre),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @nombre),
@cantidad
)
UPDATE Detalle_Producto SET Cantidad_Disponible = @cantidad + (select Cantidad_Disponible from Detalle_Producto where Nombre_Producto = @nombre) WHERE Nombre_Producto = @nombre
*/

/*Procedimiento para confirmar la compra
CREATE PROCEDURE Confirmar_Compra
(
@ID_cliente uniqueidentifier,
@ID_empleado uniqueidentifier
)
AS
INSERT INTO Registro_Ventas VALUES
(
(select ID_Folio from Detalle_Ventas),
@ID_cliente,
@ID_empleado,
GETDATE(),
(select SUM(Total_Producto) from Detalle_Ventas)
)
PRINT 'Compra realizada con éxito'
*/

/*Trigger para vaciar el carrito
CREATE TRIGGER Vaciar_Carrito
ON Registro_Ventas
AFTER INSERT
AS
BEGIN
DELETE FROM Detalle_Ventas
END
*/

/*Ejemplo de compra
Confirmar_Compra 'F8F82F26-BF88-4C4C-9C36-4BC18AD0A7F3', '78B26002-175D-4727-A7B7-16B28A26F87E'
*/

CREATE PROCEDURE [dbo].[Mostrar_Ventas_Hoy]
AS
SELECT * FROM Registro_Ventas WHERE Fecha_Venta >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
ORDER BY Fecha_Venta

GO
/****** Object:  StoredProcedure [dbo].[Nuevo_Producto]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

/*Crear un nuevo empleado
CREATE PROCEDURE Usuario_a_Empleado
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))
*/

/*Ejemplo de el registro de un empleado
Usuario_a_Empleado 'F7FCBDF8-82D2-4B58-A72A-6A3433491F25'
*/

/*Procedimiento para añadir items al carrito
CREATE PROCEDURE Añadir_Al_Carrito
(
@producto varchar(50),
@cantidad int
)
AS
INSERT INTO Detalle_Ventas VALUES
(
NEWID(),
(select Nombre_Producto from Detalle_Producto where Nombre_Producto = @producto), 
@cantidad,
(select Precio_Producto from Detalle_Producto where Nombre_Producto = @producto)
)
SELECT * FROM Detalle_Ventas
*/

CREATE PROCEDURE [dbo].[Nuevo_Producto]
(
@name varchar(50),
@description varchar(250),
@price money
)
AS
INSERT INTO Detalle_Producto VALUES (NEWID(), @name, @price, @description, 0)
PRINT 'Producto ' + @name + ' añadido correctamente'
GO
/****** Object:  StoredProcedure [dbo].[Registrar_Usuario]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios*/

CREATE PROCEDURE [dbo].[Registrar_Usuario]
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)

GO
/****** Object:  StoredProcedure [dbo].[Usuario_a_Empleado]    Script Date: 14/12/2017 10:19:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select ID_Usuario as IDUSUARIO from Registro_Usuarios;
Insert into Dir_Usuario values ((select ID_Usuario from Registro_Usuarios), 'Calle_Coco', '66461', 'Las Colonias', 'Nicolás', 'Libre', 'Japón');
Select * from Dir_Usuario;
*/

/*Procedimiento Almacenado para Registrar Usuarios

CREATE PROCEDURE Registrar_Usuario
(
@nickname varchar(20),
@password varchar(100),
@name varchar(50),
@papaname varchar(50),
@mamaname varchar(50),
@email varchar(80),
@phonenumber varchar(30),
@street varchar(100),
@postcode varchar(10),
@coloneishon varchar(150),
@city varchar(100),
@state varchar(50),
@country varchar(100)
)
AS
INSERT INTO Registro_Usuarios VALUES (NEWID(), @nickname, @password, @name, @papaname, @mamaname, @email, @phonenumber)
INSERT INTO Dir_Usuario VALUES ((select ID_Usuario from Registro_Usuarios where Nickname = @nickname AND Contraseña = @password), @street, @postcode, @coloneishon, @city, @state, @country)
*/

/*Poniendo el procedimiento a prueba
Registrar_Usuario 'FREDDO', 'freddie', 'Freddy', 'Fredden', 'Freddings', 'fredogodofredo@hotmail.com', '81180808080', 'FredStreet', '66430', 'Los Freds', 'Ciudad Fredingo', 'Fredington', 'Freddonia'
*/

/*Añadir por la fuerza nuevo producto
INSERT INTO Detalle_Producto VALUES (NEWID(), 'Martillo', 50.00, 'Es un estúpido martillo!!!', 1939);
*/

CREATE PROCEDURE [dbo].[Usuario_a_Empleado]
(
@idUsuarioEmpleado uniqueidentifier
)
AS
INSERT INTO Info_Empleados VALUES (NEWID(), (select ID_Usuario from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado), (select Nombre from Registro_Usuarios where ID_Usuario = @idUsuarioEmpleado))


GO
USE [master]
GO
ALTER DATABASE [ExtraordinarioV1] SET  READ_WRITE 
GO
