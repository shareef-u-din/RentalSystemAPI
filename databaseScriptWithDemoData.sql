USE [master]
GO
/****** Object:  Database [RentalSystem]    Script Date: 12/27/2018 6:08:19 PM ******/
CREATE DATABASE [RentalSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentalSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentalSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentalSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentalSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentalSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentalSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentalSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentalSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentalSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentalSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentalSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentalSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentalSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentalSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentalSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentalSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentalSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentalSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentalSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentalSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentalSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentalSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentalSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentalSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentalSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentalSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentalSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentalSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentalSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentalSystem] SET  MULTI_USER 
GO
ALTER DATABASE [RentalSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentalSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentalSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentalSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentalSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentalSystem] SET QUERY_STORE = OFF
GO
USE [RentalSystem]
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
USE [RentalSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/27/2018 6:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Name] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Description] [varchar](150) NULL,
	[Image1] [varchar](150) NULL,
	[Image2] [varchar](150) NULL,
	[Image3] [varchar](150) NULL,
	[Availability] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentProducts]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TotalCost] [float] NOT NULL,
	[UnitCost] [float] NOT NULL,
	[Payment] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_RentProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserLogins_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NULL,
	[Age] [int] NULL,
	[Address] [varchar](150) NULL,
	[PaymentId] [int] NULL,
	[Valid] [bit] NULL,
	[Photo] [varchar](150) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'ELECTRONICS', 1)
INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'FURNITURE', 2)
INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'CARS', 3)
INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'HOME', 4)
INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'APARTMENTS', 5)
INSERT [dbo].[Category] ([Name], [Id]) VALUES (N'PG', 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (3, 10, N'shareef', 200, N'fjkdjjkn', N'ebb8feba-a94d-4a42-9376-b1c861fdc8c41fa45-02-bmw.png', N'b072b817-f827-4c30-adf0-15cb0e7af9e6aaa-luxury-rent-car-ferrari-488-gtb-5.png', N'41aa0087-5ce1-4e7c-a9aa-0c99053e12dbcar-where-you-are-jnb-cpt-2-feature.jpg', 1, CAST(N'2018-12-05T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (12, 10, N'Dell PC', 345, N'fghjkljk;l', N'd7b1120f-ebc4-43c1-92a2-eebbdadc7e134b476acd-b1e2-42bf-9ef3-e07ca044ba4bfdfjh.jpg', N'', N'', 1, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (13, 10, N'Honda', 2500, N'Rent it now!', N'984e5080-120d-4bd2-a5f2-42feb34603a8fb1b1a2d-d329-4d3c-8f22-5a8aacac8174i4.jpg', N'', N'', 1, CAST(N'2018-12-11T00:00:00.000' AS DateTime), CAST(N'2019-01-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (14, 10, N'Honda', 2500, N'Rent it now!', N'984e5080-120d-4bd2-a5f2-42feb34603a8fb1b1a2d-d329-4d3c-8f22-5a8aacac8174i4.jpg', N'', N'', 1, CAST(N'2018-12-20T00:00:00.000' AS DateTime), CAST(N'2018-12-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (15, 10, N'Honda', 2500, N'Rent it now!', N'984e5080-120d-4bd2-a5f2-42feb34603a8fb1b1a2d-d329-4d3c-8f22-5a8aacac8174i4.jpg', N'', N'', 0, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2019-02-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (16, 10, N'Dell PC', 345, N'fghjkljk;l', N'47eacddf-c10d-4d15-b711-2f7cc3fd05762d546799-2b4d-4010-bd17-60ea5340ce77am3.jpeg', N'', N'', 0, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (17, 10, N'Dell PC', 345, N'fghjkljk;l', N'95dafbb0-03ad-4d6d-9a33-de4d945a85eaaaa-luxury-rent-car-ferrari-488-gtb-5.png', N'', N'', 1, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (18, 10, N'Dell PC', 345, N'fghjkljk;l', N'47eacddf-c10d-4d15-b711-2f7cc3fd05762d546799-2b4d-4010-bd17-60ea5340ce77am3.jpeg', N'', N'', 0, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (19, 10, N'Ferrari ES', 44533, N'Best Price, Rent it Now!', N'b0f90d0e-0111-4165-83f6-df06953474bfferrari-spyder-rouge-8_0.jpg', N'7eaab76a-ed8b-42fa-8514-b1923b2b2832maruti-a-star-small-hatchback-cars-rentals-in-goa-featured-960x550.jpg', N'7eaab76a-ed8b-42fa-8514-b1923b2b2832maruti-a-star-small-hatchback-cars-rentals-in-goa-featured-960x550.jpg', 1, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2019-01-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (20, 10, N'Ferrari MS', 8787, N'Rent it Now!!!', N'95dafbb0-03ad-4d6d-9a33-de4d945a85eaaaa-luxury-rent-car-ferrari-488-gtb-5.png', N'24c49dd7-d67d-4162-b1d2-18b401ea681cferrari-spyder-rouge-8_0.jpg', N'24c49dd7-d67d-4162-b1d2-18b401ea681cferrari-spyder-rouge-8_0.jpg', 1, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (21, 10, N'Buggati', 7677, N'Shareef''s car', N'fb84c6bf-7bdd-4776-80c7-39da2006889dcar-where-you-are-jnb-cpt-2-feature.jpg', N'b1559ca6-4c17-4bf2-b071-b23c356226c4ec416-03-huydai.png', N'd901d4e0-84e3-4c40-82e9-0dc3b8914fdbmaruti-a-star-small-hatchback-cars-rentals-in-goa-featured-960x550.jpg', 1, CAST(N'2018-12-27T00:00:00.000' AS DateTime), CAST(N'2018-12-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (22, 10, N'Swift DZire', 879, N'Best Price, Rent it Now!!!', N'3f355f09-82bb-480a-b1b2-a2a196603c81car-where-you-are-jnb-cpt-2-feature.jpg', N'2cfc442f-6aee-4d76-8d83-787ce180c429ec416-03-huydai.png', N'727e00cd-0f94-4110-8196-e7fcf6f017b9maruti-a-star-small-hatchback-cars-rentals-in-goa-featured-960x550.jpg', 0, CAST(N'2018-12-21T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (23, 10, N'Sai Sucasa', 250, N'Rent It Now!!!', N'c2ac0bdb-aefd-40a0-9b49-11f240af31dfkettler-dev-cc.jpg', N'09060832-884a-4d43-acbd-b4150636bd01fafc7c94-8469-4c86-af46-fc4546a4be61i3.jpg', N'c44bff23-6661-4341-bb12-ea83a0a313eddf5447b9-9118-4049-8f19-ab2b3bd0f04ei2.jpg', 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (24, 10, N'Buggati', 6545, N'Rent it Now!', N'bef51097-32a5-42e6-830e-35547fabe8981fa45-02-bmw.png', N'', N'', 0, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (25, 10, N'Ferrari DX', 4345, N'Rent it Now!', N'c36b4c9c-d789-4f7c-b37b-83a206c97a25ferrari-spyder-rouge-8_0.jpg', N'', N'', 0, CAST(N'2018-12-10T00:00:00.000' AS DateTime), CAST(N'2019-02-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Products] ([Id], [VendorId], [Name], [UnitPrice], [Description], [Image1], [Image2], [Image3], [Availability], [StartDate], [EndDate], [CategoryId]) VALUES (26, 10, N'Honda', 543, N'Rent it now!', N'b09bb1e3-dcef-4cc7-8d89-0234a09f794fec416-03-huydai.png', N'', N'', 0, CAST(N'2018-12-10T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RentProducts] ON 

INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (18, 10, N'shareefudin@gmail.com', 24, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2019-01-30T00:00:00.000' AS DateTime), 322323, 6545, 1, 1, 3)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (19, 10, N'shareefudin@gmail.com', 24, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), 65432, 6545, 1, 1, 3)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (23, 10, N'shareefudin@gmail.com', 25, CAST(N'2018-12-10T00:00:00.000' AS DateTime), CAST(N'2018-12-23T00:00:00.000' AS DateTime), 56485, 4345, 1, 0, 3)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (24, 10, N'shareefudin@gmail.com', 16, CAST(N'2018-12-02T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 9315, 345, 1, 1, 1)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (28, 10, N'shareefudin@gmail.com', 26, CAST(N'2018-12-10T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 10317, 543, 1, 1, 3)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (31, 10, N'shareefudin@gmail.com', 15, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2019-01-26T00:00:00.000' AS DateTime), 112500, 2500, 1, 1, 3)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (33, 10, N'shareefudin@gmail.com', 18, CAST(N'2018-12-07T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 7590, 345, 1, 1, 1)
INSERT [dbo].[RentProducts] ([Id], [VendorId], [Email], [ProductId], [StartDate], [EndDate], [TotalCost], [UnitCost], [Payment], [Status], [CategoryId]) VALUES (34, 10, N'shareefudin@gmail.com', 22, CAST(N'2018-12-21T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), 7032, 879, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[RentProducts] OFF
SET IDENTITY_INSERT [dbo].[UserLogins] ON 

INSERT [dbo].[UserLogins] ([Id], [Email], [Password], [RoleId]) VALUES (1, N'shareefudin@gmail.com', N'123456', 3)
INSERT [dbo].[UserLogins] ([Id], [Email], [Password], [RoleId]) VALUES (22, N'fusis@gmail.com', N'123456', 1)
INSERT [dbo].[UserLogins] ([Id], [Email], [Password], [RoleId]) VALUES (23, N'vendor@gmail.com', N'123456', 2)
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (2, N'Vendor')
INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Contact], [Age], [Address], [PaymentId], [Valid], [Photo]) VALUES (3, N'Shareef', N'shareefudin@gmail.com', N'8383234567', 23, N'jhsd', 1456789, 1, N'35158bbb-a402-4bdd-9b75-5d213cefd482product3.jpg')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Contact], [Age], [Address], [PaymentId], [Valid], [Photo]) VALUES (9, N'Fusis', N'fusis@gmail.com', N'8383234567', 22, N'Panzinara HMT Srinagar', 56789089, 1, N'773d60f5-7b84-4288-8754-be3a54628e4fproduct1.jpg')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Contact], [Age], [Address], [PaymentId], [Valid], [Photo]) VALUES (10, N'vendor', N'vendor@gmail.com', N'8491975070', 22, N'Panzinara HMT Srinagar', 765432, 1, N'f61f034c-40ee-489f-9e3e-3471974ce23aproduct3.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Category]    Script Date: 12/27/2018 6:08:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Category] ON [dbo].[Products]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_UserLogins_Email_RoleId]    Script Date: 12/27/2018 6:08:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_UserLogins_Email_RoleId] ON [dbo].[UserLogins]
(
	[Email] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_Users_Email]    Script Date: 12/27/2018 6:08:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[RentProducts]  WITH CHECK ADD  CONSTRAINT [FK_RentProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[RentProducts] CHECK CONSTRAINT [FK_RentProducts_Products]
GO
ALTER TABLE [dbo].[RentProducts]  WITH CHECK ADD  CONSTRAINT [FK_RentProducts_UserId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RentProducts] CHECK CONSTRAINT [FK_RentProducts_UserId]
GO
ALTER TABLE [dbo].[RentProducts]  WITH CHECK ADD  CONSTRAINT [FK_RentProducts_Users] FOREIGN KEY([Email])
REFERENCES [dbo].[Users] ([Email])
GO
ALTER TABLE [dbo].[RentProducts] CHECK CONSTRAINT [FK_RentProducts_Users]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_UserRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_UserRoles]
GO
/****** Object:  StoredProcedure [dbo].[spAddProduct]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[spAddProduct]
@VendorId INT,
 @Name VARCHAR(50),
  @UnitPrice FLOAT, 
  @Description VARCHAR(150), 
  @Image1	VARCHAR(150),
   @Image2 VARCHAR(150), 
   @Image3 VARCHAR(150), 
   @Availability BIT, 
   @StartDate DATETIME, 
   @EndDate DATETIME, 
   @CategoryId INT
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Products(VendorId, [Name], UnitPrice, [Description], Image1, Image2, Image3, [Availability], StartDate, EndDate, CategoryId)
	VALUES(@VendorId,@Name,@UnitPrice,@Description,@Image1,@Image2,@Image3,@Availability,@StartDate,@EndDate,@CategoryId)
END
GO
/****** Object:  StoredProcedure [dbo].[spApprove]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[spApprove]
@Id INT,
@Result INT OUT
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	    BEGIN TRANSACTION;
        SAVE TRANSACTION MySavePoint;
			 BEGIN TRY
			UPDATE RentProducts SET [Status]='True' WHERE Id=@Id
			DECLARE @PId INT
			DECLARE @date1 DATETIME
			DECLARE @date2 DATETIME
			SELECT @PId=ProductId, @date1=StartDate,@date2=EndDate FROM RentProducts WHERE Id=@Id
			IF(@PId <> 0)
			 BEGIN
				UPDATE Products SET [Availability]='False' WHERE Id=@PId

			DELETE FROM RentProducts  WHERE ((StartDate  BETWEEN  @date1 AND  @date2) OR (EndDate  BETWEEN  @date1 AND  @date2)) AND ProductId=@PId AND [Status]='False'
		    SET @Result = 1
			 END
		    ELSE
			 BEGIN
				SET @Result = 0
			 END
			
		    END TRY
			 BEGIN CATCH
				IF @@TRANCOUNT > 0
				BEGIN
				    SET @Result = -1
					ROLLBACK TRANSACTION MySavePoint; -- rollback to MySavePoint
				END
			END CATCH
	 COMMIT TRANSACTION 
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckDate]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spCheckDate]
@value INT,
 @productId VARCHAR(50),
  @date DateTime
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@value = 1)
		BEGIN
			SELECT Id from RentProducts Where ProductId=@productId AND StartDate > @date
		END
		else
		BEGIN
			SELECT Id from RentProducts Where ProductId=@productId AND EndDate < @date
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAvailableProducts]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spGetAllAvailableProducts]
 
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from Products 
	WHERE Availability='true' order by Id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCustomers]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







Create PROCEDURE [dbo].[spGetAllCustomers]

   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select Users.Id, Name, Users.Email, Contact, Age, Address, PaymentId, Valid, Photo from Users
	inner join UserLogins
	on Users.Email=UserLogins.Email
	AND UserLogins.RoleId=3
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllVendors]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[spGetAllVendors]

   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select Users.Id, Name, Users.Email, Contact, Age, Address, PaymentId, Valid, Photo from Users
	inner join UserLogins
	on Users.Email=UserLogins.Email
	AND UserLogins.RoleId=2
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [dbo].[spLogin]
@Email varchar(50),
@Password varchar(150),
@RoleId INT,
@Result INT OUT,
@Image varchar(150) OUT
As
Begin
 SET NOCOUNT ON
SET @Result=0
	IF EXISTS( SELECT * FROM UserLogins WHERE Email=@Email AND RoleId=@RoleId)
	BEGIN
	IF(@RoleId=2)
		BEGIN
			DECLARE @date DATETIME
			DECLARE @Role INT
			SET @date=GETDATE()
			UPDATE RentProducts SET [Status]='False' WHERE EndDate < @date AND [Status]='True'
		END
	SELECT @Result=Id,@Image=Photo FROM Users WHERE Email=@Email
	SELECT Id  FROM UserLogins WHERE Email = @Email AND [Password]=@Password

	END
	ELSE
	BEGIN 
	set @Result=-1
	END
End
GO
/****** Object:  StoredProcedure [dbo].[spRegistration]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[spRegistration]
@Email varchar(50),
@Password varchar(150),
@RoleId int,
@Result int OUTPUT
As
Begin
IF EXISTS(SELECT Email FROM UserLogins WHERE Email = @Email)
Begin
Set @Result = 1
Return;
End
Else
Begin
Insert into UserLogins(Email,[Password],RoleId) 
VALUES(@Email,@Password,@RoleId)

Insert into Users(Email,Valid) 
VALUES(@Email,'True')

Set @Result = 0
Return;
End
End
GO
/****** Object:  StoredProcedure [dbo].[spRentProduct]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[spRentProduct]
@VendorId INT,
@ProductId INT,
 @Email VARCHAR(50),
  @UnitCost FLOAT, 
  @TotalCost FLOAT,
   @Payment BIT, 
   @Status BIT, 
   @StartDate DATETIME, 
   @EndDate DATETIME, 
   @CategoryId INT
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO RentProducts(VendorId, Email, ProductId, StartDate, EndDate, TotalCost, UnitCost, Payment, [Status],CategoryId)
	VALUES(@VendorId,@Email,@ProductId,@StartDate,@EndDate,@TotalCost,@UnitCost,@Payment,'False',@CategoryId)

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProduct]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spUpdateProduct]
@Id INT,
@VendorId INT,
 @Name VARCHAR(50),
  @UnitPrice FLOAT, 
  @Description VARCHAR(150), 
  @Image1	VARCHAR(150),
   @Image2 VARCHAR(150), 
   @Image3 VARCHAR(150), 
   @Availability BIT, 
   @StartDate DATETIME, 
   @EndDate DATETIME, 
   @CategoryId INT
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Products Set VendorId=@VendorId, [Name]=@Name, UnitPrice=@UnitPrice, [Description]=@Description, Image1=@Image1, Image2=@Image2,
	 Image3=@Image3, [Availability]=@Availability, StartDate=@StartDate, EndDate=@EndDate, CategoryId=@CategoryId WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUser]    Script Date: 12/27/2018 6:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[spUpdateUser]
@Id INT,
 @Name VARCHAR(50),
  @Email VARCHAR(50), 
  @Contact	VARCHAR(50),
   @Age INT, 
   @Address VARCHAR(150), 
   @Payment INT, 
   @Photo VARCHAR(150),
   @Result INT OUT
   AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @user INT
	SELECT @user=COUNT(Email) FROM UserLogins WHERE Email=@Email  AND Id=@Id
	IF (@user > 0)
    BEGIN
		


		IF EXISTS (SELECT * FROM Users WHERE Email=@Email)
			BEGIN
				IF (@Photo IS NULL OR @Photo='')
					BEGIN
						UPDATE Users SET [Name]=@Name,Contact=@Contact,Age=@Age,PaymentId=@Payment,[Address]=@Address
						WHERE Email = @Email
					END
				ELSE
					BEGIN
						UPDATE Users SET [Name]=@Name,Contact=@Contact,Age=@Age,PaymentId=@Payment,Photo=@Photo,[Address]=@Address
						WHERE Email = @Email
					END
			END
	   ELSE
		BEGIN
			INSERT INTO Users([Name],Email,Contact,Age,[Address],PaymentId, Photo,Valid) 
				VALUES (@Name,@Email,@Contact,@Age,@Address,@Payment,@Photo,1)
		END

        SET @Result=1
	END
	ELSE
	BEGIN
		SET @Result=0
    END
	
END
GO
USE [master]
GO
ALTER DATABASE [RentalSystem] SET  READ_WRITE 
GO
