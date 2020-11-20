SET QUOTED_IDENTIFIER OFF;
GO
USE [StarTech];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Carrito__codigoP__44FF419A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carrito] DROP CONSTRAINT [FK__Carrito__codigoP__44FF419A];
GO
IF OBJECT_ID(N'[dbo].[FK__Carrito__idUsuar__45F365D3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carrito] DROP CONSTRAINT [FK__Carrito__idUsuar__45F365D3];
GO
IF OBJECT_ID(N'[dbo].[FK__Compra__codigoPr__412EB0B6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Compra] DROP CONSTRAINT [FK__Compra__codigoPr__412EB0B6];
GO
IF OBJECT_ID(N'[dbo].[FK__Compra__idUsuari__4222D4EF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Compra] DROP CONSTRAINT [FK__Compra__idUsuari__4222D4EF];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Carrito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carrito];
GO
IF OBJECT_ID(N'[dbo].[Compra]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Compra];
GO
IF OBJECT_ID(N'[dbo].[productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[productos];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Carrito'
CREATE TABLE [dbo].[Carrito] (
    [idCarrito] int IDENTITY(1,1) NOT NULL,
    [codigoProducto] varchar(8)  NULL,
    [idUsuario] int  NULL,
	[nombreProducto] varchar(40)  NULL,
    [cantidadDisponible] int  NULL,
    [precioProducto] bigint  NULL,
    [imagenUrl] varchar(max)  NULL
);
GO

-- Creating table 'Compra'
CREATE TABLE [dbo].[Compra] (
    [idCompra] int IDENTITY(1,1) NOT NULL,
    [codigoProducto] varchar(8)  NULL,
    [idUsuario] int  NULL
);
GO

-- Creating table 'productos'
CREATE TABLE [dbo].[productos] (
    [codigoProducto] varchar(8)  NOT NULL,
    [nombreProducto] varchar(40)  NULL,
    [cantidadDisponible] int  NULL,
    [precioProducto] bigint  NULL,
    [imagenUrl] varchar(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [idUsuario] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(45)  NOT NULL,
    [primerApellido] varchar(45)  NOT NULL,
    [segundoApelldo] varchar(45)  NOT NULL,
    [direccionEnvio] varchar(150)  NOT NULL,
    [correo] varchar(55)  NOT NULL,
    [contraseña] varchar(16)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idCarrito] in table 'Carrito'
ALTER TABLE [dbo].[Carrito]
ADD CONSTRAINT [PK_Carrito]
    PRIMARY KEY CLUSTERED ([idCarrito] ASC);
GO

-- Creating primary key on [idCompra] in table 'Compra'
ALTER TABLE [dbo].[Compra]
ADD CONSTRAINT [PK_Compra]
    PRIMARY KEY CLUSTERED ([idCompra] ASC);
GO

-- Creating primary key on [codigoProducto] in table 'productos'
ALTER TABLE [dbo].[productos]
ADD CONSTRAINT [PK_productos]
    PRIMARY KEY CLUSTERED ([codigoProducto] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [idUsuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([idUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [codigoProducto] in table 'Carrito'
ALTER TABLE [dbo].[Carrito]
ADD CONSTRAINT [FK__Carrito__codigoP__44FF419A]
    FOREIGN KEY ([codigoProducto])
    REFERENCES [dbo].[productos]
        ([codigoProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Carrito__codigoP__44FF419A'
CREATE INDEX [IX_FK__Carrito__codigoP__44FF419A]
ON [dbo].[Carrito]
    ([codigoProducto]);
GO

-- Creating foreign key on [idUsuario] in table 'Carrito'
ALTER TABLE [dbo].[Carrito]
ADD CONSTRAINT [FK__Carrito__idUsuar__45F365D3]
    FOREIGN KEY ([idUsuario])
    REFERENCES [dbo].[Usuario]
        ([idUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Carrito__idUsuar__45F365D3'
CREATE INDEX [IX_FK__Carrito__idUsuar__45F365D3]
ON [dbo].[Carrito]
    ([idUsuario]);
GO

-- Creating foreign key on [codigoProducto] in table 'Compra'
ALTER TABLE [dbo].[Compra]
ADD CONSTRAINT [FK__Compra__codigoPr__412EB0B6]
    FOREIGN KEY ([codigoProducto])
    REFERENCES [dbo].[productos]
        ([codigoProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Compra__codigoPr__412EB0B6'
CREATE INDEX [IX_FK__Compra__codigoPr__412EB0B6]
ON [dbo].[Compra]
    ([codigoProducto]);
GO

-- Creating foreign key on [idUsuario] in table 'Compra'
ALTER TABLE [dbo].[Compra]
ADD CONSTRAINT [FK__Compra__idUsuari__4222D4EF]
    FOREIGN KEY ([idUsuario])
    REFERENCES [dbo].[Usuario]
        ([idUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Compra__idUsuari__4222D4EF'
CREATE INDEX [IX_FK__Compra__idUsuari__4222D4EF]
ON [dbo].[Compra]
    ([idUsuario]);
GO

-- --------------------------------------------------
-- Procedimiento Almacenado
-- --------------------------------------------------
CREATE OR ALTER PROCEDURE ComprasProc
@identificacionUsuario AS int
AS
BEGIN
	INSERT INTO [dbo].Compra (compra.codigoProducto, compra.idUsuario)
	select top 1  productos.codigoProducto, Usuario.idUsuario from Carrito inner join Usuario on Carrito.idUsuario = Usuario.idUsuario
inner join productos on Carrito.codigoProducto = productos.codigoProducto where Usuario.idUsuario = @identificacionUsuario order by idCarrito desc, idUsuario desc, codigoProducto desc;

END
GO
------Inserts
use StarTech
go
insert into productos values
('CS-021','Case Aerocool EN52377',5, 95000, 'https://aerocool.io/wp-content/uploads/2019/04/Scar-Infographic700x700-01.jpg');

insert into productos values
('MR-045','Monitor Advance ADV',11, 195000,'https://http2.mlstatic.com/monitor-advance-adv-215ips-215-led-1920x1080-hdmi-audio-D_NQ_NP_705232-MPE32061388265_092019-F.jpg');

insert into productos values
('DS-055','Disco Duro Seagate',11, 154000,'https://www.cqnetcr.com/55557-large_default/hdd-seagate-barracuda-1tb-sata-64mb-35-7200rpm.jpg');

insert into productos values
('CS-046','Case Teros Orion',6, 110000, 'https://www.tiendastec.com.pe/wp-content/uploads/2018/09/Case-Gamer-Teros-Orion-Mid.jpg');

insert into productos values
('ME-101','Mouse Logitech MX Vertical',14, 47000,'https://http2.mlstatic.com/mouse-logitech-mx-vertical-ergonomico-avanzado-D_NQ_NP_743848-MCR41459629802_042020-F.jpg');

insert into productos values
('TD-112','Teclado Gaming X7 G800',24, 55000,'https://fragstore.kg/wp-content/uploads/2020/03/3411094-1-427x546.jpg');

insert into productos values
('MR-013','Monitor Asus',3, 165000,'https://www.asus.com/media/global/products/Aj81cY8cuqFif4dg/P_setting_fff_1_90_end_500.png');

insert into productos values
('PR-103','Procesador ECS Bat J1800',7, 115000,'https://censolonline.com/wp-content/uploads/2015/09/ECS-J1800.jpg');

go
insert into usuario values ('Luis','Barquero','Villalobos',
'Escazu, Frente al Centro Comercial Trejos Montealegre',
'pruebas@gmail.com', '123456');

insert into Carrito values
('PR-103',2,'Procesador ECS Bat J1800',7, 115000,'https://censolonline.com/wp-content/uploads/2015/09/ECS-J1800.jpg');

