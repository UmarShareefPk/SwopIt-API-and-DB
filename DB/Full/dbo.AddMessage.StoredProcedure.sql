USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddMessage]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddMessage]

@Sender int,
@Reciever int,
@Message nvarchar(1000)

AS

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[Chats]
           ([Sender]
           ,[Reciever]
           ,[Message]
           ,[Date]
		   ,[IsRead])

OUTPUT inserted.ID INTO @IDs(ID)

     VALUES
           (@Sender
           ,@Reciever
           ,@Message
           ,GETDATE()
		   ,0)


SELECT * FROM Chats WHERE Id = (SELECT ID FROM @IDs)

GO
