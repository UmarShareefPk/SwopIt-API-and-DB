USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByUserAndMainCategory]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsByUserAndMainCategory]

@UserID INT,
@Category NVARCHAR(200)

AS


SELECT	Items.Id AS	ItemId,
		Items.Name AS ItemName,
		Items.Condition AS ItemCondition,
		Items.Details AS ItemDetails,
		--Items.Category_Id AS CategoryId,
		Items.PostDate AS ItemPostDate,
		Items.Image1 As Image1,
		Items.Image2 As Image2,
		Items.Image3 As Image3,
		Items.Image4 As Image4,
		Items.Image5 As Image5,
		
		Categories.MainCategory AS Category,

		Users.Id AS UserId,
		Users.Name As Name,
		Users.Username AS Username,
		Users.Email AS Email,
		Users.Phone AS Phone,
		Users.About AS About,
		Users.MoreInfo AS MoreInfo,
		Users.Address AS Address,	
		Users.PicturePath AS PicturePath,
		Users.Longitude,
		Users.Latitude
		 

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id  AND Users.Id = @UserID
		AND Items.Category_Id = Categories.Id  AND Categories.MainCategory = @Category


GO
