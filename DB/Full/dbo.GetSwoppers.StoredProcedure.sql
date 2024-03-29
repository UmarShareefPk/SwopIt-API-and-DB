USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetSwoppers]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetSwoppers]
@UserId  INT,
@Distance FLOAT

AS

DECLARE		@Longitude NVARCHAR(50)
DECLARE		@Latitude NVARCHAR(50)

DECLARE		user_cursor CURSOR LOCAL  
FOR			SELECT	Longitude, Latitude 
			FROM	users 
			WHERE	Id = @UserID

OPEN	user_cursor
FETCH	NEXT FROM user_cursor INTO @Longitude , @Latitude
CLOSE	user_cursor

DECLARE @source GEOGRAPHY = 'POINT(' + @Longitude + ' ' + @Latitude + ')'


SELECT			
		Users.*,		 
		@source.STDistance('POINT(' + Longitude + ' ' +  Latitude + ')')/1000 AS Distance 

FROM	Users
WHERE	Users.Id In (
						SELECT UserFrom_Id AS UserId FROM SwopRequests Where Status = 'Accept'
						Union
						SELECT UserTo_Id AS UserId FROM SwopRequests Where Status = 'Accept'
					)
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc
GO
