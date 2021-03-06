USE [sanguchote]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 23-11-2017 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[fecha_compra] [date] NULL,
	[total_pago] [int] NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 23-11-2017 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[id_compra] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23-11-2017 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](255) NULL,
	[stock] [int] NULL,
	[url_imagen] [varchar](255) NULL,
	[precio] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23-11-2017 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[user_] [varchar](255) NULL,
	[pass_] [varchar](255) NULL,
	[nombres] [varchar](255) NULL,
	[apellidos] [varchar](255) NULL,
	[tipo_usuario] [varchar](255) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Usuarios]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Compras] FOREIGN KEY([id_compra])
REFERENCES [dbo].[Compras] ([id_compra])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Compras]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Productos]
GO
--**************************************************************************
Insert INTO [sanguchote].[dbo].[Usuarios] VALUES('jora','1234','Jorge','Reyes','Administrador');
Insert INTO [sanguchote].[dbo].[Usuarios] VALUES('curin','1234','Francisco','Curin','Cliente');

Insert INTO [sanguchote].[dbo].[Productos] VALUES('Completo Normal',100,'http://mouse.latercera.com/wp-content/uploads/2017/05/completos.jpg',1100);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Churrasco',100,'http://www.radioactiva.cl/wp-content/uploads/2016/07/churrasco.jpg',1800);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Barros Luco',100,'https://cleanpress.files.wordpress.com/2011/08/barros-luco2.jpg',2100);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Chorrillana',100,'http://docetrece.cl/wp-content/uploads/2014/12/chorrillana1.png',3400);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Lata Coca Zero ',200,'http://d26lpennugtm8s.cloudfront.net/stores/111/075/products/coca-cola-zero-lata21-f58ca4cfd6497f6d5614787999012214-640-0.jpg',800);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Lata Sprite Zero',200,'https://www.hipercor.es/sgfm/SGFM/00/28/1/0118619700281/0118619700281000g01011.jpg',800);
Insert INTO [sanguchote].[dbo].[Productos] VALUES('Lata Fanta Normal',200,'https://d26lpennugtm8s.cloudfront.net/stores/111/075/products/lata-fanta1-e8676c17ba3d25cc2a14787993903249-1024-1024.jpg',800);




