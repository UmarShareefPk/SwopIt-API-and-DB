USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemImage]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[UpdateItemImage]

@ItemId int,
@ImageNumber int

AS

IF @ImageNumber = 1 
BEGIN
    UPDATE	Items
	SET		Image1 = '1'
	WHERE	Id = @ItemId
END

IF @ImageNumber = 2
BEGIN
    UPDATE	Items
	SET		Image2 = '2'
	WHERE	Id = @ItemId
END

IF @ImageNumber = 3 
BEGIN
    UPDATE	Items
	SET		Image3 = '3'
	WHERE	Id = @ItemId
END

IF @ImageNumber = 4 
BEGIN
    UPDATE	Items
	SET		Image4 = '4'
	WHERE	Id = @ItemId
END

IF @ImageNumber = 5 
BEGIN
    UPDATE	Items
	SET		Image5 = '5'
	WHERE	Id = @ItemId
END


GO
