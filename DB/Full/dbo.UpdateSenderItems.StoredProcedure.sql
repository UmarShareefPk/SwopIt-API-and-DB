USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSenderItems]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[UpdateSenderItems]

@Id int,
@SenderItems nvarchar(200)

AS

UPDATE [dbo].[SwopRequests]
   SET 
      UserFromItems = @SenderItems
	       
 WHERE Id = @Id

 SELECT *
 FROM	SwopRequests
 WHERE	Id = @Id



GO
