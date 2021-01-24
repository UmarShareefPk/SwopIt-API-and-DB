USE [SwopIt]
GO
/****** Object:  Table [dbo].[RedeemCoins]    Script Date: 6/14/2017 1:15:56 AM ******/
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
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (18, N'Umar', 100000, N'JS', N'78383', CAST(0xE33C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (19, N'Atif Ghulam Nabi', 5, N'UBS', N'12345', CAST(0xE33C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (20, N'kka', 5, N'akak', N'14163', CAST(0xE73C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (21, N'kaka', 5, N'jsjs', N'23738', CAST(0xE73C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (22, N'kksk', 5, N'hsjd', N'ehjd', CAST(0xE73C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (23, N'neeli', 4, N'Askari', N'73626', CAST(0xE73C0B00 AS Date))
INSERT [dbo].[RedeemCoins] ([Id], [Name], [Coins], [BankName], [AccountNumber], [CreateDate]) VALUES (24, N'amir', 30, N'Askari', N'82626', CAST(0xE73C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[RedeemCoins] OFF
