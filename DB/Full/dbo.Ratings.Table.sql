USE [SwopIt]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 6/14/2017 1:15:56 AM ******/
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
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (93, 1162, 1163, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (94, 1162, 1163, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (95, 1162, 1163, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (96, 1167, 1166, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (97, 1165, 1167, 2)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (98, 1163, 1162, 4)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (99, 1163, 1162, 5)
GO
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (100, 1182, 1183, 5)
INSERT [dbo].[Ratings] ([Id], [User_Id], [Rater], [Rating]) VALUES (101, 1184, 1184, 5)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
