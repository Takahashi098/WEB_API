USE [master]
GO
CREATE DATABASE [PhoneStore]
GO
ALTER DATABASE [PhoneStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhoneStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhoneStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhoneStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhoneStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhoneStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhoneStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhoneStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhoneStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PhoneStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhoneStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhoneStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhoneStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhoneStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhoneStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhoneStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhoneStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PhoneStore] SET  MULTI_USER 
GO
ALTER DATABASE [PhoneStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhoneStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhoneStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhoneStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PhoneStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PhoneStore]
GO
/****** Object:  Table [dbo].[ItemLine]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemLine](
	[PurchaseID] [int] NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ItemLine] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceByTime]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceByTime](
	[ProductID] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Price] [float] NOT NULL CONSTRAINT [DF_PriceByTime_Price]  DEFAULT ((0)),
	[Description] [nvarchar](300) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PriceByTime] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](50) NOT NULL,
	[ImageURL] [varchar](255) NULL,
	[ImageName] [nvarchar](50) NULL,
	[Year] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)),
	[Manufactor] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseHistory]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseHistory](
	[PurchaseID] [int] IDENTITY(0,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[PhoneNumber] [varchar](16) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseHistory] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [int] IDENTITY(0,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[DateRate] [date] NOT NULL,
	[RatingPoint] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Registation] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(0,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Permission] [varchar](100) NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfor]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfor](
	[Username] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](16) NULL,
	[Address] [nvarchar](100) NULL,
	[BirthDay] [datetime] NULL,
	[Email] [varchar](60) NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_UserInfor] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSearchQuery]    Script Date: 4/15/2020 2:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSearchQuery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Username] [varchar](50) NULL,
	[SearchValue] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_UserSearchQuery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (20, N'Product6', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (21, N'Product5', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (22, N'Product2', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (22, N'Product3', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (22, N'Product4', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (22, N'Product5', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (22, N'Product6', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (23, N'Product6', 2)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (24, N'Product5', 4)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (25, N'Product1', 2)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (26, N'Product2', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (26, N'Product5', 1)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (27, N'Product4', 7)
INSERT [dbo].[ItemLine] ([PurchaseID], [ProductID], [Quantity]) VALUES (28, N'Product2', 3)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product1', CAST(N'2020-03-31 21:49:32.000' AS DateTime), 16000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product1', CAST(N'2020-03-31 21:57:45.000' AS DateTime), 16000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product1', CAST(N'2020-04-03 20:07:45.000' AS DateTime), 16000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product2', CAST(N'2020-03-31 21:51:26.000' AS DateTime), 14000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product2', CAST(N'2020-03-31 21:57:58.000' AS DateTime), 14000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product2', CAST(N'2020-04-01 16:15:50.000' AS DateTime), 14000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product3', CAST(N'2020-03-31 21:53:25.000' AS DateTime), 20000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product3', CAST(N'2020-03-31 21:57:31.000' AS DateTime), 20000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product4', CAST(N'2020-03-31 21:54:52.000' AS DateTime), 5950000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product4', CAST(N'2020-03-31 21:57:39.000' AS DateTime), 5950000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product5', CAST(N'2020-03-31 21:57:16.000' AS DateTime), 5800000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product5', CAST(N'2020-03-31 21:57:52.000' AS DateTime), 5800000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product5', CAST(N'2020-04-03 20:03:10.000' AS DateTime), 5800000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product5', CAST(N'2020-04-03 20:03:16.000' AS DateTime), 5800000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product5', CAST(N'2020-04-03 20:04:09.000' AS DateTime), 5800000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product6', CAST(N'2020-04-01 10:43:36.000' AS DateTime), 7000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product6', CAST(N'2020-04-01 18:00:23.000' AS DateTime), 7000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product7', CAST(N'2020-04-03 09:39:13.000' AS DateTime), 1900000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product7', CAST(N'2020-04-03 09:39:56.000' AS DateTime), 100000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product7', CAST(N'2020-04-03 13:38:50.000' AS DateTime), 100000000, NULL, 1)
INSERT [dbo].[PriceByTime] ([ProductID], [Date], [Price], [Description], [Status]) VALUES (N'Product7', CAST(N'2020-04-03 17:31:32.000' AS DateTime), 50000000, NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product1', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Goo3132020214928-203.jpg?alt=media&token=c6b6794c-04d2-4ac4-ba91-da1661280883', N'phone-Goo3132020214928-203.jpg', 2019, N'Google Pixel 4', -4, N'Google', N'Vừa qua, Google đã chính thức giới thiệu hai mẫu smartphone mới của mình Google Pixel 4 với nhiều nâng cấp so với người tiền nhiệm.', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product2', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Sam3132020215124-51.jpg?alt=media&token=b4c7ec16-8eaa-4586-a6f6-756647c482b9', N'phone-Sam3132020215124-51.jpg', 2019, N'Samsung Galaxy S10', 5, N'Samsung', N'Tuyệt tác của thiết kế với màn hình Infinity-O độc đáo lần đầu tiên đã xuất hiện. Không đơn thuần là một chiếc điện thoại, Samsung S10 còn là đỉnh cao của công nghệ.', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product3', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Iph3132020215322-975.png?alt=media&token=bd5c9da3-c607-4b54-957d-3ea5a079a0d0', N'phone-Iph3132020215322-975.png', 2019, N'Iphone XS ', 9, N'Apple', N'iPhone Xs sở hữu bộ vi xử lý mạnh mẽ và thông minh nhất từ trước tới nay trong thế giới smartphone, đồng thời hệ thống camera kép cũng được nâng lên một tầm cao mới.', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product4', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Xia3132020215450-74.jpg?alt=media&token=025d0ad5-9c75-4ca8-946f-6487a69b9a2c', N'phone-Xia3132020215450-74.jpg', 2018, N'Xiaomi Redmi Note 8 Pro', -4, N'Xiaomi', N'Xiaomi Redmi Note 8 Pro là mẫu điện thoại tầm trung tiếp theo vừa được nhà sản xuất Trung Quốc ra mắt bên cạnh mẫu điện thoại Xiaomi Redmi Note 8. Remi note 8 Pro với nhiều nâng cấp và cải tiến hứa hẹn mang tới cho người dùng những trải nghiệm ấn tượng.', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product5', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Sam3132020215715-813.png?alt=media&token=0354f375-a131-471b-a820-20f814ace8c6', N'phone-Sam3132020215715-813.png', 2018, N'Samsung Galaxy A51', 5, N'Samsung', N'sadsasd', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product6', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Bph142020104333-743.png?alt=media&token=14d0724b-071e-4e92-9b5f-61d2e6b9e794', N'phone-Bph142020104333-743.png', 2020, N'Bphone 3', 9, N'BKAV', N'Nếu như với 2 chiếc Bphone đời đầu nhiều người còn đánh giá đây chỉ là những chiếc máy để Bkav để "quảng bá thương hiệu" chứ chưa thực sự đáng sở hữu thì với Bphone 3 Bkav đã khiến nhiều người Việt thực sự "tự hào".', 1)
INSERT [dbo].[Product] ([ProductID], [ImageURL], [ImageName], [Year], [ProductName], [Quantity], [Manufactor], [Description], [Status]) VALUES (N'Product7', N'https://firebasestorage.googleapis.com/v0/b/upload-picture-898ad.appspot.com/o/images%2Fphones%2Fphone-Ver3420209398-250.jpg?alt=media&token=76eae008-4883-4520-bae3-7ca51fd6283a', N'phone-Ver3420209398-250.jpg', 2020, N'Vertu Signature S Yellow Gold Diamond', 50, N'Vertu', N'Vertu S Design được thiết kế từ 388 thành phần cơ khí khác nhau tạo nên, phức tạp đến nỗi gần như không thể chế tạo được bởi những chi tiết tỉ mỉ, chính xác gần như tuyệt đối. Những người thợ thủ công giàu kinh nghiệm đã mất đến 3 năm chỉ để học cách lắp ráp hoàn chỉnh .', 1)
SET IDENTITY_INSERT [dbo].[PurchaseHistory] ON 

INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (20, N'hoangvu', CAST(N'2020-04-01 16:27:51.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', N'', 2)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (21, N'hoangvu', CAST(N'2020-04-01 16:28:14.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', N'', 3)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (22, N'hoangvu', CAST(N'2020-04-01 16:36:39.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', N'hàng lỗi 1 2 3', 4)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (23, N'hoangvu', CAST(N'2020-04-01 21:17:47.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', N'asdad', 4)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (24, N'hoangvu', CAST(N'2020-04-01 22:27:26.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', NULL, 1)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (25, N'hoangvu', CAST(N'2020-04-01 22:51:31.000' AS DateTime), N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', N'asd', 4)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (26, N'dantruong123', CAST(N'2020-04-02 09:06:56.000' AS DateTime), N'0911233421', N'89/6 Huyền Trân Công Chúa', N'hàng lỗi', 4)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (27, N'admin', CAST(N'2020-04-02 09:30:41.000' AS DateTime), N'0949661867', N'Trái đất', N'as', 4)
INSERT [dbo].[PurchaseHistory] ([PurchaseID], [Username], [Date], [PhoneNumber], [Address], [Description], [Status]) VALUES (28, N'admin', CAST(N'2020-04-02 09:57:28.000' AS DateTime), N'0949661867', N'Trái đất', NULL, 1)
SET IDENTITY_INSERT [dbo].[PurchaseHistory] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (17, N'admin', N'Product2', CAST(N'2020-03-31' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (18, N'admin', N'Product2', CAST(N'2020-03-31' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (19, N'admin', N'Product2', CAST(N'2020-03-31' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (20, N'hoangvu', N'Product5', CAST(N'2020-03-31' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (21, N'hoangvu', N'Product5', CAST(N'2020-03-31' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (22, N'hoangvu', N'Product5', CAST(N'2020-03-31' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (23, N'hoangvu', N'Product6', CAST(N'2020-04-01' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (24, N'admin', N'Product2', CAST(N'2020-04-01' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (25, N'admin', N'Product2', CAST(N'2020-04-01' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (26, N'admin', N'Product6', CAST(N'2020-04-02' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (27, N'admin', N'Product4', CAST(N'2020-04-02' AS Date), 1)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (28, N'admin', N'Product4', CAST(N'2020-04-02' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (29, N'admin', N'Product2', CAST(N'2020-04-03' AS Date), 3)
INSERT [dbo].[Rating] ([RatingID], [Username], [ProductID], [DateRate], [RatingPoint]) VALUES (30, N'admin', N'Product2', CAST(N'2020-04-03' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Rating] OFF
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'dantruong123', N'81dc9bdb52d04dc20036dbd8313ed055', 1, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'hoangvu', N'827ccb0eea8a706c4c34a16891f84e7b', 1, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'lehoangvuvt', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'lehoangvuvt1', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'lehoangvuvt2', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'lehoangvuvt3', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'manhtung1994', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'Tungbeo2', N'65acfc54f8c02687a83ec0478074e9d4', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'TungBM', N'25f9e794323b453885f5181f1b624d0b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'tungbmbmbm', N'25f9e794323b453885f5181f1b624d0b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'VuLH', N'25f9e794323b453885f5181f1b624d0b', 2, 1)
INSERT [dbo].[Registration] ([Username], [Password], [RoleID], [Status]) VALUES (N'vy123', N'827ccb0eea8a706c4c34a16891f84e7b', 2, 1)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Permission], [Status]) VALUES (1, N'Admin', N'Administrator', N'All', N'true      ')
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Permission], [Status]) VALUES (2, N'Member', N'Member', N'', N'true      ')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'admin', N'BaoLG', N'0949661867', N'Sao Hỏa', CAST(N'1998-12-09 00:00:00.000' AS DateTime), N'baolg2@fsoft.com.vn', N'Super admin')
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'dantruong123', N'Lê Đan Trường Vũ', N'0911233421', N'89/6 Huyền Trân Công Chúa', CAST(N'1990-01-18 00:00:00.000' AS DateTime), N'dantruong@gmail.com', NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'hoangvu', N'lê hoàng vũ', N'0949661867', N'360 Bến Vân Đồn, Q9 TPHCM', CAST(N'1996-03-18 00:00:00.000' AS DateTime), N'hoangvule100@gmail.com', NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'lehoangvuvt', N'Lê Hoàng Vũ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'lehoangvuvt1', N'Lê Hoàng Vũ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'lehoangvuvt2', N'Lê Hoàng Vũ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'lehoangvuvt3', N'Lê Hoàng Vũ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'Tungbeo2', N'Mạnh Tùng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'TungBM', N'Bùi Mạnh Tùng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'tungbmbmbm', N'Bùi Mạnh Tùng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'VuLH', N'Lê Hoàng Vũ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfor] ([Username], [FullName], [PhoneNumber], [Address], [BirthDay], [Email], [Description]) VALUES (N'vy123', N'le thi vy', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserSearchQuery] ON 

INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (1, CAST(N'2020-04-03 08:47:08.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (2, CAST(N'2020-04-03 08:47:15.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (3, CAST(N'2020-04-03 08:47:58.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (4, CAST(N'2020-04-03 08:48:06.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (5, CAST(N'2020-04-03 08:48:08.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (6, CAST(N'2020-04-03 08:48:10.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (7, CAST(N'2020-04-03 08:48:12.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (8, CAST(N'2020-04-03 08:48:14.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (9, CAST(N'2020-04-03 08:48:15.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (10, CAST(N'2020-04-03 08:48:17.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (11, CAST(N'2020-04-03 08:48:19.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (12, CAST(N'2020-04-03 08:48:21.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (13, CAST(N'2020-04-03 08:52:56.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (14, CAST(N'2020-04-03 09:12:17.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (15, CAST(N'2020-04-03 09:12:35.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (16, CAST(N'2020-04-03 09:13:45.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (17, CAST(N'2020-04-03 09:14:10.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (18, CAST(N'2020-04-03 09:15:03.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (19, CAST(N'2020-04-03 09:15:48.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (20, CAST(N'2020-04-03 09:16:33.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (21, CAST(N'2020-04-03 09:16:42.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (22, CAST(N'2020-04-03 09:19:21.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (23, CAST(N'2020-04-03 09:19:43.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (24, CAST(N'2020-04-03 09:20:07.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (25, CAST(N'2020-04-03 09:20:14.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (26, CAST(N'2020-04-03 09:21:54.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (27, CAST(N'2020-04-03 09:22:01.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (28, CAST(N'2020-04-03 09:22:07.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (29, CAST(N'2020-04-03 09:22:16.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (30, CAST(N'2020-04-03 09:22:22.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (31, CAST(N'2020-04-03 09:22:47.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (32, CAST(N'2020-04-03 09:22:53.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (33, CAST(N'2020-04-03 09:23:13.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (34, CAST(N'2020-04-03 09:23:27.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (35, CAST(N'2020-04-03 09:24:11.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (36, CAST(N'2020-04-03 09:25:05.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (37, CAST(N'2020-04-03 09:25:52.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (38, CAST(N'2020-04-03 09:26:57.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (39, CAST(N'2020-04-03 09:26:59.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (40, CAST(N'2020-04-03 09:27:06.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (41, CAST(N'2020-04-03 09:27:11.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (42, CAST(N'2020-04-03 09:27:16.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (43, CAST(N'2020-04-03 09:27:38.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (44, CAST(N'2020-04-03 09:27:45.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (45, CAST(N'2020-04-03 09:28:33.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (46, CAST(N'2020-04-03 09:28:36.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (47, CAST(N'2020-04-03 09:28:44.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (48, CAST(N'2020-04-03 09:29:01.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (49, CAST(N'2020-04-03 09:29:08.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (50, CAST(N'2020-04-03 09:30:13.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (51, CAST(N'2020-04-03 09:30:18.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (52, CAST(N'2020-04-03 09:30:25.000' AS DateTime), NULL, N'Iphone XS')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (53, CAST(N'2020-04-03 09:30:38.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (54, CAST(N'2020-04-03 09:30:55.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (55, CAST(N'2020-04-03 09:31:07.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (56, CAST(N'2020-04-03 09:31:43.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (57, CAST(N'2020-04-03 09:31:47.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (58, CAST(N'2020-04-03 09:31:51.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (59, CAST(N'2020-04-03 09:31:53.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (60, CAST(N'2020-04-03 09:31:56.000' AS DateTime), NULL, N'ip')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (61, CAST(N'2020-04-03 09:32:29.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (62, CAST(N'2020-04-03 09:34:49.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (63, CAST(N'2020-04-03 09:52:28.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (64, CAST(N'2020-04-03 09:52:41.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (65, CAST(N'2020-04-03 09:53:30.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (66, CAST(N'2020-04-03 09:53:36.000' AS DateTime), NULL, N'Samsung Galaxy A51')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (67, CAST(N'2020-04-03 10:04:56.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (68, CAST(N'2020-04-03 10:05:23.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (69, CAST(N'2020-04-03 10:06:54.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (70, CAST(N'2020-04-03 10:07:00.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (71, CAST(N'2020-04-03 10:07:24.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (72, CAST(N'2020-04-03 10:07:29.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (73, CAST(N'2020-04-03 10:08:47.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (74, CAST(N'2020-04-03 10:11:59.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (75, CAST(N'2020-04-03 10:27:33.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (76, CAST(N'2020-04-03 10:27:47.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (77, CAST(N'2020-04-03 10:38:02.000' AS DateTime), NULL, N'asd')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (78, CAST(N'2020-04-03 10:39:39.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (79, CAST(N'2020-04-03 10:40:02.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (80, CAST(N'2020-04-03 10:40:05.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (81, CAST(N'2020-04-03 10:40:07.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (82, CAST(N'2020-04-03 10:40:09.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (83, CAST(N'2020-04-03 10:40:13.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (84, CAST(N'2020-04-03 10:41:32.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (85, CAST(N'2020-04-03 10:41:47.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (86, CAST(N'2020-04-03 10:42:47.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (87, CAST(N'2020-04-03 10:46:36.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (88, CAST(N'2020-04-03 10:46:54.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (89, CAST(N'2020-04-03 10:51:27.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (90, CAST(N'2020-04-03 11:26:16.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (91, CAST(N'2020-04-03 11:26:55.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (92, CAST(N'2020-04-03 11:27:30.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (93, CAST(N'2020-04-03 11:28:04.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (94, CAST(N'2020-04-03 11:28:51.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (95, CAST(N'2020-04-03 11:29:30.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (96, CAST(N'2020-04-03 11:30:26.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (97, CAST(N'2020-04-03 11:30:54.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (98, CAST(N'2020-04-03 11:33:44.000' AS DateTime), NULL, N'mtp')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (99, CAST(N'2020-04-03 11:33:48.000' AS DateTime), NULL, N'mtp')
GO
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (100, CAST(N'2020-04-03 11:33:51.000' AS DateTime), NULL, N'mtp')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (101, CAST(N'2020-04-03 11:33:53.000' AS DateTime), NULL, N'mtp')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (102, CAST(N'2020-04-03 11:33:57.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (103, CAST(N'2020-04-03 11:34:06.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (104, CAST(N'2020-04-03 11:34:17.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (105, CAST(N'2020-04-03 11:36:03.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (106, CAST(N'2020-04-03 11:37:01.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (107, CAST(N'2020-04-03 11:37:07.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (108, CAST(N'2020-04-03 11:37:10.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (109, CAST(N'2020-04-03 11:37:14.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (110, CAST(N'2020-04-03 11:37:17.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (111, CAST(N'2020-04-03 11:37:22.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (112, CAST(N'2020-04-03 11:37:39.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (113, CAST(N'2020-04-03 12:42:12.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (114, CAST(N'2020-04-03 12:48:18.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (115, CAST(N'2020-04-03 12:56:14.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (116, CAST(N'2020-04-03 12:56:21.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (117, CAST(N'2020-04-03 12:56:26.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (118, CAST(N'2020-04-03 12:56:28.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (119, CAST(N'2020-04-03 13:01:22.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (120, CAST(N'2020-04-03 13:06:48.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (121, CAST(N'2020-04-03 13:12:02.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (122, CAST(N'2020-04-03 13:20:12.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (123, CAST(N'2020-04-03 13:20:12.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (124, CAST(N'2020-04-03 14:00:51.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (125, CAST(N'2020-04-03 16:55:19.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (126, CAST(N'2020-04-03 16:55:36.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (127, CAST(N'2020-04-03 16:55:41.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (128, CAST(N'2020-04-03 16:55:45.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (129, CAST(N'2020-04-03 16:56:54.000' AS DateTime), NULL, N'iphone')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (130, CAST(N'2020-04-03 17:55:00.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (131, CAST(N'2020-04-03 17:55:57.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (132, CAST(N'2020-04-03 20:00:33.000' AS DateTime), NULL, N'khau trang')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (133, CAST(N'2020-04-03 20:01:01.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (134, CAST(N'2020-04-03 20:01:05.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (135, CAST(N'2020-04-03 20:01:09.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (136, CAST(N'2020-04-03 20:01:12.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (137, CAST(N'2020-04-03 20:01:16.000' AS DateTime), NULL, N'iph')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (138, CAST(N'2020-04-03 20:08:44.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (139, CAST(N'2020-04-03 20:12:52.000' AS DateTime), NULL, N'Samsung Galaxy S10')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (1002, CAST(N'2020-04-04 21:54:52.000' AS DateTime), NULL, N'sam')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (1003, CAST(N'2020-04-04 21:57:54.000' AS DateTime), NULL, N'samsung')
INSERT [dbo].[UserSearchQuery] ([ID], [Date], [Username], [SearchValue]) VALUES (1004, CAST(N'2020-04-06 07:09:10.000' AS DateTime), NULL, N'sam')
SET IDENTITY_INSERT [dbo].[UserSearchQuery] OFF
ALTER TABLE [dbo].[ItemLine]  WITH CHECK ADD  CONSTRAINT [FK_ItemLine_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ItemLine] CHECK CONSTRAINT [FK_ItemLine_Product]
GO
ALTER TABLE [dbo].[ItemLine]  WITH CHECK ADD  CONSTRAINT [FK_ItemLine_PurchaseHistory] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[PurchaseHistory] ([PurchaseID])
GO
ALTER TABLE [dbo].[ItemLine] CHECK CONSTRAINT [FK_ItemLine_PurchaseHistory]
GO
ALTER TABLE [dbo].[PriceByTime]  WITH CHECK ADD  CONSTRAINT [FK_PriceByTime_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PriceByTime] CHECK CONSTRAINT [FK_PriceByTime_Product]
GO
ALTER TABLE [dbo].[PurchaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseHistory_Registation] FOREIGN KEY([Username])
REFERENCES [dbo].[Registration] ([Username])
GO
ALTER TABLE [dbo].[PurchaseHistory] CHECK CONSTRAINT [FK_PurchaseHistory_Registation]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product1]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Registration1] FOREIGN KEY([Username])
REFERENCES [dbo].[Registration] ([Username])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Registration1]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Role]
GO
ALTER TABLE [dbo].[UserInfor]  WITH CHECK ADD  CONSTRAINT [FK_UserInfor_Registation] FOREIGN KEY([Username])
REFERENCES [dbo].[Registration] ([Username])
GO
ALTER TABLE [dbo].[UserInfor] CHECK CONSTRAINT [FK_UserInfor_Registation]
GO
USE [master]
GO
ALTER DATABASE [PhoneStore] SET  READ_WRITE 
GO
