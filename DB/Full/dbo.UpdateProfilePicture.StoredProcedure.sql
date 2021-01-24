USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateProfilePicture]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProfilePicture] 

@UserId int,
@FileName nvarchar(200)

AS

UPDATE [dbo].[Users]          
   SET [PicturePath]   = @FileName 
WHERE	[Id] = @UserId



 
GO
