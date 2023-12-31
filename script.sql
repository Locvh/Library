USE [master]
GO
/****** Object:  Database [Library]    Script Date: 12/5/2023 2:39:13 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 12/5/2023 2:39:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](30) NULL,
	[OrderId] [varchar](30) NULL,
	[AmountOfMoney] [float] NULL,
	[TotalQuantity] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/5/2023 2:39:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [varchar](30) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[UserId] [int] NULL,
	[Address] [nvarchar](100) NULL,
	[TotalPayment] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/5/2023 2:39:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [varchar](30) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 12/5/2023 2:39:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Sex] [nvarchar](5) NULL,
	[DOB] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 12/5/2023 2:39:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([Id], [ProductId], [OrderId], [AmountOfMoney], [TotalQuantity], [ProductName]) VALUES (4, N'NT-AAA-212', N'74AE9', 10000, 1, N'AAAA')
INSERT [dbo].[Order_detail] ([Id], [ProductId], [OrderId], [AmountOfMoney], [TotalQuantity], [ProductName]) VALUES (5, N'NT-OOO-123', N'74AE9', 123321, 1, N'Dac')
INSERT [dbo].[Order_detail] ([Id], [ProductId], [OrderId], [AmountOfMoney], [TotalQuantity], [ProductName]) VALUES (6, N'NT-EEE-555', N'F4B8D', 24690, 2, N'Sach moi')
INSERT [dbo].[Order_detail] ([Id], [ProductId], [OrderId], [AmountOfMoney], [TotalQuantity], [ProductName]) VALUES (7, N'NT-AAA-212', N'F4B8D', 10000, 1, N'AAAA')
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [PhoneNumber], [UserId], [Address], [TotalPayment], [Status]) VALUES (N'74AE9', N'Loc', N'1231231212', 3, N'ewq21e', 133321, 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [PhoneNumber], [UserId], [Address], [TotalPayment], [Status]) VALUES (N'F4B8D', N'Loc', N'1231231212', 3, N'ewq21e', 34690, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Image], [Price], [Quantity], [Status]) VALUES (N'NT-AAA-212', N'AAAA', N'Sach do', N'tra.jpg', 10000, 8, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Image], [Price], [Quantity], [Status]) VALUES (N'NT-EEE-555', N'Sach moi', N'sach moi', N'sachthieunhi.jpg', 12345, 3, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Image], [Price], [Quantity], [Status]) VALUES (N'NT-OOO-123', N'Dac', N'Sach', N'Dacnhantam.png', 123321, 11, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Image], [Price], [Quantity], [Status]) VALUES (N'NT-WWW-222', N'Sach thieu nhi', N'sach hay', N'sachthieunhi.jpg', 212212, 22, 1)
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ProfileID], [CustomerName], [Sex], [DOB], [Email], [PhoneNumber], [UserId], [Status], [Address]) VALUES (1, N'Loc', N'Nam', CAST(N'2023-11-14' AS Date), N'ads@gmail.com', N'1231231212', 3, 1, N'ewq21e')
SET IDENTITY_INSERT [dbo].[Profile] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([UserId], [Username], [Password], [Role], [Status]) VALUES (1, N'Khuong', N'1234', N'admin', 1)
INSERT [dbo].[Registration] ([UserId], [Username], [Password], [Role], [Status]) VALUES (3, N'Loc', N'1234', N'user', 1)
SET IDENTITY_INSERT [dbo].[Registration] OFF
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Orders]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Registration] FOREIGN KEY([UserId])
REFERENCES [dbo].[Registration] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Registration]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Registration] FOREIGN KEY([UserId])
REFERENCES [dbo].[Registration] ([UserId])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Registration]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
