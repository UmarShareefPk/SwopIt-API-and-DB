USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetUserById]

@UserId int

AS

SELECT	*
FROM	Users
WHERE	Id = @UserId

GO
