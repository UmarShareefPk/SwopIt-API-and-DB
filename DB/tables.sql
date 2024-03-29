USE [SwopIt]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/3/2017 6:37:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[MainCategory] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Chats]    Script Date: 6/3/2017 6:37:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NOT NULL,
	[Reciever] [int] NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 6/3/2017 6:37:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Items]    Script Date: 6/3/2017 6:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[PostDate] [datetime] NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Condition] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Image1] [nvarchar](200) NOT NULL,
	[Image2] [nvarchar](200) NOT NULL,
	[Image3] [nvarchar](200) NOT NULL,
	[Image4] [nvarchar](200) NOT NULL,
	[Image5] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 6/3/2017 6:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Rater] [int] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RedeemCoins]    Script Date: 6/3/2017 6:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedeemCoins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Coins] [float] NOT NULL,
	[BankName] [nvarchar](200) NOT NULL,
	[AccountNumber] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_RedeemCoins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SwopRequests]    Script Date: 6/3/2017 6:37:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SwopRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserFrom_Id] [int] NOT NULL,
	[UserTo_Id] [int] NOT NULL,
	[Status] [nvarchar](100) NULL,
	[Date] [datetime] NOT NULL,
	[UserFromItems] [nvarchar](50) NOT NULL,
	[UserToItems] [nvarchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Coins] [varchar](50) NULL,
 CONSTRAINT [PK_SwopRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/3/2017 6:37:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[About] [nvarchar](500) NOT NULL,
	[MoreInfo] [nvarchar](500) NOT NULL,
	[PicturePath] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Longitude] [nvarchar](20) NOT NULL,
	[Latitude] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[UsersAccounts]    Script Date: 6/3/2017 6:37:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Bank] [nvarchar](200) NOT NULL,
	[AccountNumber] [nvarchar](20) NOT NULL,
	[Coins] [float] NOT NULL,
 CONSTRAINT [PK_UsersAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (1, N'Accessories', N'Fashion')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (3, N'Dress', N'Fashion')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (4, N'Shoes', N'Fashion')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (5, N'Mobile', N'Electronics')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (6, N'iPad & Laptops', N'Electronics')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (7, N'Electronics', N'Electronics')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (8, N'Art', N'Book & Art')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (10, N'Books', N'Book & Art')
INSERT [dbo].[Categories] ([Id], [Name], [MainCategory]) VALUES (11, N'Films', N'Book & Art')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Chats] ON 

INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (1, 1008, 1009, N'Message from 1008 to 1009', CAST(0x0000A78100D31B87 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (2, 1009, 1008, N'Message from 1009 to 1008', CAST(0x0000A78100D31EA8 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (3, 1008, 1010, N'Message from 1008 to 1010', CAST(0x0000A78100D32139 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (4, 1010, 1008, N'Message from 1010 to 1008', CAST(0x0000A78100D3258B AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (5, 1008, 1011, N'Message from 1008 to 1011', CAST(0x0000A78100D328C9 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (6, 1011, 1008, N'Message from 1011 to 1008', CAST(0x0000A78100D32E22 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (7, 1008, 1012, N'Message from 1008 to 1012', CAST(0x0000A78100D333C5 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (8, 1012, 1008, N'Message from 1012 to 1008', CAST(0x0000A78100D338E1 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (9, 1009, 1010, N'Message from 1008 to 1009', CAST(0x0000A78100D33D34 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (10, 1010, 1009, N'Message from 1008 to 1009', CAST(0x0000A78100D3418F AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (11, 1009, 1011, N'Message from 1008 to 1009', CAST(0x0000A78100D3467C AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (12, 1011, 1009, N'Message from 1008 to 1009', CAST(0x0000A78100D34FC5 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (13, 1012, 1009, N'Message from 1008 to 1009', CAST(0x0000A78100D35495 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (14, 1010, 1011, N'Message from 1008 to 1009', CAST(0x0000A78100D357F9 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (15, 1011, 1010, N'Message from 1008 to 1009', CAST(0x0000A78100D35C1C AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (16, 1010, 1012, N'Message from 1008 to 1009', CAST(0x0000A78100D360C8 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (17, 1012, 1010, N'Message from 1008 to 1009', CAST(0x0000A78100D36497 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (18, 1011, 1012, N'Message from 1008 to 1009', CAST(0x0000A78100D3691C AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (19, 1012, 1011, N'Message from 1008 to 1009', CAST(0x0000A78100D36CBC AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (20, 1008, 1009, N'This is test message from User 1008 to User 1009.', CAST(0x0000A78100E14680 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (21, 1133, 1132, N'First Message', CAST(0x0000A784014B695A AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (22, 1133, 1132, N'First Message', CAST(0x0000A784014BF88B AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (23, 1133, 1132, N'Kaka', CAST(0x0000A784014EB89B AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (24, 1161, 1160, N'Hello', CAST(0x0000A78601455617 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (25, 1160, 1161, N'hi', CAST(0x0000A78601456180 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (26, 1161, 1160, N'Hj', CAST(0x0000A7860145BAAC AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (27, 1161, 1160, N'Hahaha', CAST(0x0000A7860145C3EC AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (28, 1161, 1160, N'Jsjsjdbdjeje bush''s dhdbd  she d HD ', CAST(0x0000A7860145EDB0 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (29, 1161, 1160, N'Jsjsjdbdjeje dhdbd dhdbd dude she dudbdudbddud  dudbdudbddud dud she suddenly dud dhd ', CAST(0x0000A7860145F9AE AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (30, 1160, 1161, N'loll', CAST(0x0000A786014638D1 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (31, 1161, 1160, N'Oye', CAST(0x0000A7860146FA33 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (32, 1161, 1160, N'Jahan an d', CAST(0x0000A7860147A05A AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (33, 1161, 1160, N'Haha she  s', CAST(0x0000A78601487EE2 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (34, 1161, 1160, N'Lel', CAST(0x0000A78601488D68 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (35, 1160, 1161, N'hiii', CAST(0x0000A78601489945 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (36, 1161, 1160, N'Hello', CAST(0x0000A786014D25CB AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (37, 1161, 1160, N'Oye', CAST(0x0000A786014D3483 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (38, 1161, 1160, N'Axha', CAST(0x0000A786014D3B4E AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (39, 1161, 1160, N'Gghh', CAST(0x0000A786014D4ADF AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (40, 1161, 1160, N'Jsjsjssksmmsdhbd dhdsbh', CAST(0x0000A786014D8E2F AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (41, 1161, 1160, N'Hmm', CAST(0x0000A786014DF5DC AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (42, 1161, 1160, N'Gggf', CAST(0x0000A786014DFCED AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (43, 1128, 1117, N'Hello', CAST(0x0000A786014E9C5C AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (44, 1117, 1128, N'hii', CAST(0x0000A786014EC8BF AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (45, 1128, 1116, N'Hi', CAST(0x0000A787008A820F AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (46, 1128, 1117, N'Wololo', CAST(0x0000A78700979461 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (47, 1128, 1133, N'Hello', CAST(0x0000A78700979F7A AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Chats] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (1, 1, CAST(0x0000A72000F2B3D2 AS DateTime), N'My Jacket', 1, N'Old', N'Jacket', N'1', N'2', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (2, 1, CAST(0x0000A7210152FA7B AS DateTime), N'My Jacket 11', 1, N'Old', N'Jacket 11', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (3, 1, CAST(0x0000A722012B2213 AS DateTime), N'My Jacket', 1, N'Old', N'Jacket', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (5, 1008, CAST(0x0000A72100000000 AS DateTime), N'Details', 1, N'New', N'Item 1', N'1', N'2', N'3', N'4', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (6, 1009, CAST(0x0000A72100000000 AS DateTime), N'adaasd', 1, N'asd', N'Item 2', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (7, 1008, CAST(0x0000A72100000000 AS DateTime), N'fdv', 1, N'dsf', N'Item 3', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (8, 1009, CAST(0x0000A72100000000 AS DateTime), N'xxccx', 8, N'dsfsd', N'Item 4', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (9, 1, CAST(0x0000A72C00EBE84C AS DateTime), N'My Jacket', 1, N'Old', N'Jacket', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (10, 1, CAST(0x0000A72C00ECF2A9 AS DateTime), N'My Jacket', 1, N'Used', N'Jacket', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (11, 1, CAST(0x0000A72C00ECFCC0 AS DateTime), N'My Jacket', 1, N'New', N'Jacket', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (12, 2, CAST(0x0000A72C0104576F AS DateTime), N'Hshwhw', 3, N'New', N'Hwhhw', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (13, 2, CAST(0x0000A72F00B3A7EC AS DateTime), N'good conditions', 3, N'New', N'laptop', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (14, 2, CAST(0x0000A72F00B3A906 AS DateTime), N'good conditions', 3, N'New', N'laptop', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (15, 2, CAST(0x0000A72F00B3EB5D AS DateTime), N'good', 3, N'New', N'laptop', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (16, 2, CAST(0x0000A73D015EA3D4 AS DateTime), N'Item description ', 3, N'New', N'some item', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (17, 2, CAST(0x0000A73D0162714B AS DateTime), N'Some description', 3, N'Old', N'item', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (18, 1055, CAST(0x0000A73D01653EDC AS DateTime), N'Laptop 1 description ', 6, N'New', N'laptop 1', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (19, 1059, CAST(0x0000A73F01522D31 AS DateTime), N'Handsfree', 7, N'Old', N'item with picture', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (20, 1059, CAST(0x0000A73F0154AE0C AS DateTime), N'Handsfree', 5, N'New', N'item image', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (21, 1059, CAST(0x0000A73F01562251 AS DateTime), N'
2 images ', 5, N'Old', N'item with image', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (22, 1059, CAST(0x0000A73F0156ABFB AS DateTime), N'
2 images', 7, N'Old', N'item with images', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (23, 1059, CAST(0x0000A73F015767FB AS DateTime), N'This is an item that has 4 images', 5, N'Old', N'item 4 images', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (24, 1059, CAST(0x0000A73F0157C186 AS DateTime), N'This is an item that has 4 images', 5, N'Old', N'item 4 images', N'1', N'2', N'3', N'4', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (25, 1060, CAST(0x0000A73F015C1F7B AS DateTime), N'Description', 3, N'New', N'Item Title', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (26, 1060, CAST(0x0000A73F015E9DD9 AS DateTime), N'Very New Item', 6, N'New', N'New Item', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (27, 1062, CAST(0x0000A7420134B821 AS DateTime), N'This is a used wagon r', 7, N'Old', N'Car', N'1', N'2', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (28, 1072, CAST(0x0000A7420137AD3A AS DateTime), N'This is a key', 7, N'New', N'key', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (29, 1070, CAST(0x0000A742014996F2 AS DateTime), N'Describe', 3, N'New', N'newItem', N'1', N'2', N'3', N'4', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (30, 1070, CAST(0x0000A742014BB0E5 AS DateTime), N'DescN', 1, N'New', N'ItemN', N'1', N'2', N'3', N'4', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (31, 1070, CAST(0x0000A74201528736 AS DateTime), N'', 3, N'New', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (32, 1075, CAST(0x0000A744007FFBB1 AS DateTime), N'leather jacket', 3, N'Old', N'jacket', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (33, 1075, CAST(0x0000A74400807754 AS DateTime), N'shsh', 3, N'New', N'tesh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (34, 1075, CAST(0x0000A74400A3946A AS DateTime), N'thanks', 3, N'Old', N'5', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (35, 1075, CAST(0x0000A74400A93A32 AS DateTime), N'has', 3, N'Old', N'jacket', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (36, 1075, CAST(0x0000A74400A956B5 AS DateTime), N'hshsh', 3, N'Old', N'nsns', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (37, 1073, CAST(0x0000A744013B9C10 AS DateTime), N'Test item ', 7, N'New', N'tesr', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (38, 1073, CAST(0x0000A744013C951E AS DateTime), N'Hshshe', 7, N'New', N'hehshd', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (39, 1073, CAST(0x0000A744013CA9EB AS DateTime), N'Djd', 11, N'Old', N'jsjdj', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (40, 1075, CAST(0x0000A74501283DFD AS DateTime), N'iem', 1, N'Old', N'add', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (41, 1075, CAST(0x0000A74501288115 AS DateTime), N'hb', 1, N'Old', N'add', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (42, 1075, CAST(0x0000A7450128BD32 AS DateTime), N'item', 1, N'Old', N'add', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (43, 1075, CAST(0x0000A7450128E700 AS DateTime), N'itemsfeh', 1, N'Old', N'ite', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (44, 1075, CAST(0x0000A7450129499B AS DateTime), N'gg', 3, N'Old', N'the', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (45, 1074, CAST(0x0000A745012B27F7 AS DateTime), N'gghr', 3, N'Old', N'nabee', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (46, 1077, CAST(0x0000A748007F5CEA AS DateTime), N'desc', 5, N'New', N'title', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (47, 1073, CAST(0x0000A74800E76646 AS DateTime), N'New wagon r', 7, N'New', N'waggy', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (48, 1073, CAST(0x0000A74800E82CFC AS DateTime), N'Waggyyy', 6, N'New', N'waggy', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (49, 1073, CAST(0x0000A74800E8C400 AS DateTime), N'Wagon r used white color ', 7, N'Old', N'Used white car', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (50, 1073, CAST(0x0000A74800EB0CAD AS DateTime), N'Car', 5, N'New', N'another car', N'1', N'2', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (51, 1073, CAST(0x0000A74800ED641D AS DateTime), N'Test item with 3 pictures', 7, N'New', N'Item', N'1', N'2', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (52, 1073, CAST(0x0000A74800F0585E AS DateTime), N'Another test description ', 7, N'New', N'testt', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (53, 1081, CAST(0x0000A74800F5B7A7 AS DateTime), N'Laptop with code picture', 6, N'New', N'laptop', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (54, 1080, CAST(0x0000A7490072B8F0 AS DateTime), N'mobile description', 5, N'New', N'mobile', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (55, 1080, CAST(0x0000A74900993CED AS DateTime), N'description', 7, N'New', N'disk', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (56, 1077, CAST(0x0000A749009A054F AS DateTime), N'des', 8, N'New', N'title', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (57, 1074, CAST(0x0000A74A0005B453 AS DateTime), N'tt', 6, N'New', N'yg', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (58, 1073, CAST(0x0000A74A010E6EC2 AS DateTime), N'New car', 11, N'New', N'car', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (59, 1075, CAST(0x0000A74A013EC1A2 AS DateTime), N'hsh', 8, N'New', N'hsb', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (60, 1099, CAST(0x0000A74C0060D410 AS DateTime), N'sbbsvvs', 5, N'New', N'bsbs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (61, 1099, CAST(0x0000A74C0060D9DD AS DateTime), N'sbbsvvs', 5, N'Old', N'bsbs', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (62, 1099, CAST(0x0000A74C0060DA73 AS DateTime), N'sbbsvvs', 5, N'Old', N'bsbs', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (63, 1099, CAST(0x0000A74C0060DE35 AS DateTime), N'sbbsvvs', 5, N'Old', N'bsbs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (64, 1099, CAST(0x0000A74C0060DF44 AS DateTime), N'sbbsvvs', 5, N'Old', N'bsbs', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (65, 1075, CAST(0x0000A74C01604D84 AS DateTime), N'ty', 1, N'New', N'tt', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (66, 1100, CAST(0x0000A74D00C6E650 AS DateTime), N'I want to swap my new jacket.', 3, N'New', N'Jacket', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (67, 1102, CAST(0x0000A74D01021F33 AS DateTime), N'leather made', 3, N'New', N'Coat', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (68, 1103, CAST(0x0000A74D0117F011 AS DateTime), N'sfgncxx', 1, N'New', N'blabla', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (69, 1074, CAST(0x0000A74D013AA620 AS DateTime), N'hu', 3, N'New', N'huh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (70, 1074, CAST(0x0000A74E00A2FB23 AS DateTime), N'hdhshhszhbbs. shuwb. whiwb wjis w bsji w jaija ', 7, N'New', N'hahjwhhzh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (71, 1074, CAST(0x0000A74F0062BAF5 AS DateTime), N'hhh', 6, N'New', N'hii', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (72, 1074, CAST(0x0000A74F0062DFF7 AS DateTime), N'hhh', 5, N'New', N'yuh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (73, 1074, CAST(0x0000A750010BB88C AS DateTime), N'Koda', 3, N'New', N'sdfjlsdfk', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (74, 1074, CAST(0x0000A7520120F8B3 AS DateTime), N'zhahs', 3, N'New', N'nsjnsns', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (75, 1109, CAST(0x0000A752012AE916 AS DateTime), N'Item description ', 6, N'New', N'item', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (76, 1113, CAST(0x0000A7520154C1F9 AS DateTime), N'new', 3, N'New', N'Red coat', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (77, 1102, CAST(0x0000A75A01365351 AS DateTime), N'4s', 5, N'New', N'Samsung', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (78, 1102, CAST(0x0000A75A01381D89 AS DateTime), N'abc', 5, N'New', N'abc', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (79, 1102, CAST(0x0000A75A013BD76C AS DateTime), N'one', 5, N'New', N'my item', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (80, 1102, CAST(0x0000A75A013C4F12 AS DateTime), N'5s', 5, N'New', N'iPhone', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (81, 1102, CAST(0x0000A75A014F5410 AS DateTime), N'hello ', 5, N'New', N'phone', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (82, 1116, CAST(0x0000A766011F1618 AS DateTime), N'2 books to swop', 10, N'New', N'Books', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (83, 1116, CAST(0x0000A766012FC815 AS DateTime), N'New cycle', 7, N'New', N'Cycle', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (84, 1116, CAST(0x0000A76601301749 AS DateTime), N'Multi colored car keys cover', 5, N'Old', N'Cary key cover', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (85, 1117, CAST(0x0000A7680128411D AS DateTime), N'New xiomi Handsfree', 7, N'New', N'Handsfree', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (86, 1118, CAST(0x0000A7680136D5F3 AS DateTime), N'Edifier headphone Bluetooth', 7, N'New', N'headphones', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (87, 1119, CAST(0x0000A7680144978C AS DateTime), N'kakaaaa', 3, N'New', N'item1', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (88, 1122, CAST(0x0000A769010BB809 AS DateTime), N'Affoltern', 10, N'New', N'Pictures', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (89, 1123, CAST(0x0000A769010E6CC2 AS DateTime), N'Pictures', 1, N'New', N'Images', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (90, 1124, CAST(0x0000A76B012DD0FA AS DateTime), N'shaffon cloth with net upper ', 3, N'New', N'Black Dress', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (91, 1126, CAST(0x0000A76B0130CE01 AS DateTime), N'shaffon cloth', 3, N'New', N'Black Dress', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (92, 1125, CAST(0x0000A76B0136F0DA AS DateTime), N'Nokia lumia 520', 5, N'New', N'Nokia lumia', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (93, 1126, CAST(0x0000A76B01483BC8 AS DateTime), N'bridal dress', 3, N'New', N'Bridal dress', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (94, 1128, CAST(0x0000A774012EBDD9 AS DateTime), N'Some random spray ', 7, N'New', N'spray', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (95, 1128, CAST(0x0000A774012F0B37 AS DateTime), N'New Tyre', 7, N'New', N'car Tyre', N'1', N'2', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (96, 1131, CAST(0x0000A77A00FAFDF6 AS DateTime), N'bridal shower cake', 8, N'New', N'cake', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (97, 1131, CAST(0x0000A77A00FAFFF5 AS DateTime), N'bridal shower cake', 8, N'New', N'cake', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (98, 1132, CAST(0x0000A77A01063F62 AS DateTime), N'Classy notebook', 10, N'Old', N'Notebook', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (99, 1133, CAST(0x0000A77A0107AE26 AS DateTime), N'classy notebooj', 10, N'Old', N'notebook', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (100, 1133, CAST(0x0000A77A010A5F9E AS DateTime), N'i3 hp laptop', 6, N'Old', N'hp laptop', N'1', N'', N'', N'', N'')
GO
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (101, 1134, CAST(0x0000A77A012DD1D7 AS DateTime), N'acer laptop', 6, N'New', N'laptop', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (102, 1134, CAST(0x0000A77A01331F8C AS DateTime), N'wire extension', 7, N'Old', N'Extension', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (103, 1133, CAST(0x0000A77A01502E5C AS DateTime), N'item', 6, N'New', N'item', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (104, 1133, CAST(0x0000A77A01503446 AS DateTime), N'item', 6, N'New', N'item', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (105, 1133, CAST(0x0000A77A0150392A AS DateTime), N'item', 6, N'New', N'item', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (106, 1133, CAST(0x0000A77A015039BB AS DateTime), N'item', 6, N'New', N'item', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (107, 1134, CAST(0x0000A77A0150BE52 AS DateTime), N'item 2', 6, N'New', N'item2', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (108, 1132, CAST(0x0000A77B0123DC7E AS DateTime), N'laptop 1', 6, N'New', N'laptop 1', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (109, 1137, CAST(0x0000A77D014F4AC0 AS DateTime), N'desc01', 1, N'New', N'title01', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (110, 1142, CAST(0x0000A77D014F775B AS DateTime), N'vbzbzbz', 6, N'New', N'bshs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (111, 1142, CAST(0x0000A77D014F7C4D AS DateTime), N'vbzbzbz', 6, N'New', N'bshs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (112, 1142, CAST(0x0000A77D014F82BA AS DateTime), N'vbzbzbz', 6, N'New', N'bshs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (113, 1142, CAST(0x0000A77D014FC1A5 AS DateTime), N'sbzbbz', 6, N'New', N'hzhsh', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (114, 1142, CAST(0x0000A77D014FF250 AS DateTime), N'avavs', 6, N'New', N'hshsg', N'1', N'', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (115, 1137, CAST(0x0000A77D01514FED AS DateTime), N'phase01-desc02', 5, N'New', N'phase01-item02', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (116, 1137, CAST(0x0000A77D0157D02E AS DateTime), N'phase01-desc03', 7, N'New', N'phase01-item03', N'1', N'2', N'3', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (117, 1142, CAST(0x0000A77D015B06D6 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (118, 1142, CAST(0x0000A77D015B09C9 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (119, 1142, CAST(0x0000A77D015B0C7F AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (120, 1142, CAST(0x0000A77D015B10BA AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (121, 1142, CAST(0x0000A77D015B12B9 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (122, 1142, CAST(0x0000A77D015B12DE AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (123, 1142, CAST(0x0000A77D015B1544 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (124, 1139, CAST(0x0000A77D015B1793 AS DateTime), N'phase02-desc01', 10, N'New', N'phase02-item01', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (125, 1142, CAST(0x0000A77D015B181F AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (126, 1142, CAST(0x0000A77D015B1992 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (127, 1142, CAST(0x0000A77D015B1AC3 AS DateTime), N'dbsbsb', 6, N'New', N'bzbsh', N'', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (128, 1139, CAST(0x0000A77D015B6C10 AS DateTime), N'phase02-desc02', 7, N'New', N'phase02-item02', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (129, 1145, CAST(0x0000A77D0166395F AS DateTime), N'bahshshsh', 6, N'New', N'hshshs', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (130, 1145, CAST(0x0000A77D016B6331 AS DateTime), N'bshshbsbs', 6, N'New', N'item2', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (131, 1152, CAST(0x0000A77E00DB18B1 AS DateTime), N'Rayban', 1, N'New', N'Sunglasses', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (132, 1152, CAST(0x0000A77E00DB51D3 AS DateTime), N'Apple', 7, N'New', N'Earphones', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (133, 1152, CAST(0x0000A77E00DB556A AS DateTime), N'Apple', 7, N'New', N'Earphones', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (134, 1153, CAST(0x0000A77E00DCFB2C AS DateTime), N'Swiss', 8, N'New', N'Bottle', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (135, 1153, CAST(0x0000A77E00DD36AE AS DateTime), N'White', 10, N'New', N'Book ', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (136, 1154, CAST(0x0000A77E01341757 AS DateTime), N' abababb', 6, N'New', N'baahbaba', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (137, 1155, CAST(0x0000A77E013973AF AS DateTime), N'bsjshabab', 3, N'Old', N'black', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (138, 1155, CAST(0x0000A77E013982C1 AS DateTime), N'bsjshabab', 3, N'Old', N'black', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (139, 1154, CAST(0x0000A77E013C0A12 AS DateTime), N'bsnanabbs', 5, N'New', N'item-01', N'1', N'2', N'3', N'4', N'5')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (140, 1154, CAST(0x0000A77E013FBF28 AS DateTime), N'bahaahavv', 6, N'New', N'item-02', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (141, 1155, CAST(0x0000A77E013FF899 AS DateTime), N'hahaavwv', 5, N'New', N'item03', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (142, 1155, CAST(0x0000A77E0140022C AS DateTime), N'hahaavwv', 5, N'New', N'item03', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (143, 1128, CAST(0x0000A78300F739DC AS DateTime), N'Carr', 7, N'New', N'carr', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (144, 1139, CAST(0x0000A7840114DD8B AS DateTime), N'white', 5, N'New', N'iPhone', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (145, 1128, CAST(0x0000A786011B7664 AS DateTime), N'Car dashboard with knobs and stuff', 7, N'New', N'car dashboard', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (146, 1160, CAST(0x0000A786011E398A AS DateTime), N'Car cleaner', 7, N'New', N'cleaner', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (147, 1160, CAST(0x0000A786011E715A AS DateTime), N'Gas cylinder', 7, N'New', N'cylinder', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (148, 1161, CAST(0x0000A786011ECE8E AS DateTime), N'Car white', 5, N'New', N'carr', N'1', N'', N'', N'', N'')
INSERT [dbo].[Items] ([Id], [User_Id], [PostDate], [Details], [Category_Id], [Condition], [Name], [Image1], [Image2], [Image3], [Image4], [Image5]) VALUES (149, 1161, CAST(0x0000A786014CD982 AS DateTime), N'New steering wheel', 7, N'New', N'steering wheel', N'1', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (1, 1, 1008, 7)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (2, 1116, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (3, 1116, 1128, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (4, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (5, 1, 1008, 7)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (6, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (7, 1117, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (8, 1117, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (9, 1116, 1128, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (10, 1116, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (11, 1117, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (12, 1116, 1128, 2)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (13, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (14, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (15, 1131, 1131, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (16, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (17, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (18, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (19, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (20, 1131, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (21, 1131, 1134, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (22, 1131, 1134, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (23, 1131, 1134, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (24, 1131, 1134, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (25, 1134, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (26, 1131, 1134, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (27, 1131, 1134, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (28, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (29, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (30, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (31, 1117, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (32, 1116, 1128, 0)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (33, 1132, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (34, 1132, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (35, 1132, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (36, 1132, 1133, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (37, 1133, 1132, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (38, 1153, 1152, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (39, 1154, 1155, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (40, 1154, 1155, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (41, 1154, 1155, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (42, 1137, 1139, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (43, 1133, 1128, 0)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (44, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (45, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (46, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (47, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (48, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (49, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (50, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (51, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (52, 1133, 1132, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (53, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (54, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (55, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (56, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (57, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (58, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (59, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (60, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (61, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (62, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (63, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (64, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (65, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (66, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (67, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (68, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (69, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (70, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (71, 1133, 1132, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (72, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (73, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (74, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (75, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (76, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (77, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (78, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (79, 1133, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (80, 1116, 1117, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (81, 1117, 1117, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (82, 1117, 1117, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (83, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (84, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (85, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (86, 1133, 1132, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (87, 1160, 1161, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (88, 1116, 1128, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (89, 1116, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (90, 1117, 1128, 3)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (91, 1133, 1128, 2)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (92, 1133, 1128, 2)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[RedeemCoins] ON 

INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (1, N'Umar', 100000, N'JS', N'78383', CAST(0xD03C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (2, N'Umar1', 120000, N'JS', N'78353', CAST(0xD03C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (3, N'Umar', 100000, N'JS', N'78383', CAST(0xD03C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (4, N'Jazin', 45, N'Gahsshsb', N'45888', CAST(0xD03C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (5, N'Jazib', 45, N'Hshsbs', N'77888', CAST(0xD03C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (6, N'nabeel', 10000, N'Kaka', N'01277', CAST(0xD13C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (7, N'nabeel', 12234, N'Akf', N'12412', CAST(0xD13C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (8, N'johnk', 0, N'askari', N'04318', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (9, N'john', 0, N'askari', N'04546', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (10, N'john', 0, N'askari', N'04546', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (11, N'javy', 0, N'Askari', N'73737', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (12, N'Sami', 0, N'Askari', N'82727', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (13, N'Sami', 0, N'askari', N'54346', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (14, N'Sami', 0, N'Askari', N'72726', CAST(0xD53C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (15, N'aajd', 182, N'Bank', N'12489', CAST(0xD63C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (16, N'efjfh', 18, N'sajsg', N'30482', CAST(0xD63C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (17, N'Vbnn', 0, N'Ggvv', N'128', CAST(0xD73C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[RedeemCoins] OFF
SET IDENTITY_INSERT [dbo].[SwopRequests] ON 

INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (6, 1008, 1009, N'Pending', CAST(0x0000A76401293A2F AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (7, 1075, 1074, N'Accept', CAST(0x0000A765009C94E3 AS DateTime), N'', N'45', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (8, 1081, 1073, N'Pending', CAST(0x0000A76600AE0C20 AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (9, 1008, 1009, N'Pending', CAST(0x0000A76600AE1C62 AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (10, 1008, 1073, N'Pending', CAST(0x0000A76600AE36E1 AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (11, 1081, 1073, N'Pending', CAST(0x0000A76600BB84E4 AS DateTime), N'', N'37', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (12, 1059, 1062, N'Pending', CAST(0x0000A76600D3CC54 AS DateTime), N'', N'27', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (13, 1059, 1062, N'Pending', CAST(0x0000A76600D58F2B AS DateTime), N'', N'27', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (14, 1059, 1080, N'Pending', CAST(0x0000A76600D5B606 AS DateTime), N'', N'54', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (15, 1074, 1075, N'Accept', CAST(0x0000A76600D9C229 AS DateTime), N'', N'32', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (16, 1073, 1075, N'Pending', CAST(0x0000A76600E3482D AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (17, 1075, 1073, N'Pending', CAST(0x0000A76600E35CFF AS DateTime), N'', N'6,8', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (18, 1061, 1059, N'Pending', CAST(0x0000A766011BEC7D AS DateTime), N'', N'23', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (19, 1061, 1055, N'Pending', CAST(0x0000A766011C2781 AS DateTime), N'', N'18', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (20, 1115, 1116, N'Accept', CAST(0x0000A766011F8543 AS DateTime), N'', N'82', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (21, 1073, 1116, N'Reject', CAST(0x0000A7660130711B AS DateTime), N'', N'83', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (22, 1073, 1116, N'Pending', CAST(0x0000A767012569D6 AS DateTime), N'', N'82', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (23, 1074, 1074, N'Accept', CAST(0x0000A767015B0B27 AS DateTime), N'', N'45', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (24, 1074, 1074, N'Reject', CAST(0x0000A767015B4799 AS DateTime), N'', N'70', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (25, 1074, 1074, N'Pending', CAST(0x0000A767015BB4E1 AS DateTime), N'', N'57', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (26, 1073, 1073, N'Pending', CAST(0x0000A7670174CB82 AS DateTime), N'', N'48', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (27, 1073, 1116, N'Accept', CAST(0x0000A7670176C226 AS DateTime), N'', N'84', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (28, 1073, 1116, N'Pending', CAST(0x0000A7680126FA5A AS DateTime), N'48', N'83', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (29, 1073, 1116, N'Pending', CAST(0x0000A76801275748 AS DateTime), N'48', N'83', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (30, 1117, 1116, N'Reject', CAST(0x0000A76801286178 AS DateTime), N'85', N'82', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (31, 1116, 1117, N'Accept', CAST(0x0000A7680128A149 AS DateTime), N'83', N'85', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (32, 1075, 1075, N'Pending', CAST(0x0000A76801298186 AS DateTime), N'34', N'45', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (33, 1117, 1073, N'Pending', CAST(0x0000A768012FE80F AS DateTime), N'85', N'58', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (34, 1116, 1116, N'Pending', CAST(0x0000A7680135BB51 AS DateTime), N'82', N'85', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (35, 1118, 1117, N'Pending', CAST(0x0000A76801371BCA AS DateTime), N'86', N'85', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (36, 1117, 1117, N'Accept', CAST(0x0000A7680141308B AS DateTime), N'85', N'86', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (37, 1117, 1117, N'Accept', CAST(0x0000A768014156C7 AS DateTime), N'85', N'86', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (38, 1117, 1118, N'Pending', CAST(0x0000A76801418C30 AS DateTime), N'85', N'86', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (39, 1117, 1118, N'Pending', CAST(0x0000A7680142B370 AS DateTime), N'85', N'86', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (40, 1125, 1126, N'Accept', CAST(0x0000A76B01379C89 AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (41, 1125, 1126, N'Accept', CAST(0x0000A76B013B9F98 AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (42, 1125, 1126, N'Pending', CAST(0x0000A76B013D083B AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (43, 1125, 1126, N'Pending', CAST(0x0000A76B013D0971 AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (44, 1125, 1126, N'Pending', CAST(0x0000A76B013D14FF AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (45, 1125, 1126, N'Pending', CAST(0x0000A76B013D4A02 AS DateTime), N'92', N'91', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (46, 1122, 1100, N'Pending', CAST(0x0000A76C013F70AA AS DateTime), N'88', N'66', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (47, 1122, 1100, N'Pending', CAST(0x0000A76C013F7FF4 AS DateTime), N'88', N'66', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (48, 1122, 1123, N'Pending', CAST(0x0000A76C013FB0B3 AS DateTime), N'88', N'89', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (49, 1073, 1073, N'Pending', CAST(0x0000A76D01266B77 AS DateTime), N'37', N'58', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (50, 1126, 1125, N'Pending', CAST(0x0000A76D012971CE AS DateTime), N'91', N'92', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (51, 1073, 1116, N'Pending', CAST(0x0000A77300EF034F AS DateTime), N'38', N'83,84', NULL, NULL)
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (52, 1008, 1009, N'Pending', CAST(0x0000A773014879D5 AS DateTime), N'5,7', N'6,8', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (53, 1008, 1009, N'Pending', CAST(0x0000A7730148C415 AS DateTime), N'7', N'8', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (54, 1008, 1009, N'Pending', CAST(0x0000A7730149E93E AS DateTime), N'', N'6,8', N'Coin', N'400')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (55, 1073, 1126, N'Pending', CAST(0x0000A77400FB1CF8 AS DateTime), N'', N'93', N'Coin', N'10')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (56, 1073, 1081, N'Pending', CAST(0x0000A77400FB4728 AS DateTime), N'', N'53', N'Coin', N'10')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (57, 1116, 1128, N'Accept', CAST(0x0000A774012F573D AS DateTime), N'82', N'94,95', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (58, 1117, 1128, N'Accept', CAST(0x0000A77401391FC0 AS DateTime), N'', N'94', N'Coin', N'50')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (59, 1074, 1075, N'Pending', CAST(0x0000A7740150E346 AS DateTime), N'', N'59', N'Coin', N'280')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (60, 1074, 1075, N'Pending', CAST(0x0000A7750136AD8C AS DateTime), N'57', N'59', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (61, 1074, 1075, N'Pending', CAST(0x0000A7750139325A AS DateTime), N'57', N'32,33,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (62, 1074, 1075, N'Pending', CAST(0x0000A77501395765 AS DateTime), N'', N'40', N'Coin', N'10')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (63, 1126, 1109, N'Pending', CAST(0x0000A777015D401B AS DateTime), N'91', N'75', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (64, 1126, 1109, N'Pending', CAST(0x0000A777015D7C21 AS DateTime), N'93', N'75', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (65, 1126, 1109, N'Pending', CAST(0x0000A777015D8BC4 AS DateTime), N'', N'75', N'Coin', N'20')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (66, 1131, 1131, N'Accept', CAST(0x0000A77A01068088 AS DateTime), N'96', N'96', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (67, 1131, 1133, N'Accept', CAST(0x0000A77A0107F833 AS DateTime), N'96', N'99', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (68, 1133, 1131, N'Pending', CAST(0x0000A77A0108834F AS DateTime), N'99', N'96', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (69, 1131, 1133, N'Accept', CAST(0x0000A77A0109A1C0 AS DateTime), N'97', N'99', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (70, 1131, 1133, N'Accept', CAST(0x0000A77A010A9235 AS DateTime), N'96', N'99,100', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (71, 1131, 1133, N'Reject', CAST(0x0000A77A010B71D7 AS DateTime), N'97', N'99,100', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (72, 1131, 1133, N'Accept', CAST(0x0000A77A010B8C6E AS DateTime), N'', N'100', N'Coin', N'35')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (73, 1131, 1134, N'Reject', CAST(0x0000A77A012E011A AS DateTime), N'96', N'101', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (74, 1134, 1125, N'Pending', CAST(0x0000A77A01378419 AS DateTime), N'101', N'92,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (75, 1134, 1131, N'Pending', CAST(0x0000A77A01386778 AS DateTime), N'101', N'96,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (76, 1134, 1133, N'Accept', CAST(0x0000A77A0139C12E AS DateTime), N'', N'99', N'Coin', N'32')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (77, 1128, 1081, N'Pending', CAST(0x0000A77B00738F7D AS DateTime), N'95', N'53', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (78, 1132, 1134, N'Pending', CAST(0x0000A77B01239ADE AS DateTime), N'98', N'101', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (79, 1132, 1134, N'Pending', CAST(0x0000A77B0123F6D3 AS DateTime), N'108', N'102', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (80, 1132, 1133, N'Reject', CAST(0x0000A77B01247315 AS DateTime), N'108', N'103', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (81, 1132, 1124, N'Pending', CAST(0x0000A77B012C959B AS DateTime), N'98', N'90', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (82, 1132, 1133, N'Accept', CAST(0x0000A77B012DADCD AS DateTime), N'108', N'99,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (83, 1133, 1134, N'Pending', CAST(0x0000A77D013F5FDA AS DateTime), N'100', N'101', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (84, 1133, 1132, N'Accept', CAST(0x0000A77D013FF87E AS DateTime), N'100', N'108', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (85, 1133, 1132, N'Accept', CAST(0x0000A77D01406EC8 AS DateTime), N'', N'108', N'Coin', N'25')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (86, 1132, 1133, N'Accept', CAST(0x0000A77D0155CF4E AS DateTime), N'98', N'104', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (87, 1132, 1133, N'Pending', CAST(0x0000A77D0157172F AS DateTime), N'98', N'99,100,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (88, 1132, 1133, N'Pending', CAST(0x0000A77D01572F22 AS DateTime), N'', N'99', N'Coin', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (89, 1132, 1126, N'Pending', CAST(0x0000A77D01591A17 AS DateTime), N'98', N'91', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (90, 1132, 1126, N'Pending', CAST(0x0000A77D01598C0A AS DateTime), N'98', N'91,93,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (91, 1132, 1126, N'Pending', CAST(0x0000A77D015A089C AS DateTime), N'108', N'91,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (92, 1142, 1117, N'Pending', CAST(0x0000A77D015A734E AS DateTime), N'110', N'85', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (93, 1142, 1117, N'Pending', CAST(0x0000A77D015A7AD0 AS DateTime), N'112', N'85', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (94, 1139, 1137, N'Pending', CAST(0x0000A77D015C7A3D AS DateTime), N'124', N'116', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (95, 1133, 1109, N'Pending', CAST(0x0000A77D015C7FD3 AS DateTime), N'99', N'75', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (96, 1139, 1137, N'Pending', CAST(0x0000A77D015D7D81 AS DateTime), N'124', N'115,116115,116', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (97, 1139, 1137, N'Pending', CAST(0x0000A77D015D7E2A AS DateTime), N'128', N'115,116115,116', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (98, 1133, 1081, N'Pending', CAST(0x0000A77D015D967B AS DateTime), N'99', N'53', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (99, 1133, 1128, N'Accept', CAST(0x0000A77D015DCCF0 AS DateTime), N'99', N'94,95', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (100, 1139, 1137, N'Pending', CAST(0x0000A77D015E20C4 AS DateTime), N'124', N'115,116', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (101, 1139, 1137, N'Pending', CAST(0x0000A77D015E213E AS DateTime), N'128', N'115,116', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (102, 1133, 1128, N'Accept', CAST(0x0000A77D015E3372 AS DateTime), N'100', N'94,95', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (103, 1132, 1133, N'Pending', CAST(0x0000A77D015F0D83 AS DateTime), N'98', N'103', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (104, 1132, 1124, N'Pending', CAST(0x0000A77D015F76AC AS DateTime), N'108', N'90', N'DS', N'')
GO
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (105, 1139, 1137, N'Pending', CAST(0x0000A77D015F82F0 AS DateTime), N'128', N'115', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (106, 1132, 1133, N'Pending', CAST(0x0000A77D015FFDFD AS DateTime), N'108', N'99,100,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (107, 1132, 1126, N'Pending', CAST(0x0000A77D0160B0B4 AS DateTime), N'98', N'91,93', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (108, 1132, 1126, N'Pending', CAST(0x0000A77D0160EAE1 AS DateTime), N'108', N'91,93', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (109, 1132, 1126, N'Pending', CAST(0x0000A77D0160F307 AS DateTime), N'98', N'91,9391,93', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (110, 1139, 1103, N'Pending', CAST(0x0000A77D0161E2A0 AS DateTime), N'128', N'68', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (111, 1139, 1113, N'Pending', CAST(0x0000A77D0162177D AS DateTime), N'128', N'76', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (112, 1139, 1113, N'Pending', CAST(0x0000A77D01621E36 AS DateTime), N'124', N'76', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (113, 1137, 1139, N'Accept', CAST(0x0000A77D0165C894 AS DateTime), N'115', N'124,128,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (114, 1137, 1139, N'Pending', CAST(0x0000A77D0165F160 AS DateTime), N'116', N'124,128,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (115, 1145, 1142, N'Pending', CAST(0x0000A77D0166440C AS DateTime), N'129', N'118', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (116, 1145, 1142, N'Pending', CAST(0x0000A77D016651AC AS DateTime), N'129', N'110,111,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (117, 1145, 1109, N'Pending', CAST(0x0000A77D0169AD07 AS DateTime), N'129', N'75,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (118, 1145, 1109, N'Pending', CAST(0x0000A77D0169B8C8 AS DateTime), N'', N'75', N'Coin', N'32')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (119, 1145, 1134, N'Pending', CAST(0x0000A77D016B2789 AS DateTime), N'129', N'101,102,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (120, 1145, 1134, N'Pending', CAST(0x0000A77D016C0726 AS DateTime), N'130', N'101,102,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (121, 1132, 1126, N'Pending', CAST(0x0000A77D016D26FB AS DateTime), N'98', N'93', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (122, 1145, 1134, N'Pending', CAST(0x0000A77D016D59F9 AS DateTime), N'129', N'102', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (123, 1145, 1131, N'Pending', CAST(0x0000A77D017680D1 AS DateTime), N'129', N'96,97,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (124, 1147, 1131, N'Pending', CAST(0x0000A77D01791AF3 AS DateTime), N'', N'96', N'Coin', N'25')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (125, 1153, 1152, N'Accept', CAST(0x0000A77E00DDE96A AS DateTime), N'134', N'131', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (126, 1153, 1152, N'Pending', CAST(0x0000A77E00E15FB9 AS DateTime), N'134', N'131,132,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (127, 1154, 1145, N'Pending', CAST(0x0000A77E0134E51E AS DateTime), N'136', N'130', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (128, 1154, 1145, N'Pending', CAST(0x0000A77E013502A8 AS DateTime), N'136', N'129,130,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (129, 1154, 1145, N'Pending', CAST(0x0000A77E01351128 AS DateTime), N'', N'130', N'Coin', N'32')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (130, 1155, 1133, N'Pending', CAST(0x0000A77E013B33D0 AS DateTime), N'137', N'99', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (131, 1155, 1133, N'Pending', CAST(0x0000A77E013B6143 AS DateTime), N'137', N'99,100', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (132, 1155, 1133, N'Pending', CAST(0x0000A77E013B7505 AS DateTime), N'', N'99', N'Coin', N'32')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (133, 1154, 1155, N'Accept', CAST(0x0000A77E013C2DFF AS DateTime), N'139', N'137', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (134, 1154, 1155, N'Accept', CAST(0x0000A77E013DC9A2 AS DateTime), N'136', N'137,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (135, 1155, 1154, N'Pending', CAST(0x0000A77E013E4CAB AS DateTime), N'137', N'139', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (136, 1154, 1145, N'Pending', CAST(0x0000A77E013EF693 AS DateTime), N'136', N'129', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (137, 1154, 1155, N'Accept', CAST(0x0000A77E0140364E AS DateTime), N'139', N'141', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (138, 1154, 1155, N'Reject', CAST(0x0000A77E01404996 AS DateTime), N'140', N'138,141,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (139, 1154, 1155, N'Reject', CAST(0x0000A77E01404EEB AS DateTime), N'139', N'138,141,', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (140, 1155, 1154, N'Pending', CAST(0x0000A77E01414610 AS DateTime), N'141', N'140', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (141, 1155, 1154, N'Pending', CAST(0x0000A77E01415A3D AS DateTime), N'141', N'139,140', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (142, 2, 1, N'Pending', CAST(0x0000A785012D1488 AS DateTime), N'13', N'1', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (143, 1128, 1081, N'Accept', CAST(0x0000A786011BA4A6 AS DateTime), N'145', N'53', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (144, 1160, 1109, N'Pending', CAST(0x0000A786011E8071 AS DateTime), N'147', N'75', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (145, 1161, 1160, N'Accept', CAST(0x0000A786011EDC0D AS DateTime), N'148', N'146', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (146, 1161, 1117, N'Pending', CAST(0x0000A786013A15B8 AS DateTime), N'148', N'85', N'Single', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (147, 1161, 1118, N'Pending', CAST(0x0000A786013A22AF AS DateTime), N'148', N'86', N'DS', N'')
INSERT [dbo].[SwopRequests] ([Id], [UserFrom_Id], [UserTo_Id], [Status], [Date], [UserFromItems], [UserToItems], [Type], [Coins]) VALUES (148, 1160, 1161, N'Accept', CAST(0x0000A786014D0703 AS DateTime), N'147', N'149', N'Single', N'')
SET IDENTITY_INSERT [dbo].[SwopRequests] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1, N'Umar Shareef 1', N'Password1', N'Jaz', N'UmarShareef@swopit.com', N'090078602', N'About 1', N'More Information 1', N'1', N'Address 1', N'73.0932', N'33.7295')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (2, N'Umar', N'Password', N'Umar', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (4, N'Umar', N'Password', N'Umar1', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (7, N'Umar', N'Password', N'Umar11', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (9, N'Umar', N'Password', N'Jazib', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (10, N'Umar', N'Password', N'Jazib2', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1008, N'Home', N'Home', N'Home', N'Home', N'Home', N'Home', N'Home', N'Home', N'Home', N'73.106227', N'33.669261')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1009, N'Near Home 1', N'password', N'Home1', N'as', N'asd', N'sad', N'sad', N'sd', N'Near Home 1', N'73.107021', N'33.671296')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1010, N'Near Home 2', N'password', N'Home2', N'zx', N'asd', N'sd', N'sd', N'sad', N'sd', N'73.106879', N'33.672335')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1011, N'Near Home 3', N'password', N'home3', N'sd', N'asd', N'dsa', N'sd', N'xz', N'dfdf', N'73.100443', N'33.680832')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1012, N'Near home 4', N'password', N'Home4', N'd', N'sdf', N'df', N'dsf', N'dfdf', N'sdf', N'73.086667', N'33.664492')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1014, N'Near home 5', N'password', N'Home5', N'ds', N'sdd', N'sd', N'sd', N'sd', N'd', N'73.111153', N'33.689050')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1015, N'Umar', N'Password', N'Jazib1', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1019, N'Umar', N'Password', N'Jazib9', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1020, N'Jazib Babar', N'password', N'jaz1', N'jazib@test.com', N'090078601', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1021, N'Jazib Babar', N'password', N'jaz2', N'jazib@test.com', N'090078601', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1023, N'Jazib Babar', N'password', N'jaz3', N'jazib@test.com', N'090078601', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1028, N'', N'', N'', N'', N'', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1029, N'Jazib', N'123', N'Jazz', N'jazib.babar@gmail.com', N'0900', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1037, N'Jazib ', N'91', N'Jazibb', N'jazib.babar@gmail.com', N'6588', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1041, N'Jazin', N'123', N'Jazz1', N'jazib.babar@gmail.com', N'31649', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1042, N'Usman', N'123456', N'u4usman', N'u4usman.ahmad@yahoo.com', N'76464', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1047, N'Jazib Babar ', N'123', N'jazzib', N'jazib.babar@gmail.com', N'3234643398', N'filler', N'filler', N'', N'filler', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1051, N'Umar1', N'Password', N'Umar1991', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1052, N'Umar1', N'Password', N'Umar19p91', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1053, N'', N'ggh55', N'Testuser', N'jazib.babar@gmail.com', N'8496764966', N'', N'', N'', N'', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1054, N'', N'wgag', N'Hahs', N'jazib.babar@gmail.com', N'64949494', N'', N'', N'', N'', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1055, N'Test User Name ', N'123', N'Test User', N'jazib.babar@gmail.com', N'64949945', N'Some about ', N'Some more', N'1055', N'Hshshxhdhhd', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1057, N'', N'123', N'User', N'jazib.babar@gmail.com', N'6464', N'', N'', N'', N'', N'33.7294', N'73.0931')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1058, N'', N'123', N'Userr', N'jazib.babar@gmail.com', N'649494', N'', N'', N'', N'', N'31.5877136', N'74.3285034')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1059, N'Jazib Babar ', N'123', N'Jazib3', N'jazib.babar@gmail.com', N'6464940', N'', N'', N'1059', N'', N'31.5877136', N'74.3285034')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1061, N'Jazib Babar', N'123', N'Jazib4', N'UmarShareef@swopit.com', N'090078602', N'About 1', N'More Information 1', N'', N'Address 1', N'73.0932', N'33.7295')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1062, N'', N'123', N'Jazib5', N'jazib.babar@gmail.com', N'649494', N'', N'', N'', N'', N'31.4819933', N'74.310952')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1067, N'', N'ld', N'louder', N'ld@ld.ld', N'+923054668078', N'', N'', N'', N'', N'31.5546', N'74.3572')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1070, N'', N'aka', N'aka', N'aka@aka.aka', N'+923054668078', N'', N'', N'', N'', N'31.5546', N'74.3572')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1071, N'', N'123', N'Jazib6', N'jazib.babar@gmail.com', N'166494', N'', N'', N'', N'', N'74.3285034', N'31.5877136')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1072, N'', N'123', N'Newjazib', N'jazib.babar@gmail.com', N'649497#7', N'', N'', N'', N'', N'74.3285034', N'31.5877136')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1073, N'Hshbxbshszbyehs', N'123', N'JazibBabar', N'jazib.babar@gmail.com', N'616494', N'Here''s BDD hehebbsbdbd ', N'Bs sb sb  give ', N'1073', N'', N'74.3285034', N'31.5877136')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1074, N'yybsbbss', N'123456', N'nabeel', N'nabeel@byzentium.com', N'test', N'ggggshb', N'tyhh hu hh hu 11', N'1074', N'yybvbs.  shhhs.  bshjs shishe. djsjs hsjs. sjsjjs s ejsjjsbs ejdjsh ehdjsbebhhs', N'74.5096005', N'32.5167466')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1075, N'nbeelhhhhcft7hcfuijvxdd77 hue jo85ed joedv u8rssi5dchi u765fhi85rdgj8 huy', N'123456', N'nabeel181', N'nabeel@byzentium.com', N'03227321642', N'123uwuwu', N'32233993b e9eienw  3o992b   ei9wh e9993h eoo2bjs9s9b28iiibeu8bhehhehehshhwhwhshhsjsjsisisoososowowisosiiisiiiì', N'1075', N'gohad pur sialkot', N'74.5096005', N'32.5167466')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1076, N'', N'123', N'JazibBabar1', N'jazib.babar@gmail.com', N'123646494', N'Foodieee', N'', N'1076', N'Lahore', N'74.3149377', N'31.4809723')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1077, N'Naveed', N'11a', N'naveed', N'nav_eedali@yahoo.com', N'56777', N'gabaha', N'gzhahhs', N'1077', N'hhhhh', N'31.5024591749827', N'74.4104055036552')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1078, N'', N'277272727', N'naveed1', N'nav@nav.com', N'677777', N'', N'', N'', N'', N'31.5024005016605', N'74.4104733132519')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1079, N'', N'a11', N'naveed2', N'aa@aa.com', N'7373737', N'', N'', N'1079', N'', N'31.5024447161998', N'74.4103920087911')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1080, N'Ali', N'11a', N'ali', N'nav@nav.com', N'', N'about', N'hhahahha', N'1080', N'address', N'31.5023274952839', N'74.4101898372866')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1081, N'Jazib', N'123', N'JazibNew', N'jazib.babar@gmail.com', N'94497', N'', N'', N'', N'', N'74.3264183', N'31.5862335')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1089, N'', N'Swapdichschoen1', N'atifghulamnabi', N'atifghulamnabi@gmail.com', N'0041779856799', N'', N'', N'1089', N'', N'47.4244129417005', N'8.49700974385445')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1099, N'komal Javier Gomez and I hain k', N'123456', N'komal', N'kom@yahoo.com', N'694081', N'vshsvvshhs bshhsvjsb sjjsb. shhs. snjs. sbjjs bbsbbs vbsjsbbs', N'jajjjjsbbbbbb bbbbbbbbvv ghar g v g, but it will wait main kch b. Han main v and a jain said', N'', N'hsvssgsbbhz s hsv shsvshsjshbsnjsjvs', N'74.5044064', N'32.5277327')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1100, N'Atif Ghulan Nabi', N'Swopdichscheon1', N'atif', N'swopit@panaceasolutions.com.pk', N'0041779856799', N'', N'', N'1100', N'', N'8.4973567', N'47.4242474')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1101, N'', N'atif123', N'Albero', N'alberto@gmail.com', N'0774546865', N'', N'', N'1101', N'', N'8.4972762', N'47.4241378')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1102, N'', N'atif1', N'atif1', N'atif1@gmail.com', N'0774546458', N'Student', N'Loves to swap items', N'1102', N'', N'8.4972762', N'47.4241378')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1103, N'Alberto Moll', N'alberto1', N'alberto1', N'alberto1@gmail.com', N'0778585456', N'Designer', N'Love to swap!', N'1103', N'Zurich', N'8.5448919', N'47.3692174')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1104, N'Anonymous', N'1234', N'$////', N'register@gmail.com', N'0779464554', N'', N'', N'1104', N'', N'8.4973818', N'47.4240142')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1105, N'test', N'123456', N'nabeel1234yu', N'nbe@yahoo.com', N'', N'hh', N'', N'1105', N'test', N'32.5277374266018', N'74.5043914486417')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1106, N'nabeel', N'yehehhs', N'nabeel1234', N'123@gamil.com', N'eihdhhh', N'hshshud. rhijd. djijd. djijd. djijd. djijd. djijd. djijd. rjjd. rjjjr. rhrh plmln pkml', N'hbh', N'1106', N'hab dhud. rhhs. ruus. rjijs jid. diid. diid. djidb ejijs. ejid. rjid. ridj', N'32.5277121132543', N'74.5042886865088')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1107, N'', N'123456', N'zain', N'aa@xx.com', N'yahbs', N'', N'', N'', N'', N'32.5276531046559', N'74.5043416601368')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1108, N'', N'123456', N'test', N'test@n.com', N'123467', N'', N'', N'', N'', N'32.5277867121925', N'74.5044351183572')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1109, N'New1bshshshzb', N'123', N'New1', N'jazib.babar@gmail.com', N'123', N'', N'', N'', N'', N'74.31174438', N'31.48093529')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1110, N'', N'wyyyw', N'baban', N'usu@yah.com', N'0300', N'', N'', N'', N'', N'32.5276817707648', N'74.5043269079872')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1112, N'New2bababssb', N'123', N'New2', N'jazib.babar@gmail.com', N'122', N'', N'', N'', N'', N'74.31174438', N'31.48093529')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1113, N'atif3', N'atif2', N'atif2', N'atif2@gmail.com', N'0775566586', N'', N'', N'1113', N'', N'8.4972762', N'47.4241378')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1114, N'abc', N'123', N'alberto123', N'aggahsh@gmail.com', N'0774567880', N'', N'', N'1114', N'', N'47.3692743705917', N'8.54486733428599')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1115, N'BrandNew', N'123', N'BrandNew', N'jazib.babar@gmail.com', N'3161', N'', N'', N'', N'', N'74.32786881', N'31.5860151')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1116, N'BrandNew1', N'123', N'BrandNew1', N'jazib.babar@gmail.com', N'6464', N'', N'', N'', N'', N'74.3282742', N'31.5877284')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1117, N'BrandNew2', N'123', N'BrandNew2', N'jazib.babar@gmail.com', N'9494', N'', N'', N'', N'', N'74.3114087', N'31.4818794')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1118, N'BrandNew3', N'123', N'BrandNew3', N'jazib.babar@gmail.com', N'123', N'', N'', N'', N'', N'74.3111337', N'31.482193')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1120, N'', N'123', N'BrandNew5', N'a@as.com', N'03054668078', N'', N'', N'', N'', N'74.297329', N'31.472903')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1121, N'Brandnew6', N'123', N'BrandNew6', N'as@as.com', N'03054668078', N'', N'', N'', N'', N'74.297329', N'31.472903')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1122, N'test01', N'test01', N'test01', N'test01@gmail.com', N'1234567', N'', N'', N'1122', N'', N'8.4972988', N'47.4242132')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1123, N'test02', N'test02', N'test02', N'test02@gmail.com', N'1234567', N'', N'', N'1123', N'', N'8.4972988', N'47.4242132')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1124, N'john', N'sammyk', N'john', N'johnk@gmail.com', N'043784664378', N'', N'', N'', N'', N'74.2892703', N'31.5149854')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1125, N'alena', N'alenam', N'alena', N'alenam@outlook.com', N'05451943844', N'', N'', N'', N'', N'74.2875335', N'31.515956')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1126, N'jimmy', N'jimmyk', N'jimmy', N'jimmyk@gmail.com', N'04046468484', N'', N'', N'', N'', N'74.2892703', N'31.5149854')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1127, N'scarlrt', N'scarlatej', N'scarlate', N'scarlate.j@gmail.com', N'455855424272', N'', N'test', N'', N'', N'74.2874805', N'31.5162252')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1128, N'Phase2', N'123', N'Phase2', N'jazib.babar@gmail.com', N'65664', N'', N'', N'', N'', N'74.3264035', N'31.5862445')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1129, N'Umar11', N'Password', N'Umar33', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1130, N'Umar11', N'Password', N'Umar34', N'Umar@swopit.com', N'090078601', N'About', N'More Information', N'', N'Address', N'73.0931', N'33.7294')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1131, N'johnk', N'johnk', N'johnk', N'johnk@gmail.com', N'034161619', N'', N'', N'', N'', N'74.2874368', N'31.5161469')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1132, N'dfrgwbdydg', N'javyk', N'javy', N'javyk@gmail.com', N'737373737', N'', N'', N'1132', N'', N'74.2905492183113', N'31.51577780365')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1133, N'aree', N'areek', N'aree', N'areek@gmail.com', N'55855685', N'', N'', N'1133', N'', N'74.2874809', N'31.5162255')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1134, N'', N'samik', N'Sami', N'samik@gmail.com', N'5262727', N'', N'', N'1134', N'', N'74.2876914185467', N'31.5161138288576')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1135, N'samawia', N'samyk', N'samawia', N'samawiamoin@gmail.com', N'87545484684', N'', N'', N'', N'', N'74.3213387', N'31.5561689')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1136, N'samawiamoin@gmail.com', N'samyk', N'samawiamoin@gmail.com', N'samawiamoin@gmail.com', N'87646464848', N'', N'', N'', N'', N'74.2900037', N'31.5175123')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1137, N'phase01', N'phase01', N'phase01', N'phase01@gmail.com', N'1234567', N'Student', N'Like swopping', N'1137', N'Zurich', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1138, N'abc01', N'abc01', N'abc01', N'agahah@gmail.com', N'9446644', N'', N'', N'1138', N'', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1139, N'phase02', N'phase02', N'phase02', N'phase02@gmail.com', N'4554319484', N'Like Swopping01', N'01', N'1139', N'Zurich01', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1140, N'phasea', N'phasea', N'phasea', N'phasea@gmail.com', N'64648484', N'igsivjsv', N'', N'', N'uvsuvsivsjv', N'74.2874809', N'31.5162255')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1141, N'phase03', N'phase03', N'phase03', N'phase03@gmail.com', N'4545494848', N'', N'', N'1141', N'', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1142, N'phase3 ', N'phase3', N'phase3 ', N'phase3@gmail.com', N'94458484', N'', N'', N'1142', N'', N'74.2874809', N'31.5162255')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1143, N'phase04', N'phase04', N'phase04', N'phase04@gmail.com', N'5535585', N'', N'', N'', N'', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1144, N'phase05', N'phase05', N'phase05', N'phase05@gmail.com', N'45464655', N'', N'', N'', N'', N'8.4972058', N'47.4242201')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1145, N'', N'phase8', N'phase8', N'phase8@gmail.com', N'762625', N'', N'', N'', N'', N'74.2874719007352', N'31.5161462451134')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1146, N'', N'abcd', N'abcd', N'abcd@a.com', N'123456', N'', N'', N'', N'', N'-122.406417', N'37.785834')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1147, N'', N'phase9', N'phase9', N'phase9@gmail.com', N'827266', N'', N'', N'', N'', N'74.2874114812117', N'31.5161494462308')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1148, N'', N'pahse10', N'phase10', N'phase10@gmail.com', N'6277282', N'', N'', N'', N'', N'74.2900916135743', N'31.5158379967611')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1149, N'', N'kaka', N'shy', N'shy@shy.com', N'12345', N'', N'', N'', N'', N'-122.406417', N'37.785834')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1150, N'', N'phase11', N'phase11', N'phase11@gmail.com', N'72736626', N'', N'', N'', N'', N'74.2874130112354', N'31.5161496426654')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1151, N'', N'abcde', N'abcde', N'a@a1.com', N'24332423', N'', N'', N'', N'', N'-122.406417', N'37.785834')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1152, N'gallary01', N'gallary01', N'gallary01', N'gallary01@gmail.com', N'55756856588', N'art', N'and design', N'', N'zurich01', N'8.5449497', N'47.3692516')
GO
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1153, N'gallary02', N'gallary02', N'gallary02', N'gallary02@gmail.com', N'2346899643', N'Student', N'UZH', N'', N'Zurich', N'8.54490280803525', N'47.3692693096685')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1154, N'', N'samina', N'samina', N'samina@gmail.com', N'72626277', N'', N'', N'', N'', N'74.2875399019622', N'31.5161551178772')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1155, N'moin', N'moin', N'moin', N'moin@gmail.com', N'8464849', N'', N'', N'1155', N'', N'74.2870701', N'31.5178402')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1156, N'kevin', N'kevin', N'kevin', N'kevin@gmail.com', N'945484864', N'', N'', N'', N'', N'74.2874809', N'31.5162255')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1157, N'Testt1', N'123', N'Testt1', N'jazib.babar@gmail.com', N'656497', N'', N'', N'', N'', N'74.2360905', N'31.464824')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1158, N'Jsjs', N'123', N'Jsjs', N'jazib.babar@gmail.com', N'25646', N'', N'', N'', N'', N'74.2366064', N'31.4662915')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1159, N'Testttt', N'123', N'Testttt', N'jazib.babar@gmail.com', N'9595', N'', N'', N'', N'6466464', N'74.21426767', N'31.41208527')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1160, N'LastPhase', N'123', N'LastPhase', N'jazib.babar@gmail.com', N'646464', N'this is my bio', N'', N'', N'Gsgsvsv', N'74.23663217', N'31.33317621')
INSERT [dbo].[Users] ([Id], [Name], [Password], [Username], [Email], [Phone], [About], [MoreInfo], [PicturePath], [Address], [Longitude], [Latitude]) VALUES (1161, N'LastPhase2', N'123', N'LastPhase2', N'jazib.babar@gmail.com', N'9494', N'I''m awesome', N'', N'1161', N'Gsgss', N'74.23663217', N'31.33317621')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersAccounts] ON 

INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (1, 1, N'', N'', 300)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (2, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (3, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (4, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (5, 1130, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (6, 1008, N'', N'', 7600)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (7, 1072, N'', N'', 200)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (8, 1128, N'', N'', 160)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (9, 1131, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (10, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (11, 1133, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (12, 1134, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (13, 1134, N'', N'', 5)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (14, 60, N'', N'', 60)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (15, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (16, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (17, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (18, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (19, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (20, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (21, 1117, N'', N'', 50)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (22, 1116, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (23, 1132, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (24, 1135, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (25, 1133, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (26, 1136, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (27, 1137, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (28, 1138, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (29, 1139, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (30, 1140, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (31, 1141, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (32, 1142, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (33, 1143, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (34, 1144, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (35, 1145, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (36, 1146, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (37, 1147, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (38, 1148, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (39, 1149, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (40, 1150, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (41, 1151, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (42, 1152, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (43, 1153, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (44, 1154, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (45, 1154, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (46, 1155, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (47, 1156, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (48, 1157, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (49, 1158, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (50, 1159, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (51, 1160, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (52, 1161, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[UsersAccounts] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UniqueUsername]    Script Date: 6/3/2017 6:37:12 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UniqueUsername] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
