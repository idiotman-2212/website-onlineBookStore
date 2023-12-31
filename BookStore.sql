USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 6/3/2023 11:33:03 PM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Author__70DAFC34104848A9] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK__Category__19093A0BF5A845F4] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Tel] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](128) NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Invoice__D796AAB5EB40885A] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[Tel] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK__Member__0CF04B18306433B5] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberInRole]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInRole](
	[RoleId] [int] NOT NULL,
	[MemberId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[PublisherId] [int] NULL,
	[AuthorId] [int] NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Pages] [smallint] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[ISBN] [nvarchar](16) NULL,
 CONSTRAINT [PK__Product__B40CC6CD9BBAECC0] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] NOT NULL,
	[PublisherName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE1AAF8CD51A] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/3/2023 11:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [tinyint] NOT NULL,
	[StatusName] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK__Status__C8EE2063677C2745] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (1, N'TS. Vũ Việt Vũ, THS. Phùng Thị Thu Hiên')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (2, N'Phùng Thị Thu Hiền, Đặng Thị Hiên, Nguyễn Tuấn Linh, Nghiêm Văn Tính, Trần Thị Thanh, Đinh Quang Nin')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (3, N'Lê Cảnh Trung, Phạm Bá Đạm, Phạm Quang Huy')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (4, N'Phạm Văn Trung, Phạm Văn Tho, Bùi Công Thành, Phạm Thị Minh Thương')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (5, N'Nguyễn Tất Bảo Thiện, Phạm Quang Huy')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (6, N'Nguyễn Tất Bảo Thiện, Phạm Quang Hiển')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (7, N'Học Viện VIETSTEM')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (8, N'Ben Frain')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (9, N'Khuất Thùy Dương')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (10, N'O''reilly, Incorporated')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (11, N'Alexander Pachev')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (12, N'Schwartz, Baron; Zaitsev, Peter; Tkachenko, Vadim; Zawodny, Jerem')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (14, N'Đoàn Minh Phụng')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (1, N'Programing', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (2, N'Python', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (3, N'Java', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (4, N'C++', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (5, N'C#', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (6, N'Web', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (7, N'HTML, CSS', 6)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (8, N'PHP', 6)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (9, N'JavaScript', 6)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (10, N'Database', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (11, N'MySQL', 10)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (12, N'Office Computing', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (13, N'Word', 12)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (1014, 10041, N'hjhj@gmail.com', N'0988919703', N'Man thien', 1, CAST(N'2023-05-31T22:54:49.990' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (1015, 10043, N'namtruong@gmail.com', N'0396110120', N'97 Man Thi?n', 1, CAST(N'2023-06-03T11:00:40.200' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (1016, 44, N'email2@gmail.com', N'0988919702', N'331 Lê Van Vi?t', 4, CAST(N'2023-06-03T23:15:22.023' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (1017, 44, N'email2@gmail.com', N'0988919702', N'331 Le Van Viet', 1, CAST(N'2023-06-03T23:19:57.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1014, 1, 1, 95000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1014, 2, 1, 200000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1015, 1, 1, 95000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1015, 3, 1, 145000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1016, 1, 2, 95000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1016, 2, 1, 200000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1016, 3, 1, 145000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (1017, 1, 1, 95000)
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (42, N'Nhân Viên 1', N'$2a$12$y7wzGfDGjqa.Xq8BPBVYD.S7iii9SPI57Kw5vgnsLFHVUaGJ1J8cK', N'nv1@gmail.com', N'0', CAST(N'2023-04-24T09:39:36.633' AS DateTime), N'0123456789')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (44, N'Trần Nam', N'$2a$12$uK73ewXZuof/5Nc/9dSNO.QyiA1U653kvCH8bbmhQ4DbwlgqSNdCS', N'email2@gmail.com', N'0', CAST(N'2023-04-24T09:53:04.870' AS DateTime), N'0988919702')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (10041, N'user1', N'$2a$12$ti1tU6UpIhnaxl8ezvU48./LdVTHqCFarHXIPAvCwnydVrRkNzRa.', N'hjhj@gmail.com', N'0', CAST(N'2023-05-31T22:54:06.807' AS DateTime), N'0988919703')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (10042, N'Huy Diễn', N'$2a$12$SxkQGALXfd9iITQdJ2XvoeTmW/q77YyhdfKHR3FvOjqtxvz01NZzq', N'dienchau45@gmail.com', N'0', CAST(N'2023-06-02T22:20:01.413' AS DateTime), N'0326917158')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (10043, N'Nam Trương', N'$2a$12$.Py5WPgwylAune9RF1rRKurLLE8.HZ18esJsBsSnjK9VeOCJCH0vu', N'namtruong@gmail.com', N'0', CAST(N'2023-06-03T10:51:43.400' AS DateTime), N'0396110120')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (10044, N'Anh Việt', N'$2a$12$gkBc/4aMeHv40ED1V6sWpuo.XJSYBWzQWR2dCDqjSCRWUxf14r1CG', N'tranvietanh1803@gmail.com', N'0', CAST(N'2023-06-03T13:55:42.643' AS DateTime), N'0365899252')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (10046, N'Dương Phi Nguyễn', N'$2a$12$l.Hi2XUCkOaYa0mth99q2.xrUiRKeQR/bDfJtn4.JWyTJ4cB7PT82', N'phisuper2310@gmail.com', N'0', CAST(N'2023-06-03T20:52:45.580' AS DateTime), N'0988919701')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (1, 10046)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (2, 44)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (2, 10041)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (2, 10043)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (3, 42)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (3, 10042)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (3, 10044)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (1, 1, NULL, 1, N'Giáo Trình Ngôn Ngữ Lập Trình C++', 219, N'1.jpg', 95000, N'9786046708353')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (2, 4, NULL, 2, N'Lập Trình Trong Kỹ Thuật Với Ngôn Ngữ C++', 360, N'2.jpg', 200000, N'9786046724599')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (3, 2, NULL, 3, N'Python Dành Cho Người Bắt Đầu', 415, N'3.jpg', 145000, N'9786043415575')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (4, 3, NULL, 4, N'Lập Trình Java Căn Bản', 168, N'4.jpg', 95000, N'8778743605305')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (6, 5, NULL, 5, N'Hướng Dẫn Lập Trình C# (Bài Tập Thực Hành)', 404, N'5.jpg', 160000, N'9786043719963')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (7, 5, NULL, 6, N'Lập Trình Windows Form Và Web Form Với C#', 432, N'6.jpg', 125000, N'9786049869471')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (8, 2, NULL, 7, N'Lập Trình Với Python (Hành Trang Cho Tương Lai)', 224, N'7.jpg', 180000, N'9786043527810')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (9, 7, NULL, 8, N'Responsive Web Design with HTML5 and CSS', 409, N'8.jpg', 150000, N'9781839219795')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (10, 8, NULL, 9, N'Lập Trình Ứng Dụng Web Với PHP (Tập 1)', 214, N'9.jpg', 45000, N'5104582218527')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (11, 8, NULL, 9, N'Lập Trình Ứng Dụng Web Với PHP (Tập 2)', 214, N'10.jpg', 45000, N'5104582218510')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (12, 9, NULL, 10, N'Head First JavaScript Programming', 698, N'11.jpg', 230000, N'9781449340131')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (13, 11, NULL, 11, N'Understanding MySQL Internals', 258, N'12.jpg', 300000, N'9780596009571')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [ImageUrl], [Price], [ISBN]) VALUES (14, 11, NULL, 12, N'High Performance MySQL', 712, N'13.jpg', 99000, N'9780596101718')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (1, N'Appress')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (2, N'Reilly')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (4, N'Ky thuat Ha Noi')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (5, N'DHQG HCM')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (6, N'Dong Nai')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Member')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'ROLE_EMPLOYEE')
GO
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Processing')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Confirm')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (3, N'Delivered')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (4, N'Cancel')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EMAIL]    Script Date: 6/3/2023 11:33:04 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [UK_EMAIL] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_PHONE]    Script Date: 6/3/2023 11:33:04 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [UK_PHONE] UNIQUE NONCLUSTERED 
(
	[Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Member]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Invoice__MemberI__1ED998B2] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Invoice__MemberI__1ED998B2]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Invoice__StatusI__276EDEB3] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Invoice__StatusI__276EDEB3]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceDe__Invoi__286302EC] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK__InvoiceDe__Invoi__286302EC]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceDe__Produ__22AA2996] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK__InvoiceDe__Produ__22AA2996]
GO
ALTER TABLE [dbo].[MemberInRole]  WITH CHECK ADD  CONSTRAINT [FK__MemberInR__Membe__286302EC] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[MemberInRole] CHECK CONSTRAINT [FK__MemberInR__Membe__286302EC]
GO
ALTER TABLE [dbo].[MemberInRole]  WITH CHECK ADD  CONSTRAINT [FK__MemberInR__RoleI__5629CD9C] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[MemberInRole] CHECK CONSTRAINT [FK__MemberInR__RoleI__5629CD9C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__AuthorI__1920BF5C] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__AuthorI__1920BF5C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__182C9B23] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__182C9B23]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Publish__1A14E395] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Publish__1A14E395]
GO
/****** Object:  StoredProcedure [dbo].[AddCart]    Script Date: 6/3/2023 11:33:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCart](@MemberId BIGINT
                        , @ProductId int
						,@Quantity int)
AS
BEGIN
	DECLARE @count INT = 0
	SELECT @count = dbo.Cart.Quantity FROM dbo.Cart WHERE dbo.Cart.MemberId = @MemberId AND dbo.Cart.ProductId = @ProductId
	IF(@count < 1 )
		INSERT INTO Cart( MemberId, ProductId, Quantity) VALUES (@MemberId, @ProductId, @Quantity)
	ELSE
		UPDATE  Cart SET dbo.Cart.Quantity = (dbo.Cart.Quantity + @Quantity) WHERE dbo.Cart.MemberId = @MemberId AND dbo.Cart.ProductId = @ProductId	
END

GO
/****** Object:  StoredProcedure [dbo].[AddInvoice]    Script Date: 6/3/2023 11:33:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddInvoice](@pMemberId BIGINT
							,@pEmail VARCHAR(64)
							,@pTel VARCHAR(16)
							,@pAddress VARCHAR(128)
							)
as
BEGIN
	DECLARE @id int;

	INSERT INTO Invoice(MemberId, Email, Tel, Address,StatusId) VALUES(@pMemberId, @pEmail, @pTel, @pAddress,1);
	SELECT @id= @@IDENTITY

	INSERT into InvoiceDetail (InvoiceId, ProductId, Quantity, Price) 
	SELECT @id, Cart.ProductId, Cart.Quantity, Price  FROM Cart INNER JOIN Product ON Cart.ProductId = Product.ProductId
		WHERE  MemberId = @pMemberId;

	DELETE FROM Cart WHERE MemberId = @pMemberId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetCarts]    Script Date: 6/3/2023 11:33:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCarts](@MemberId BIGINT)
AS
BEGIN
	SELECT CartId, Cart.ProductId, Title, ImageUrl, Quantity, Price, Cart.AddedDate 
	FROM Cart 
	INNER JOIN Product ON Cart.ProductId = Product.ProductId WHERE MemberId = @MemberId
END

GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
