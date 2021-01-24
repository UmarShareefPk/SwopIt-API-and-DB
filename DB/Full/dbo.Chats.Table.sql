USE [SwopIt]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 6/14/2017 1:15:55 AM ******/
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
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (48, 1162, 1163, N'Hi How are you?', CAST(0x0000A78800D94B5E AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (49, 1162, 1163, N'Hi there', CAST(0x0000A78800DE49C6 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (50, 1162, 1163, N'yes whats up?', CAST(0x0000A78800DE7167 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (51, 1163, 1162, N'Please tell me your address', CAST(0x0000A78800DEAF17 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (52, 1162, 1163, N'its this', CAST(0x0000A78800DEC76E AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (53, 1163, 1162, N'Gghgff', CAST(0x0000A78800DF4A35 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (54, 1166, 1167, N'Hello, lets meet at station for swopping.', CAST(0x0000A788016EAEC3 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (55, 1167, 1166, N'When do you want to meet and at what time ?', CAST(0x0000A788016F08CC AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (56, 1167, 1166, N'When do you want to meet and at what time ?', CAST(0x0000A788016F3DF9 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (57, 1165, 1167, N'Hi', CAST(0x0000A7880172E9EF AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (58, 1165, 1167, N'Let''s meet soon', CAST(0x0000A7880172F83C AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (59, 1165, 1167, N'ok', CAST(0x0000A78801733730 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (60, 1163, 1162, N'hi how are you?', CAST(0x0000A78B008FDF26 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (61, 1162, 1163, N'Hi', CAST(0x0000A78B008FFBC4 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (62, 1163, 1162, N'Hey', CAST(0x0000A78B00D015A8 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (63, 1163, 1162, N'fhhvg', CAST(0x0000A78B00D182BB AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (64, 1162, 1163, N'Hi', CAST(0x0000A78B00D1BE8D AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (65, 1162, 1163, N'Hello', CAST(0x0000A78B01272429 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (66, 1183, 1182, N'hello', CAST(0x0000A78F00E301AE AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (67, 1183, 1182, N'lets meet at ETH', CAST(0x0000A78F00E31B01 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (68, 1182, 1183, N'Great application', CAST(0x0000A78F00E32E1B AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (69, 1184, 1184, N'hu', CAST(0x0000A791007704D0 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (70, 1128, 1117, N'Hey', CAST(0x0000A791011C31C0 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (71, 1116, 1128, N'Hello', CAST(0x0000A791013CA251 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (72, 1008, 1009, N'This is test message from User 1008 to User 1009.', CAST(0x0000A791013F9424 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (73, 1008, 1009, N'This is test message from User 1008 to User 1009.', CAST(0x0000A79101414401 AS DateTime), 0)
INSERT [dbo].[Chats] ([Id], [Sender], [Reciever], [Message], [Date], [IsRead]) VALUES (74, 1116, 1128, N'Hi', CAST(0x0000A79101436651 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Chats] OFF
