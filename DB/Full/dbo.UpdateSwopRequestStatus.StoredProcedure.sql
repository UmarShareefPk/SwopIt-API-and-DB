USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSwopRequestStatus]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[UpdateSwopRequestStatus]

@Id int,
@Status nvarchar(200)

AS

UPDATE [dbo].[SwopRequests]
   SET 
      [Status] = @Status
	       
 WHERE Id = @Id

 SELECT *
 FROM	SwopRequests
 WHERE	Id = @Id


GO
