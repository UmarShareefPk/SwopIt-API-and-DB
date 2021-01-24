USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddItem]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE	[dbo].[AddItem]

	@UserId int,
	@Details nvarchar(500),
	@CategoryId int,
	@Condition nvarchar(200),
	@Name nvarchar(200)
		
	AS

	DECLARE @IDs TABLE(ID INT);


INSERT INTO [dbo].[Items]
           ([User_Id]
           ,[PostDate]
           ,[Details]
           ,[Category_Id]
           ,[Condition]
           ,[Name]
           ,[Image1]
           ,[Image2]
           ,[Image3]
           ,[Image4]
           ,[Image5])
		   
		    OUTPUT inserted.ID INTO @IDs(ID)
     VALUES
           ( @UserId
           , GETDATE()
           , @Details
           , @CategoryId
           , @Condition
           , @Name
           , ''
           , ''
           , ''
           , ''
           , '')

		   SELECT ID AS ItemId FROM @IDs

GO
