USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UserAvailable]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[UserAvailable]

@Username nvarchar(100)

AS

SELECT	* 
FROM	Users
WHERE	Username = @Username 


GO
