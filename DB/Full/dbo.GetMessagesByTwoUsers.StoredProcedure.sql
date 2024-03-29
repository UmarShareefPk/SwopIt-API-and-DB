USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetMessagesByTwoUsers]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetMessagesByTwoUsers]

@User1Id int,
@User2Id int

AS

SELECT	*
FROM	Chats
WHERE	(Sender = @User1Id AND Reciever = @User2Id) OR (Sender = @User2Id AND Reciever = @User1Id)
ORDER BY	[Date] asc

SELECT * FROM Users 
WHERE	Id = @User1Id OR Id = @User2Id
GO
