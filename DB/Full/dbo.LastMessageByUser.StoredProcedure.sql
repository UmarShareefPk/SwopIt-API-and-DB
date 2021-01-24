USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[LastMessageByUser]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[LastMessageByUser]
@UserId  INT

AS

SELECT		TOp(1) *
FROM		Chats 
WHERE		Sender = @UserId OR Reciever = @UserId  
ORDER BY	[Date]	desc
GO
