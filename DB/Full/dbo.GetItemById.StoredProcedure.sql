USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetItemById]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetItemById]

@ItemId int

AS

SELECT	*
FROM	Items
WHERE	Id = @ItemId
GO
