USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddContactUs]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddContactUs]

@UserId INT,
@Email NVARCHAR(100),
@Message NVARCHAR(500)

AS

INSERT INTO [dbo].[ContactUs]
           ([User_Id]
           ,[Email]
           ,[Message])
     VALUES
           ( @UserId
           , @Email
           ,@Message)

GO
