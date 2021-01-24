USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[ADDUSER]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ADDUSER] 

@Name nvarchar(150),
@Password nvarchar(50),
@Username nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(50),
@About nvarchar(500),
@MoreInfo nvarchar(500),
@PicturePath nvarchar(200),
@Address nvarchar(500),
@Longitude nvarchar(20),
@Latitude nvarchar(20)

AS

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[Users]
           ([Name]
           ,[Password]
           ,[Username]
           ,[Email]
           ,[Phone]
           ,[About]
           ,[MoreInfo]
           ,[PicturePath]
           ,[Address]
           ,[Longitude]
           ,[Latitude])

	OUTPUT inserted.ID INTO @IDs(ID)
     VALUES
           (@Name
           ,@Password
           ,@Username
           ,@Email
           ,@Phone 
           ,@About
           ,@MoreInfo
           ,@PicturePath
           ,@Address
           ,@Longitude
           ,@Latitude)


SELECT ID AS UserId FROM @IDs



GO
