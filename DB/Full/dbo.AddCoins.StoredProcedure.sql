USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddCoins]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[AddCoins]

@UserId INT,
@Bank NVARCHAR(200),
@AccoutNumber NVARCHAR(20),
@Coins Float

AS

INSERT INTO [dbo].[UsersAccounts]
           ([User_Id]
           ,[Bank]
           ,[AccountNumber]
           ,[Coins])
     VALUES
           ( @UserId
           , @Bank
           , @AccoutNumber
           , @Coins)

GO
