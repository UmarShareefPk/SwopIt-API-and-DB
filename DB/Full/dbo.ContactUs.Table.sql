USE [SwopIt]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 6/14/2017 1:15:55 AM ******/
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
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([Id], [User_Id], [Email], [Message]) VALUES (1, 1, N'abc@yahoo.com', N'Test Message')
INSERT [dbo].[ContactUs] ([Id], [User_Id], [Email], [Message]) VALUES (2, 1128, N'jazib.babar@gmail.com', N'Test contact message ')
INSERT [dbo].[ContactUs] ([Id], [User_Id], [Email], [Message]) VALUES (3, 1128, N'jazib.babar@gmail.com', N'Fvhhg')
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
