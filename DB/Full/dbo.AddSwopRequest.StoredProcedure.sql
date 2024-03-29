USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddSwopRequest]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddSwopRequest]

@Sender int,
@Reciever int,
@SenderItems nvarchar(50),
@RecieverItems nvarchar(50),
@SwopType nvarchar(50),
@Coins nvarchar(50)

AS

IF  EXISTS(SELECT * FROM SwopRequests WHERE UserFrom_Id = @Sender AND UserTo_Id = @Reciever and UserFromItems = @SenderItems and UserToItems = @RecieverItems )
BEGIN
Select 'This Swop Request already exists.' AS Message
Return
END

IF  EXISTS(SELECT * FROM SwopRequests WHERE UserFrom_Id = @Sender AND UserTo_Id = @Reciever and Coins = @Coins and Coins is not null and Coins <> '' and UserToItems = @RecieverItems )
BEGIN
Select 'This Swop Request alreay exists.' AS Message
Return
END

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[SwopRequests]
           ([UserFrom_Id]
           ,[UserTo_Id]
           ,[Status]
           ,[Date]
           ,[UserFromItems]
           ,[UserToItems]
		   , [Type]
		   ,[Coins])

OUTPUT inserted.ID INTO @IDs(ID)

     VALUES
           (@Sender
           ,@Reciever
           ,'Pending'
           ,GETDATE()
           ,@SenderItems
           ,@RecieverItems
		   ,@SwopType
		   ,@Coins)

SELECT * FROM SwopRequests WHERE Id = (SELECT ID FROM @IDs)

SELECT *FROM Users WHERE Id = @Sender OR Id = @Reciever

SELECT	*
FROM	Items
WHERE	User_Id = @Sender OR User_Id = @Reciever
GO
