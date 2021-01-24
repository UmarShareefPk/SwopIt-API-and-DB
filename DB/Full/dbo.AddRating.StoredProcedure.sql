USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AddRating]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddRating]

@UserId	Int,
@Rater	Int,
@Rating	Int

AS

INSERT INTO [dbo].[Ratings]
           ([User_Id]
           ,[Rater]
           ,[Rating])
     VALUES
           ( @UserId
           ,@Rater
           ,@Rating)



GO
