USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[Login]

@Username nvarchar(100),
@Password nvarchar(50)

AS

SELECT	* 
FROM	Users
WHERE	Username = @Username AND Password = @Password


GO
