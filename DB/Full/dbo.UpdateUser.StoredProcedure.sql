USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser] 

@UserId int,
@Name nvarchar(150),
--@Password nvarchar(50),
--@Username nvarchar(100),
--@Email nvarchar(100),
@Phone nvarchar(50),
@About nvarchar(500),
@MoreInfo nvarchar(500),
--@PicturePath nvarchar(200),
@Address nvarchar(500)
--@Longitude nvarchar(20),
--@Latitude nvarchar(20)

AS



UPDATE [dbo].[Users]          
   SET [Name]   = @Name 
     -- ,[Password] = @Password 
    --  ,[Username]  = @Username 
      --,[Email] = @Email 
      ,[Phone] = @Phone 
      ,[About] = @About
      ,[MoreInfo] = @MoreInfo
     -- ,[PicturePath]  = @PicturePath 
      ,[Address]  = @Address 
    --  ,[Longitude]  = @Longitude
     -- ,[Latitude]  = @Latitude
 WHERE [Id] = @UserId

 SELECT *
 FROM	Users
 WHERE	Id = @UserId
GO
