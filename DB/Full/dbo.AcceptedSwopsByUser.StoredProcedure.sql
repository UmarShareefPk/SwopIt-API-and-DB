USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AcceptedSwopsByUser]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AcceptedSwopsByUser]
@UserId  INT

AS

SELECT		*
FROM		SwopRequests 
WHERE		(UserFrom_Id = @UserId OR UserTo_Id = @UserId ) AND Status = 'Accept' 
ORDER BY	[Date]		desc

SELECT	* 
FROM	Users 
WHERE	Id = @UserId
OR
Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	(UserFrom_Id = @UserId OR UserTo_Id = @UserId) AND Status = 'Accept' )

OR
Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	(UserFrom_Id = @UserId OR UserTo_Id = @UserId) AND Status = 'Accept' )


SELECT	*
FROM	Items
WHERE	User_Id = @UserId
OR
User_Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	(UserFrom_Id = @UserId OR UserTo_Id = @UserId) AND Status = 'Accept' )

OR
User_Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	(UserFrom_Id = @UserId OR UserTo_Id = @UserId) AND Status = 'Accept' )
GO
