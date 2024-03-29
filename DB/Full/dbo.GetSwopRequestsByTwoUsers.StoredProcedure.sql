USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetSwopRequestsByTwoUsers]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetSwopRequestsByTwoUsers]

@User1Id int,
@User2Id int

AS

SELECT	*
FROM	SwopRequests
WHERE	(UserFrom_Id = @User1Id AND UserTo_Id = @User2Id) OR (UserFrom_Id = @User2Id AND UserTo_Id = @User1Id)
ORDER BY	[Date]

SELECT	* 
FROM	Users 
WHERE	Id = @User1Id   OR Id = @User2Id


SELECT	*
FROM	Items
WHERE	User_Id = @User1Id OR User_Id = @User2Id

GO
