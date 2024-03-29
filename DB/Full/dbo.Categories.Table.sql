USE [SwopIt]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/14/2017 1:15:54 AM ******/
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
