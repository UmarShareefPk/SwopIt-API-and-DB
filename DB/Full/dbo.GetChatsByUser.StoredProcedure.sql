USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetChatsByUser]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure		[dbo].[GetChatsByUser]

@UserId Int

AS
SELECT	UserFrom_Id As Sender , UserTo_Id AS Reciever
FROM	SwopRequests
WHERE	(UserFrom_Id = @UserId  OR	UserTo_Id = @UserId)
AND		Status = 'Accept'
Order By [Date] asc
GO
