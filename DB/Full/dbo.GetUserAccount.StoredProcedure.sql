USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAccount]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetUserAccount]

@UserId INT

AS

SELECT * FROM [dbo].[UsersAccounts]
WHERE	User_Id = @UserId

GO
