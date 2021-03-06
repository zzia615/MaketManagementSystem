USE [master]
GO
/****** Object:  Database [SaleManagerDB]    Script Date: 12/2/2016 3:47:29 PM ******/
CREATE DATABASE [SaleManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleManagerDB_Data', FILENAME = N'....\SaleManager\SaleManagerDB_Data.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaleManagerDB_Log', FILENAME = N'....SaleManager\SaleManagerDB_Log.ldf' , SIZE = 4096KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [SaleManagerDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleManagerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaleManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleManagerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleManagerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SaleManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [SaleManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaleManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaleManagerDB', N'ON'
GO
ALTER DATABASE [SaleManagerDB] SET QUERY_STORE = OFF
GO
USE [SaleManagerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SaleManagerDB]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [numeric](8, 2) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Discount] [int] NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InventoryStatus]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryStatus](
	[StatusId] [int] NOT NULL,
	[StatusDescription] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[ProductId] [nvarchar](50) NOT NULL,
	[TotalCount] [int] NOT NULL,
	[MinCount] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_QueryInventoryInfo]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[view_QueryInventoryInfo]
as
	select Products.ProductId,ProductName,ProductUnit.UnitId,UnitName,UnitPrice,Discount,TotalCount,MaxCount,MinCount,ProductInventory.StatusId,StatusDescription,Products.CategoryId,CategoryName 
	from Products
	inner join ProductUnit on ProductUnit.UnitId = Products.UnitId
	inner join ProductCategory on ProductCategory.CategoryId = Products.CategoryId
	inner join ProductInventory on ProductInventory.ProductId = Products.ProductId
	inner join InventoryStatus on InventoryStatus.StatusId = ProductInventory.StatusId

