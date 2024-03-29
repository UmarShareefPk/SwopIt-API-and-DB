USE [SwopIt]
GO
/****** Object:  Table [dbo].[UsersAccounts]    Script Date: 6/14/2017 1:15:57 AM ******/
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
SET IDENTITY_INSERT [dbo].[UsersAccounts] ON 

INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (1, 1, N'', N'', 300)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (2, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (3, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (4, 1073, N'', N'', 610)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (5, 1130, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (6, 1008, N'', N'', 7600)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (7, 1072, N'', N'', 200)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (8, 1128, N'', N'', 210)
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
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (53, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (54, 1163, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (55, 1164, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (56, 1165, N'', N'', 5)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (57, 1166, N'', N'', 200)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (58, 1167, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (59, 1168, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (60, 1169, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (61, 1170, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (62, 1171, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (63, 1172, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (64, 1172, N'', N'', 5)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (65, 1173, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (66, 1173, N'', N'', 5)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (67, 1173, N'', N'', 200)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (68, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (69, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (70, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (71, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (72, 1162, N'', N'', 25)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (73, 50, N'', N'', 50)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (74, 1174, N'', N'', 1)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (75, 1175, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (76, 1176, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (77, 1177, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (78, 1178, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (79, 1179, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (80, 1180, N'', N'', 50)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (81, 1181, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (82, 1182, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (83, 1183, N'', N'', 0)
INSERT [dbo].[UsersAccounts] ([Id], [User_Id], [Bank], [AccountNumber], [Coins]) VALUES (84, 1184, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[UsersAccounts] OFF
