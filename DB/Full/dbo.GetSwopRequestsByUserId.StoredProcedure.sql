USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetSwopRequestsByUserId]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetSwopRequestsByUserId]

@UserId int

AS

SELECT	*
FROM	SwopRequests
--WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId
WHERE	 UserTo_Id = @UserId
ORDER BY	[Date]


SELECT	* 
FROM	Users 
WHERE	Id = @UserId
OR
Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

OR
Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)


SELECT	*
FROM	Items
WHERE	User_Id = @UserId
OR
User_Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

OR
User_Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

GO
