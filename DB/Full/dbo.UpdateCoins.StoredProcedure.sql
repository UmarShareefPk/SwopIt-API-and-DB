USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCoins]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[UpdateCoins]

@UserId INT,
@Coins Float

AS

IF NOT  EXISTS(SELECT * FROM UsersAccounts WHERE User_Id = @UserId )
BEGIN

INSERT INTO [dbo].[UsersAccounts]
           ([User_Id]
           ,[Bank]
           ,[AccountNumber]
           ,[Coins])
     VALUES
           (@UserId
           ,''
           ,''
           ,0)



END

UPDATE [dbo].[UsersAccounts]
   SET       
      [Coins] = @Coins
 
 WHERE User_Id = @UserId

GO