GO
/****** Object:  View [dbo].[view_QueryWarningInfo]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[view_QueryWarningInfo]
as
			select Products.ProductId,ProductName,ProductUnit.UnitName,TotalCount,MaxCount,MinCount,InventoryStatus.StatusId,StatusDescription from Products
			inner join ProductUnit on Products.UnitId=ProductUnit.UnitId
			inner join ProductInventory on Products.ProductId=ProductInventory.ProductId
			inner join InventoryStatus on InventoryStatus.StatusId=ProductInventory.StatusId

GO
/****** Object:  Table [dbo].[LoginLogs]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLogs](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [int] NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[ServerName] [nvarchar](100) NOT NULL,
	[LoginTime] [datetime] NULL,
	[ExitTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductStorage]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStorage](
	[StorageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [nvarchar](50) NULL,
	[AddedCount] [int] NOT NULL,
	[StorageTime] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesList]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesList](
	[SerialNumber] [nvarchar](50) NOT NULL,
	[TotalMoney] [numeric](10, 2) NOT NULL,
	[RealReceive] [numeric](10, 2) NOT NULL,
	[ReturnMone] [numeric](10, 2) NOT NULL,
	[SalesPersonId] [int] NOT NULL,
	[CreateTime] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesListDetail]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesListDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[ProductId] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Discount] [int] NULL,
	[Quantity] [int] NOT NULL,
	[SubTotalMoney] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[SalesPersonId] [int] IDENTITY(10000,1) NOT NULL,
	[SalesPersonName] [nvarchar](50) NOT NULL,
	[LoginPassword] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysAdmins]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysAdmins](
	[LoginId] [int] IDENTITY(20000,1) NOT NULL,
	[LoginPassword] [nvarchar](100) NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminStatus] [bit] NOT NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VIPMembers]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIPMembers](
	[MemberId] [int] IDENTITY(100200300,1) NOT NULL,
	[MemberName] [nvarchar](50) NOT NULL,
	[Points] [int] NOT NULL,
	[PhoneNumber] [nvarchar](200) NOT NULL,
	[Address] [text] NOT NULL,
	[OpenTime] [datetime] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[InventoryStatus] ([StatusId], [StatusDescription]) VALUES (-1, N'低于库存')
INSERT [dbo].[InventoryStatus] ([StatusId], [StatusDescription]) VALUES (0, N'正常')
INSERT [dbo].[InventoryStatus] ([StatusId], [StatusDescription]) VALUES (1, N'高于库存')
INSERT [dbo].[InventoryStatus] ([StatusId], [StatusDescription]) VALUES (2, N'已清仓')
SET IDENTITY_INSERT [dbo].[LoginLogs] ON 

INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (1, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:00:41.853' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (2, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:29:16.030' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (3, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:36:31.477' AS DateTime), CAST(N'2016-11-26T21:36:33.150' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (4, 20002, N'刘丽娜', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:37:20.597' AS DateTime), CAST(N'2016-11-26T21:37:57.213' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (5, 20002, N'刘丽娜', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:39:12.593' AS DateTime), CAST(N'2016-11-26T21:40:24.490' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (6, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:54:59.603' AS DateTime), CAST(N'2016-11-26T21:55:06.810' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (7, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:56:19.703' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (8, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:57:22.280' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (9, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:58:09.210' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (10, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T21:59:11.693' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (11, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T23:56:19.723' AS DateTime), CAST(N'2016-11-26T23:56:41.587' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (12, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T23:57:12.500' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (13, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-26T23:59:13.303' AS DateTime), CAST(N'2016-11-27T00:03:11.367' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (14, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T00:03:17.173' AS DateTime), CAST(N'2016-11-27T00:05:48.697' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (15, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T00:05:54.133' AS DateTime), CAST(N'2016-11-27T00:07:08.620' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (16, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T00:07:15.983' AS DateTime), CAST(N'2016-11-27T00:09:00.133' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (17, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T00:09:49.667' AS DateTime), CAST(N'2016-11-27T00:15:21.827' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (18, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T00:19:20.730' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (19, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:17:00.897' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (20, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:18:28.053' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (21, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:20:08.777' AS DateTime), CAST(N'2016-11-27T02:28:44.943' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (22, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:49:57.157' AS DateTime), CAST(N'2016-11-27T02:50:28.247' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (23, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:51:10.360' AS DateTime), CAST(N'2016-11-27T02:58:29.847' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (24, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T02:58:41.130' AS DateTime), CAST(N'2016-11-27T02:59:46.423' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (25, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:25:51.913' AS DateTime), CAST(N'2016-11-27T04:28:53.857' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (26, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:29:04.147' AS DateTime), CAST(N'2016-11-27T04:30:00.140' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (27, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:30:09.090' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (28, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:31:25.417' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (29, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:36:58.700' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (30, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:39:04.293' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (31, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:41:48.857' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (32, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-27T04:42:53.260' AS DateTime), CAST(N'2016-11-27T04:43:21.603' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (33, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:28:53.297' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (34, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:29:30.077' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (35, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:34:17.570' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (36, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:38:45.467' AS DateTime), CAST(N'2016-11-29T15:40:07.693' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (37, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:40:12.307' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (38, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:42:33.583' AS DateTime), CAST(N'2016-11-29T15:43:01.387' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (39, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:43:33.940' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (40, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:44:43.710' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (41, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:47:34.067' AS DateTime), CAST(N'2016-11-29T15:49:16.140' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (42, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:49:18.670' AS DateTime), CAST(N'2016-11-29T15:51:39.383' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (43, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T15:51:43.497' AS DateTime), CAST(N'2016-11-29T15:52:30.230' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (44, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:02:39.907' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (45, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:03:34.727' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (46, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:05:45.697' AS DateTime), CAST(N'2016-11-29T16:05:46.587' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (47, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:05:50.417' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (48, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:14:31.063' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (49, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:15:56.620' AS DateTime), CAST(N'2016-11-29T16:17:11.253' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (50, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:18:00.530' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (51, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:36:24.557' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (52, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T16:39:54.320' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (53, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T17:37:06.570' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (54, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-29T21:08:42.863' AS DateTime), CAST(N'2016-11-30T09:42:03.833' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (55, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:42:12.870' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (56, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:42:55.867' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (57, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:45:22.907' AS DateTime), CAST(N'2016-11-30T09:48:18.453' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (58, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:48:22.537' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (59, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:50:33.573' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (60, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:51:58.073' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (61, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T09:53:41.310' AS DateTime), CAST(N'2016-11-30T10:03:26.593' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (62, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:03:33.313' AS DateTime), CAST(N'2016-11-30T10:03:57.950' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (63, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:04:30.750' AS DateTime), CAST(N'2016-11-30T10:06:13.447' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (64, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:08:27.980' AS DateTime), CAST(N'2016-11-30T10:09:06.363' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (65, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:09:33.590' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (66, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:13:03.827' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (67, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:14:31.343' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (68, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T10:21:13.877' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (69, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T14:57:34.633' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (70, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T14:58:05.203' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (71, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T14:59:36.603' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (72, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:04:56.213' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (73, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:10:35.650' AS DateTime), CAST(N'2016-11-30T15:19:26.357' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (74, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:31:08.110' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (75, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:44:38.420' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (76, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:45:12.183' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (77, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:47:00.297' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (78, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:58:02.013' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (79, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T15:59:42.700' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (80, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T16:01:32.313' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (81, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-11-30T16:02:44.670' AS DateTime), CAST(N'2016-12-01T11:07:38.150' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (82, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:07:41.880' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (83, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:09:03.783' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (84, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:10:38.727' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (85, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:11:22.297' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (86, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:12:31.697' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (87, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:14:21.433' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (88, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:16:37.497' AS DateTime), CAST(N'2016-12-01T11:18:38.137' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (89, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:21:26.463' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (90, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:25:03.007' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (91, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:25:30.577' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (92, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:26:35.133' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (93, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:27:56.123' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (94, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:28:27.740' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (95, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:34:05.647' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (96, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:45:30.683' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (97, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:45:58.187' AS DateTime), CAST(N'2016-12-01T11:49:26.447' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (98, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:50:00.960' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (99, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:52:51.160' AS DateTime), NULL)
GO
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (100, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:53:49.753' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (101, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T11:59:15.090' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (102, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:02:26.853' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (103, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:05:11.450' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (104, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:09:13.820' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (105, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:10:25.903' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (106, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:12:12.320' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (107, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:13:27.587' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (108, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:14:48.460' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (109, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:16:04.453' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (110, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:23:26.583' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (111, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:26:21.887' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (112, 10000, N'王丽丽', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:42:37.967' AS DateTime), CAST(N'2016-12-01T12:50:53.990' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (113, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:51:51.480' AS DateTime), CAST(N'2016-12-01T12:52:39.270' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (114, 10000, N'王丽丽', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:53:10.340' AS DateTime), CAST(N'2016-12-01T12:54:56.737' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (115, 10000, N'王丽丽', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T12:56:30.303' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (116, 10000, N'王丽丽', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:07:51.783' AS DateTime), CAST(N'2016-12-01T13:18:04.253' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (117, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:34:09.033' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (118, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:35:44.000' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (119, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:37:34.010' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (120, 10000, N'王丽丽', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:39:54.930' AS DateTime), CAST(N'2016-12-01T13:40:22.153' AS DateTime))
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (121, 20000, N'王永利', N'DESKTOP-3TABP9L', CAST(N'2016-12-01T13:44:00.890' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (122, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:06:12.010' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (123, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:07:38.007' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (124, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:09:03.287' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (125, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:10:24.110' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (126, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:13:58.397' AS DateTime), NULL)
INSERT [dbo].[LoginLogs] ([LogId], [LoginId], [LoginName], [ServerName], [LoginTime], [ExitTime]) VALUES (127, 20000, N'王永利', N'王永利', CAST(N'2016-12-01T15:15:30.610' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[LoginLogs] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (1, N'饮料')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (2, N'副食')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (3, N'面食')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (4, N'肉类')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (5, N'米类')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (6, N'酒类')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (7, N'烟类')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (8, N'文具')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (9, N'玩具')
INSERT [dbo].[ProductCategory] ([CategoryId], [CategoryName]) VALUES (10, N'日用品')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003001', 165, 200, 500, -1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003002', 349, 200, 500, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003003', 209, 200, 500, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003004', 265, 200, 400, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003005', 189, 100, 300, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003006', 498, 200, 500, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003007', 996, 200, 300, 1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003008', 201, 200, 300, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003009', 208, 200, 300, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003010', 148, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003011', 131, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003012', 195, 100, 150, 1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003013', 77, 100, 150, -1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003014', 17, 100, 150, -1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003015', 159, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003016', 159, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003017', 993, 100, 200, 1)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003018', 249, 100, 250, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003019', 98, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'6005004003020', 116, 100, 200, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'DALMFGJ001', -302, 50, 500, 0)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWsXP001', -53, 200, 1000, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP002', -4, 200, 800, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP003', -22, 100, 600, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP004', -1, 50, 500, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP005', -13, 50, 300, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP006', -7, 50, 300, 2)
INSERT [dbo].[ProductInventory] ([ProductId], [TotalCount], [MinCount], [MaxCount], [StatusId]) VALUES (N'GWSXP007', -9, 50, 300, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003001', N'康师傅牛肉面', CAST(40.00 AS Numeric(8, 2)), 1, 0, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003002', N'康师傅打卤面', CAST(35.00 AS Numeric(8, 2)), 1, 0, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003003', N'康师傅三鲜面', CAST(38.00 AS Numeric(8, 2)), 1, 0, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003004', N'统一牛肉面', CAST(36.00 AS Numeric(8, 2)), 1, 8, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003005', N'统一酸菜面', CAST(42.00 AS Numeric(8, 2)), 1, 9, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003006', N'雪花啤酒', CAST(60.50 AS Numeric(8, 2)), 1, 0, 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003007', N'燕京啤酒', CAST(60.00 AS Numeric(8, 2)), 1, 0, 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003008', N'可口可乐', CAST(6.80 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003009', N'百事可乐', CAST(5.80 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003010', N'统一鲜橙多', CAST(5.80 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003011', N'茉莉花茶', CAST(3.50 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003012', N'自制蛋糕', CAST(28.50 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003013', N'中型碳素笔', CAST(10.00 AS Numeric(8, 2)), 3, 0, 9)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003014', N'黑妹牙膏', CAST(6.80 AS Numeric(8, 2)), 3, 0, 10)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003015', N'东北大米', CAST(80.00 AS Numeric(8, 2)), 5, 0, 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003016', N'天津小站大米', CAST(100.00 AS Numeric(8, 2)), 5, 0, 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003017', N'利达面粉', CAST(68.50 AS Numeric(8, 2)), 5, 0, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003018', N'大豆油', CAST(68.80 AS Numeric(8, 2)), 8, 0, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003019', N'纯棉毛巾', CAST(8.80 AS Numeric(8, 2)), 7, 0, 10)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'6005004003020', N'金龙鱼食用油', CAST(55.80 AS Numeric(8, 2)), 8, 9, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'DALMFGJ001', N'达利面粉[高筋]5KG', CAST(85.00 AS Numeric(8, 2)), 5, 0, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWsXP001', N'格瓦斯[新品]', CAST(5.00 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP002', N'格瓦斯[新品]2号', CAST(8.50 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP003', N'格瓦斯[新品]3号', CAST(10.00 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP004', N'格瓦斯[新品]4号', CAST(12.00 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP005', N'格瓦斯新品5号', CAST(15.00 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP006', N'格瓦斯新品6号', CAST(18.00 AS Numeric(8, 2)), 2, 0, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP007', N'格瓦斯新品7号', CAST(20.00 AS Numeric(8, 2)), 2, 5, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [UnitId], [Discount], [CategoryId]) VALUES (N'GWSXP008', N'格瓦斯新品8号', CAST(22.00 AS Numeric(8, 2)), 2, 10, 1)
SET IDENTITY_INSERT [dbo].[ProductStorage] ON 

INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (1, N'6005004003008', 5, CAST(N'2016-11-27T02:21:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (2, N'6005004003008', 5, CAST(N'2016-11-27T02:21:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (3, N'6005004003008', 3, CAST(N'2016-11-27T02:22:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (8, N'6005004003008', 3, CAST(N'2016-11-27T02:25:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (9, N'6005004003008', 3, CAST(N'2016-11-27T02:25:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (12, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (13, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (14, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (15, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (16, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (17, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (18, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (19, N'6005004003008', 3, CAST(N'2016-11-27T02:28:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (20, N'6005004003004', 5, CAST(N'2016-11-27T02:51:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (21, N'6005004003004', -200, CAST(N'2016-11-27T02:51:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (23, N'6005004003004', -200, CAST(N'2016-11-27T02:55:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (24, N'6005004003004', -200, CAST(N'2016-11-27T02:55:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (25, N'6005004003004', 800, CAST(N'2016-11-27T02:56:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (26, N'6005004003004', -500, CAST(N'2016-11-27T02:56:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (27, N'6005004003006', -501, CAST(N'2016-11-27T02:59:00' AS SmallDateTime))
INSERT [dbo].[ProductStorage] ([StorageId], [ProductId], [AddedCount], [StorageTime]) VALUES (28, N'DALMFGJ001', 200, CAST(N'2016-11-30T15:34:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ProductStorage] OFF
SET IDENTITY_INSERT [dbo].[ProductUnit] ON 

INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (1, N'箱')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (2, N'瓶')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (3, N'盒')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (4, N'本')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (5, N'袋')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (6, N'只')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (7, N'条')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (8, N'桶')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (9, N'打')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (10, N'听')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (11, N'罐')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (12, N'张')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (13, N'块')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (14, N'床')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (15, N'把')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (16, N'台')
INSERT [dbo].[ProductUnit] ([UnitId], [UnitName]) VALUES (17, N'个')
SET IDENTITY_INSERT [dbo].[ProductUnit] OFF
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113032432488', CAST(10.00 AS Numeric(10, 2)), CAST(20.00 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:04:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113075175165', CAST(151.40 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), CAST(48.60 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:09:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113084484486', CAST(42700.00 AS Numeric(10, 2)), CAST(42700.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:10:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131018101843', CAST(1058.05 AS Numeric(10, 2)), CAST(1100.00 AS Numeric(10, 2)), CAST(41.95 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:13:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131235123554', CAST(10.00 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:13:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131250125014', CAST(35.00 AS Numeric(10, 2)), CAST(35.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:13:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113130413476', CAST(960.00 AS Numeric(10, 2)), CAST(960.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:13:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131321132123', CAST(798.00 AS Numeric(10, 2)), CAST(800.00 AS Numeric(10, 2)), CAST(2.00 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:14:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131344134426', CAST(1159.20 AS Numeric(10, 2)), CAST(1200.00 AS Numeric(10, 2)), CAST(40.80 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:14:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113140914974', CAST(494.12 AS Numeric(10, 2)), CAST(500.00 AS Numeric(10, 2)), CAST(5.88 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:15:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131449144940', CAST(5.80 AS Numeric(10, 2)), CAST(6.00 AS Numeric(10, 2)), CAST(0.20 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:15:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'2016120113150015016', CAST(2076.20 AS Numeric(10, 2)), CAST(2100.00 AS Numeric(10, 2)), CAST(23.80 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:16:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131550155048', CAST(1183.71 AS Numeric(10, 2)), CAST(1200.00 AS Numeric(10, 2)), CAST(16.29 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:17:00' AS SmallDateTime))
INSERT [dbo].[SalesList] ([SerialNumber], [TotalMoney], [RealReceive], [ReturnMone], [SalesPersonId], [CreateTime]) VALUES (N'20161201131714171424', CAST(860.40 AS Numeric(10, 2)), CAST(900.00 AS Numeric(10, 2)), CAST(39.60 AS Numeric(10, 2)), 10000, CAST(N'2016-12-01T13:18:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SalesListDetail] ON 

INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (1, N'2016120113032432488', N'6005004003013', N'中型碳素笔', CAST(10.00 AS Numeric(10, 2)), 0, 1, CAST(10.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (2, N'2016120113075175165', N'6005004003019', N'纯棉毛巾', CAST(8.80 AS Numeric(10, 2)), 0, 1, CAST(8.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (3, N'2016120113075175165', N'GWSXP002', N'格瓦斯[新品]2号', CAST(8.50 AS Numeric(10, 2)), 0, 1, CAST(8.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (4, N'2016120113075175165', N'6005004003017', N'利达面粉', CAST(68.50 AS Numeric(10, 2)), 0, 1, CAST(68.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (5, N'2016120113075175165', N'6005004003009', N'百事可乐', CAST(5.80 AS Numeric(10, 2)), 0, 1, CAST(5.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (6, N'2016120113075175165', N'6005004003001', N'康师傅牛肉面', CAST(40.00 AS Numeric(10, 2)), 0, 1, CAST(40.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (8, N'2016120113084484486', N'GWSXP003', N'格瓦斯[新品]3号', CAST(10.00 AS Numeric(10, 2)), 0, 20, CAST(200.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (9, N'2016120113084484486', N'DALMFGJ001', N'达利面粉[高筋]5KG', CAST(85.00 AS Numeric(10, 2)), 0, 500, CAST(42500.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (10, N'20161201131018101843', N'6005004003019', N'纯棉毛巾', CAST(8.80 AS Numeric(10, 2)), 0, 20, CAST(176.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (11, N'20161201131018101843', N'600500400301118', N'自制商品', CAST(0.00 AS Numeric(10, 2)), 0, 1, CAST(0.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (12, N'20161201131018101843', N'6005004003011', N'茉莉花茶', CAST(3.50 AS Numeric(10, 2)), 0, 18, CAST(63.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (13, N'20161201131018101843', N'6005004003017', N'利达面粉', CAST(68.50 AS Numeric(10, 2)), 0, 5, CAST(342.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (14, N'20161201131018101843', N'600500400301700', N'自制商品', CAST(55.20 AS Numeric(10, 2)), 0, 3, CAST(165.60 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (15, N'20161201131018101843', N'600500400301', N'自制商品', CAST(69.10 AS Numeric(10, 2)), 10, 5, CAST(310.95 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (16, N'20161201131235123554', N'GWSXP003', N'格瓦斯[新品]3号', CAST(10.00 AS Numeric(10, 2)), 0, 1, CAST(10.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (17, N'20161201131250125014', N'6005004003002', N'康师傅打卤面', CAST(35.00 AS Numeric(10, 2)), 0, 1, CAST(35.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (18, N'2016120113130413476', N'6005004003001', N'康师傅牛肉面', CAST(40.00 AS Numeric(10, 2)), 0, 24, CAST(960.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (19, N'20161201131321132123', N'6005004003003', N'康师傅三鲜面', CAST(38.00 AS Numeric(10, 2)), 0, 21, CAST(798.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (20, N'20161201131344134426', N'6005004003004', N'统一牛肉面', CAST(36.00 AS Numeric(10, 2)), 8, 35, CAST(1159.20 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (21, N'2016120113140914974', N'6005004003005', N'统一酸菜面', CAST(42.00 AS Numeric(10, 2)), 9, 1, CAST(38.22 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (22, N'2016120113140914974', N'6005004003006', N'雪花啤酒', CAST(60.50 AS Numeric(10, 2)), 0, 1, CAST(60.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (23, N'2016120113140914974', N'6005004003007', N'燕京啤酒', CAST(60.00 AS Numeric(10, 2)), 0, 4, CAST(240.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (24, N'2016120113140914974', N'6005004003008', N'可口可乐', CAST(6.80 AS Numeric(10, 2)), 0, 22, CAST(149.60 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (25, N'2016120113140914974', N'6005004003010', N'统一鲜橙多', CAST(5.80 AS Numeric(10, 2)), 0, 1, CAST(5.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (26, N'20161201131449144940', N'6005004003009', N'百事可乐', CAST(5.80 AS Numeric(10, 2)), 0, 1, CAST(5.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (27, N'2016120113150015016', N'6005004003010', N'统一鲜橙多', CAST(5.80 AS Numeric(10, 2)), 0, 1, CAST(5.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (28, N'2016120113150015016', N'6005004003011', N'茉莉花茶', CAST(3.50 AS Numeric(10, 2)), 0, 1, CAST(3.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (29, N'2016120113150015016', N'6005004003012', N'自制蛋糕', CAST(28.50 AS Numeric(10, 2)), 0, 5, CAST(142.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (30, N'2016120113150015016', N'6005004003013', N'中型碳素笔', CAST(10.00 AS Numeric(10, 2)), 0, 2, CAST(20.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (31, N'2016120113150015016', N'6005004003014', N'黑妹牙膏', CAST(6.80 AS Numeric(10, 2)), 0, 33, CAST(224.40 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (32, N'2016120113150015016', N'6005004003015', N'东北大米', CAST(80.00 AS Numeric(10, 2)), 0, 21, CAST(1680.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (33, N'20161201131550155048', N'6005004003016', N'天津小站大米', CAST(100.00 AS Numeric(10, 2)), 0, 1, CAST(100.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (34, N'20161201131550155048', N'6005004003017', N'利达面粉', CAST(68.50 AS Numeric(10, 2)), 0, 1, CAST(68.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (35, N'20161201131550155048', N'6005004003018', N'大豆油', CAST(68.80 AS Numeric(10, 2)), 0, 1, CAST(68.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (36, N'20161201131550155048', N'6005004003019', N'纯棉毛巾', CAST(8.80 AS Numeric(10, 2)), 0, 31, CAST(272.80 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (37, N'20161201131550155048', N'6005004003020', N'金龙鱼食用油', CAST(55.80 AS Numeric(10, 2)), 9, 4, CAST(203.11 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (38, N'20161201131550155048', N'DALMFGJ001', N'达利面粉[高筋]5KG', CAST(85.00 AS Numeric(10, 2)), 0, 2, CAST(170.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (39, N'20161201131550155048', N'GWsXP001', N'格瓦斯[新品]', CAST(5.00 AS Numeric(10, 2)), 0, 53, CAST(265.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (40, N'20161201131550155048', N'GWSXP002', N'格瓦斯[新品]2号', CAST(8.50 AS Numeric(10, 2)), 0, 3, CAST(25.50 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (41, N'20161201131550155048', N'GWSXP003', N'格瓦斯[新品]3号', CAST(10.00 AS Numeric(10, 2)), 0, 1, CAST(10.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (42, N'20161201131714171424', N'GWSXP004', N'格瓦斯[新品]4号', CAST(12.00 AS Numeric(10, 2)), 0, 1, CAST(12.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (43, N'20161201131714171424', N'GWSXP006', N'格瓦斯新品6号', CAST(18.00 AS Numeric(10, 2)), 0, 7, CAST(126.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (44, N'20161201131714171424', N'GWSXP007', N'格瓦斯新品7号', CAST(20.00 AS Numeric(10, 2)), 5, 9, CAST(171.00 AS Numeric(10, 2)))
INSERT [dbo].[SalesListDetail] ([Id], [SerialNumber], [ProductId], [ProductName], [UnitPrice], [Discount], [Quantity], [SubTotalMoney]) VALUES (45, N'20161201131714171424', N'GWSXP005', N'格瓦斯新品5号', CAST(15.00 AS Numeric(10, 2)), 0, 13, CAST(195.00 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[SalesListDetail] OFF
SET IDENTITY_INSERT [dbo].[SalesPerson] ON 

INSERT [dbo].[SalesPerson] ([SalesPersonId], [SalesPersonName], [LoginPassword]) VALUES (10000, N'王丽丽', N'123456')
INSERT [dbo].[SalesPerson] ([SalesPersonId], [SalesPersonName], [LoginPassword]) VALUES (10001, N'王小刚', N'123456')
INSERT [dbo].[SalesPerson] ([SalesPersonId], [SalesPersonName], [LoginPassword]) VALUES (10002, N'王大力', N'123456')
SET IDENTITY_INSERT [dbo].[SalesPerson] OFF
SET IDENTITY_INSERT [dbo].[SysAdmins] ON 

INSERT [dbo].[SysAdmins] ([LoginId], [LoginPassword], [AdminName], [AdminStatus], [RoleId]) VALUES (20000, N'11223344', N'王永利', 1, 1)
INSERT [dbo].[SysAdmins] ([LoginId], [LoginPassword], [AdminName], [AdminStatus], [RoleId]) VALUES (20001, N'11223344', N'张红梅', 1, 2)
INSERT [dbo].[SysAdmins] ([LoginId], [LoginPassword], [AdminName], [AdminStatus], [RoleId]) VALUES (20002, N'11223344', N'刘丽娜', 1, 2)
INSERT [dbo].[SysAdmins] ([LoginId], [LoginPassword], [AdminName], [AdminStatus], [RoleId]) VALUES (20003, N'11223344', N'王惠惠', 0, 2)
SET IDENTITY_INSERT [dbo].[SysAdmins] OFF
SET IDENTITY_INSERT [dbo].[VIPMembers] ON 

INSERT [dbo].[VIPMembers] ([MemberId], [MemberName], [Points], [PhoneNumber], [Address], [OpenTime], [Status]) VALUES (100200300, N'王晓敏', 100, N'13590856789', N'天津南开区', CAST(N'2016-11-26T20:50:15.897' AS DateTime), 1)
INSERT [dbo].[VIPMembers] ([MemberId], [MemberName], [Points], [PhoneNumber], [Address], [OpenTime], [Status]) VALUES (100200301, N'刘全明', 100, N'13590856788', N'天津河北区', CAST(N'2016-11-26T20:50:15.897' AS DateTime), 1)
INSERT [dbo].[VIPMembers] ([MemberId], [MemberName], [Points], [PhoneNumber], [Address], [OpenTime], [Status]) VALUES (100200302, N'赵大力', 100, N'13590856785', N'天津红桥区', CAST(N'2016-11-26T20:50:15.897' AS DateTime), 1)
INSERT [dbo].[VIPMembers] ([MemberId], [MemberName], [Points], [PhoneNumber], [Address], [OpenTime], [Status]) VALUES (100200303, N'王文才', 100, N'13590856782', N'天津东丽区', CAST(N'2016-11-26T20:50:15.900' AS DateTime), 1)
INSERT [dbo].[VIPMembers] ([MemberId], [MemberName], [Points], [PhoneNumber], [Address], [OpenTime], [Status]) VALUES (100200304, N'李兆新', 100, N'13590856781', N'天津河西区', CAST(N'2016-11-26T20:50:15.900' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[VIPMembers] OFF
ALTER TABLE [dbo].[LoginLogs] ADD  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[ProductInventory] ADD  DEFAULT ((0)) FOR [TotalCount]
GO
ALTER TABLE [dbo].[ProductInventory] ADD  DEFAULT ((0)) FOR [MinCount]
GO
ALTER TABLE [dbo].[ProductInventory] ADD  DEFAULT ((0)) FOR [MaxCount]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[ProductStorage] ADD  DEFAULT (getdate()) FOR [StorageTime]
GO
ALTER TABLE [dbo].[SalesList] ADD  DEFAULT ((0)) FOR [TotalMoney]
GO
ALTER TABLE [dbo].[SalesList] ADD  DEFAULT ((0)) FOR [RealReceive]
GO
ALTER TABLE [dbo].[SalesList] ADD  DEFAULT ((0)) FOR [ReturnMone]
GO
ALTER TABLE [dbo].[SalesList] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[SalesListDetail] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[VIPMembers] ADD  DEFAULT ((100)) FOR [Points]
GO
ALTER TABLE [dbo].[VIPMembers] ADD  DEFAULT (getdate()) FOR [OpenTime]
GO
ALTER TABLE [dbo].[VIPMembers] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[InventoryStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([UnitId])
REFERENCES [dbo].[ProductUnit] ([UnitId])
GO
ALTER TABLE [dbo].[ProductStorage]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[SalesList]  WITH CHECK ADD FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([SalesPersonId])
GO
ALTER TABLE [dbo].[SalesListDetail]  WITH CHECK ADD FOREIGN KEY([SerialNumber])
REFERENCES [dbo].[SalesList] ([SerialNumber])
GO
ALTER TABLE [dbo].[InventoryStatus]  WITH CHECK ADD  CONSTRAINT [ck_StatusId_Range] CHECK  (([StatusId]=(2) OR [StatusId]=(1) OR [StatusId]=(-1) OR [StatusId]=(0)))
GO
ALTER TABLE [dbo].[InventoryStatus] CHECK CONSTRAINT [ck_StatusId_Range]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH CHECK ADD  CONSTRAINT [ck_LoginPassword_Length] CHECK  ((len([LoginPassword])>=(6)))
GO
ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [ck_LoginPassword_Length]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddInventory]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AddInventory]
@ProductId nvarchar(50),
@AddCount int
as
	declare @errorSum int,@TotalCount int
	set @errorSum=0
	begin transaction
		begin
			--增加入库数据
			insert into ProductStorage (ProductId,AddedCount) values(@ProductId,@AddCount)
			set @errorSum=@errorSum+@@ERROR

			--更新对应商品库存
			update ProductInventory set TotalCount=
				case
					when TotalCount+@AddCount>=0 then TotalCount+@AddCount
					else 0
				end
			 where ProductId=@ProductId
			set @errorSum=@errorSum+@@ERROR

			--查询当前商品的现有库存
			select @TotalCount=TotalCount from ProductInventory where ProductId=@ProductId

			--根据当前库存数量更新商品的库存状态
			update ProductInventory set StatusId=
				case
				   when @TotalCount>MaxCount then 1
				   when @TotalCount<MinCount and @TotalCount>=0 then -1
				   when @TotalCount>=MinCount and @TotalCount<=MaxCount then 0
				   else 2
				   
				end
				where ProductId=@ProductId
			set @errorSum=@errorSum+@@ERROR

			if @errorSum>0
				rollback transaction
			else
				commit transaction
		end

GO
/****** Object:  StoredProcedure [dbo].[usp_AddProduct]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AddProduct]
@ProductId nvarchar(50),
@ProductName nvarchar(50),
@UnitId int,
@UnitPrice numeric(8,2),
@CategoryId int,
@MaxCount int,
@MinCount int
as
	declare @errorSum int
	set @errorSum=0
	begin transaction
		begin
			insert into Products(ProductId,ProductName,UnitId,UnitPrice,Discount,CategoryId)
				 values(@ProductId,@ProductName,@UnitId,@UnitPrice,0,@CategoryId)
			set @errorSum=@errorSum+@@ERROR
			insert into ProductInventory(ProductId,MaxCount,MinCount,TotalCount,StatusId)
				 values(@ProductId,@MaxCount,@MinCount,0,-1)
			set @errorSum=@errorSum+@@ERROR

			if @errorSum>0
				rollback transaction
			else
				commit transaction
		end

GO
/****** Object:  StoredProcedure [dbo].[usp_AdminLogin]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AdminLogin]
@LoginId int,
@LoginPwd nvarchar(20)
as
	select [LoginId],[LoginPassword],[AdminName],[AdminStatus],[RoleId]
	from [dbo].[SysAdmins]
	where LoginId=@LoginId and LoginPassword=@LoginPwd

GO
/****** Object:  StoredProcedure [dbo].[usp_EditProduct]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_EditProduct]
@ProductId nvarchar(50),
@ProductIdNew nvarchar(50),
@ProductName nvarchar(50),
@UnitId int,
@UnitPrice numeric(8,2),
@CategoryId int
as
			update Products set ProductId=@ProductIdNew,ProductName=@ProductName,UnitPrice=@UnitPrice,UnitId=@UnitId,CategoryId=@CategoryId where ProductId=@ProductId

GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductById]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetProductById]
@ProductId nvarchar(50)
as
			--根据商品编号获取商品信息
			select ProductId,ProductName,UnitPrice,ProductUnit.UnitName,Discount,ProductCategory.CategoryName from Products
			inner join ProductCategory on Products.CategoryId=ProductCategory.CategoryId
			inner join ProductUnit on Products.UnitId=ProductUnit.UnitId
			 where ProductId=@ProductId

GO
/****** Object:  StoredProcedure [dbo].[usp_LogDataPager]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_LogDataPager]
@PageSize int,--每页显示多少条
@CurrentPage int,--当前第多少页
@BeginTime datetime,--开始时间
@EndTime datetime--结束时间
as
			--查询当前分页的数据
			select top (@PageSize) LogId,LoginId,LoginName,ServerName,LoginTime,ExitTime 
			from LoginLogs
			where LogId not in (
							select top (@PageSize*(@CurrentPage-1)) LogId
							from LoginLogs
							where LoginTime between @BeginTime and @EndTime
							order by LogId)
					   and LoginTime between @BeginTime and @EndTime
			order by LogId

			--查询满足条件的记录总数
			select recordCount=count(*) 
			from LoginLogs
			where LoginTime between @BeginTime and @EndTime

GO
/****** Object:  StoredProcedure [dbo].[usp_QueryLessWarningInfo]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_QueryLessWarningInfo]

as
			--查询
			select ProductId,ProductName,UnitName,TotalCount,MaxCount,MinCount,StatusDescription
			from view_QueryInventoryInfo
			where StatusId=-1

GO
/****** Object:  StoredProcedure [dbo].[usp_QueryMoreWarningInfo]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_QueryMoreWarningInfo]

as
			--查询
			select ProductId,ProductName,UnitName,TotalCount,MaxCount,MinCount,StatusDescription
			from view_QueryInventoryInfo
			where StatusId=1

GO
/****** Object:  StoredProcedure [dbo].[usp_QuerySaleStatistics]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_QuerySaleStatistics]
@StartTime datetime,
@EndTime datetime
as
	select SalesListDetail.ProductId,SalesListDetail.ProductName,ProductUnit.UnitId,UnitName,ProductCategory.CategoryId,ProductCategory.CategoryName,SaleCount=sum(SalesListDetail.Quantity)
	from Products
	inner join ProductUnit on ProductUnit.UnitId = Products.UnitId
	right join ProductCategory on ProductCategory.CategoryId = Products.CategoryId
	right join SalesListDetail on SalesListDetail.ProductId=Products.ProductId
	inner join SalesList on SalesList.SerialNumber=SalesListDetail.SerialNumber
	where SalesList.CreateTime between @StartTime and @EndTime
	group by SalesListDetail.ProductId,SalesListDetail.ProductName,ProductUnit.UnitId,UnitName,ProductCategory.CategoryId,ProductCategory.CategoryName

GO
/****** Object:  StoredProcedure [dbo].[usp_QueryWarningCount]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_QueryWarningCount]
@TotalCount int output,--超出库存最高上限和最低下限的总数
@MoreCount int output,--超出库存最高上限的总数
@LessCount int output--超出库存最低限的总数
as
			--查询
			select @TotalCount=Count(*)
			from view_QueryWarningInfo
			where TotalCount>MaxCount or (TotalCount<MinCount and TotalCount>0)

			select @LessCount=Count(*)
			from view_QueryWarningInfo
			where TotalCount<MinCount and TotalCount>0

			select @MoreCount=Count(*)
			from view_QueryWarningInfo
			where  TotalCount>MaxCount

GO
/****** Object:  StoredProcedure [dbo].[usp_QueryWarningInfo]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_QueryWarningInfo]
as			
			--查询
			select ProductId,ProductName,UnitName,TotalCount,MaxCount,MinCount,StatusDescription
			from view_QueryInventoryInfo
			where  TotalCount>MaxCount  or (TotalCount<MinCount and TotalCount>0)

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateDiscount]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateDiscount]
@ProductId nvarchar(50),
@Discount int
as
	update Products set Discount=@Discount where ProductId=@ProductId

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateInventory]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateInventory]
@ProductId nvarchar(50),
@InventoryCount int
as
	declare @errorSum int,@TotalCount int
	set @errorSum=0
	begin transaction
		begin
			--更新对应商品库存
			update ProductInventory set TotalCount=@InventoryCount
			 where ProductId=@ProductId
			set @errorSum=@errorSum+@@ERROR

			--查询当前商品的现有库存
			select @TotalCount=TotalCount from ProductInventory where ProductId=@ProductId

			--根据当前库存数量更新商品的库存状态
			update ProductInventory set StatusId=
				case
				   when @TotalCount>MaxCount then 1
				   when @TotalCount<MinCount and @TotalCount>=0 then -1
				   when @TotalCount>=MinCount and @TotalCount<=MaxCount then 0
				   else 2
				   
				end
				where ProductId=@ProductId
			set @errorSum=@errorSum+@@ERROR

			if @errorSum>0
				rollback transaction
			else
				commit transaction
		end

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateInventoryStatus]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateInventoryStatus]

as
			--查询
			update ProductInventory set StatusId= case
				when TotalCount>MaxCount then 1--超出最大限制
				when TotalCount>0 and TotalCount<MinCount then -1--低于最低限制
				when TotalCount<=MaxCount and TotalCount>=MinCount then 0--正常
				else 2--已清仓
				end

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateMaxMinLimits]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateMaxMinLimits]
@ProductId nvarchar(50),
@MaxCount int,
@MinCount int
as
			--更新对应商品库存
			update ProductInventory set MaxCount=@MaxCount,MinCount=@MinCount
			where ProductId=@ProductId

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUpDownLimits]    Script Date: 12/2/2016 3:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateUpDownLimits]
@ProductId nvarchar(50),
@MaxCount int,
@MinCount int
as
			--更新对应商品库存
			update ProductInventory set MaxCount=@MaxCount,MinCount=@MinCount
			 where ProductId=@ProductId

GO
USE [master]
GO
ALTER DATABASE [SaleManagerDB] SET  READ_WRITE 
GO
