USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddRedeemCoin]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddRedeemCoin]

@Name	NVARCHAR(200),
@Coins	float,
@BankName	NVARCHAR(200),
@AccountNumber NVARCHAR(5)

AS

INSERT INTO [dbo].[RedeemCoins]
           ([Name]
           ,[Coins]
           ,[BankName]
           ,[AccountNumber]
           ,[CreateDate])
     VALUES
           (@Name
           ,@Coins
           ,@BankName
           ,@AccountNumber
           ,GETDATE())



GO
