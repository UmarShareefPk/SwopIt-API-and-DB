USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySearchAndLocation]    Script Date: 6/14/2017 1:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsBySearchAndLocation]

@Distance FLOAT,
@Longitude NVARCHAR(50),
@Latitude NVARCHAR(50),
@Search NVARCHAR(500)
AS


DECLARE @source GEOGRAPHY = 'POINT(' + @Longitude + ' ' + @Latitude + ')'

SELECT	Items.Id AS	ItemId,
		Items.Name AS ItemName,
		Items.Condition AS ItemCondition,
		Items.Details AS ItemDetails,
		Items.Category_Id AS CategoryId,
		Items.PostDate AS ItemPostDate,
		Items.Image1 As Image1,
		Items.Image2 As Image2,
		Items.Image3 As Image3,
		Items.Image4 As Image4,
		Items.Image5 As Image5,
		
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
		Users.Latitude, 	
		 
		@source.STDistance('POINT(' + Longitude + ' ' +  Latitude + ')')/1000 AS Distance 

FROM	Users, Items 
WHERE	Users.Id = Items.User_Id  
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
		AND Items.Name like '%' + @Search + '%'
ORDER BY	Distance asc



GO
