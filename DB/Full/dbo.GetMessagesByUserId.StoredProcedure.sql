USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetMessagesByUserId]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetMessagesByUserId]

@UserId int

AS

SELECT	*
FROM	Chats
WHERE	Sender = @UserId OR Reciever = @UserId
ORDER BY	[Date]


GO
