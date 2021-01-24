USE [SwopIt]
GO
/****** Object:  StoredProcedure [dbo].[AcceptedSwopsByUser]    Script Date: 6/14/2017 1:11:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddCoins]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[AddCoins]

@UserId INT,
@Bank NVARCHAR(200),
@AccoutNumber NVARCHAR(20),
@Coins Float

AS

INSERT INTO [dbo].[UsersAccounts]
           ([User_Id]
           ,[Bank]
           ,[AccountNumber]
           ,[Coins])
     VALUES
           ( @UserId
           , @Bank
           , @AccoutNumber
           , @Coins)

GO
/****** Object:  StoredProcedure [dbo].[AddContactUs]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddContactUs]

@UserId INT,
@Email NVARCHAR(100),
@Message NVARCHAR(500)

AS

INSERT INTO [dbo].[ContactUs]
           ([User_Id]
           ,[Email]
           ,[Message])
     VALUES
           ( @UserId
           , @Email
           ,@Message)

GO
/****** Object:  StoredProcedure [dbo].[AddItem]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE	[dbo].[AddItem]

	@UserId int,
	@Details nvarchar(500),
	@CategoryId int,
	@Condition nvarchar(200),
	@Name nvarchar(200)
		
	AS

	DECLARE @IDs TABLE(ID INT);


INSERT INTO [dbo].[Items]
           ([User_Id]
           ,[PostDate]
           ,[Details]
           ,[Category_Id]
           ,[Condition]
           ,[Name]
           ,[Image1]
           ,[Image2]
           ,[Image3]
           ,[Image4]
           ,[Image5])
		   
		    OUTPUT inserted.ID INTO @IDs(ID)
     VALUES
           ( @UserId
           , GETDATE()
           , @Details
           , @CategoryId
           , @Condition
           , @Name
           , ''
           , ''
           , ''
           , ''
           , '')

		   SELECT ID AS ItemId FROM @IDs

GO
/****** Object:  StoredProcedure [dbo].[AddMessage]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddMessage]

@Sender int,
@Reciever int,
@Message nvarchar(1000)

AS

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[Chats]
           ([Sender]
           ,[Reciever]
           ,[Message]
           ,[Date]
		   ,[IsRead])

OUTPUT inserted.ID INTO @IDs(ID)

     VALUES
           (@Sender
           ,@Reciever
           ,@Message
           ,GETDATE()
		   ,0)


SELECT * FROM Chats WHERE Id = (SELECT ID FROM @IDs)

GO
/****** Object:  StoredProcedure [dbo].[AddRating]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddRedeemCoin]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddRedeemCoin]

@Name	NVARCHAR(200),
@Coins	float,
@BankName	NVARCHAR(200),
@AccountNumber NVARCHAR(5)

AS

INSERT INTO [dbo].[RedeemCoins]
           ([Name]
           ,[Coins]
           ,[BankName]
           ,[AccountNumber]
           ,[CreateDate])
     VALUES
           (@Name
           ,@Coins
           ,@BankName
           ,@AccountNumber
           ,GETDATE())



GO
/****** Object:  StoredProcedure [dbo].[AddSwopRequest]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[AddSwopRequest]

@Sender int,
@Reciever int,
@SenderItems nvarchar(50),
@RecieverItems nvarchar(50),
@SwopType nvarchar(50),
@Coins nvarchar(50)

AS

IF  EXISTS(SELECT * FROM SwopRequests WHERE UserFrom_Id = @Sender AND UserTo_Id = @Reciever and UserFromItems = @SenderItems and UserToItems = @RecieverItems )
BEGIN
Select 'This Swop Request already exists.' AS Message
Return
END

IF  EXISTS(SELECT * FROM SwopRequests WHERE UserFrom_Id = @Sender AND UserTo_Id = @Reciever and Coins = @Coins and Coins is not null and Coins <> '' and UserToItems = @RecieverItems )
BEGIN
Select 'This Swop Request alreay exists.' AS Message
Return
END

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[SwopRequests]
           ([UserFrom_Id]
           ,[UserTo_Id]
           ,[Status]
           ,[Date]
           ,[UserFromItems]
           ,[UserToItems]
		   , [Type]
		   ,[Coins])

OUTPUT inserted.ID INTO @IDs(ID)

     VALUES
           (@Sender
           ,@Reciever
           ,'Pending'
           ,GETDATE()
           ,@SenderItems
           ,@RecieverItems
		   ,@SwopType
		   ,@Coins)

SELECT * FROM SwopRequests WHERE Id = (SELECT ID FROM @IDs)

SELECT *FROM Users WHERE Id = @Sender OR Id = @Reciever

SELECT	*
FROM	Items
WHERE	User_Id = @Sender OR User_Id = @Reciever
GO
/****** Object:  StoredProcedure [dbo].[ADDUSER]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ADDUSER] 

@Name nvarchar(150),
@Password nvarchar(50),
@Username nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(50),
@About nvarchar(500),
@MoreInfo nvarchar(500),
@PicturePath nvarchar(200),
@Address nvarchar(500),
@Longitude nvarchar(20),
@Latitude nvarchar(20)

AS

DECLARE @IDs TABLE(ID INT);

INSERT INTO [dbo].[Users]
           ([Name]
           ,[Password]
           ,[Username]
           ,[Email]
           ,[Phone]
           ,[About]
           ,[MoreInfo]
           ,[PicturePath]
           ,[Address]
           ,[Longitude]
           ,[Latitude])

	OUTPUT inserted.ID INTO @IDs(ID)
     VALUES
           (@Name
           ,@Password
           ,@Username
           ,@Email
           ,@Phone 
           ,@About
           ,@MoreInfo
           ,@PicturePath
           ,@Address
           ,@Longitude
           ,@Latitude)


SELECT ID AS UserId FROM @IDs



GO
/****** Object:  StoredProcedure [dbo].[CategoryExists]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[CategoryExists]

@CategoryId int

AS

SELECT	*
FROM	Categories
WHERE	Id = @CategoryId

GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategories]
AS
SELECT *FROM Categories
GO
/****** Object:  StoredProcedure [dbo].[GetChatsByUser]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemById]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemsByDistance]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetItemsByDistance]

@UserID INT,
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
WHERE	Users.Id = Items.User_Id  AND Users.Id <> @UserID
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByDistanceAndLocation]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsByDistanceAndLocation]

@Distance FLOAT,
@Longitude NVARCHAR(50),
@Latitude NVARCHAR(50)
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
ORDER BY	Distance asc



GO
/****** Object:  StoredProcedure [dbo].[GetItemsByDistanceForGuest]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsByDistanceForGuest]


AS

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
		 
		0 AS Distance 

FROM	Users, Items 
WHERE	Users.Id = Items.User_Id  



GO
/****** Object:  StoredProcedure [dbo].[GetItemsByMainCategory]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetItemsByMainCategory]

@UserID INT,
@Distance FLOAT,
@Category NVARCHAR(200)

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
		Users.Latitude, 	
		 
		@source.STDistance('POINT(' + Longitude + ' ' +  Latitude + ')')/1000 AS Distance 

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id  AND Users.Id <> @UserID
		AND Items.Category_Id = Categories.Id  AND Categories.MainCategory = @Category
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc


GO
/****** Object:  StoredProcedure [dbo].[GetItemsByMainCategoryAndLocation]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE	[dbo].[GetItemsByMainCategoryAndLocation]

@Distance FLOAT,
@Longitude NVARCHAR(50),
@Latitude NVARCHAR(50),
@Category NVARCHAR(200)

AS

DECLARE @source GEOGRAPHY = 'POINT(' + @Longitude + ' ' + @Latitude + ')'

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
		Users.Latitude, 	
		 
		@source.STDistance('POINT(' + Longitude + ' ' +  Latitude + ')')/1000 AS Distance 

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id 
		AND Items.Category_Id = Categories.Id  AND Categories.MainCategory = @Category
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc




GO
/****** Object:  StoredProcedure [dbo].[GetItemsByMainCategoryForGuest]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE	[dbo].[GetItemsByMainCategoryForGuest]

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
		Users.Latitude, 	
		 
		0 AS Distance 

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id 
		AND Items.Category_Id = Categories.Id  AND Categories.MainCategory = @Category		



GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySearch]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetItemsBySearch]

@UserID INT,
@Distance FLOAT,
@Search NVARCHAR(500)

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
WHERE	Users.Id = Items.User_Id  AND Users.Id <> @UserID
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
		AND Items.Name like '%' + @Search + '%'
ORDER BY	Distance asc


GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySearchAndLocation]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemsBySearchForGuest]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsBySearchForGuest]

@Search NVARCHAR(500)
AS

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
		 
		0 AS Distance 

FROM	Users, Items 
WHERE	Users.Id = Items.User_Id  
		AND Items.Name like '%' + @Search + '%'


GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySubCategory]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetItemsBySubCategory]

@UserID INT,
@Distance FLOAT,
@SubCategoryId INT

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
		
		Categories.Name AS Category,

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

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id  AND Users.Id <> @UserID
		AND Items.Category_Id = Categories.Id  AND Categories.Id = @SubCategoryId
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc


GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySubCategoryAndLocation]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsBySubCategoryAndLocation]

@Distance FLOAT,
@Longitude NVARCHAR(50),
@Latitude NVARCHAR(50),
@SubCategoryId INT

AS

DECLARE @source GEOGRAPHY = 'POINT(' + @Longitude + ' ' + @Latitude + ')'

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
		
		Categories.Name AS Category,

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

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id  
		AND Items.Category_Id = Categories.Id  AND Categories.Id = @SubCategoryId
		AND	@source.STDistance('POINT(' + Users.Longitude + ' ' +  Users.Latitude + ')')/1000 < @Distance
ORDER BY	Distance asc




GO
/****** Object:  StoredProcedure [dbo].[GetItemsBySubCategoryForGuest]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE	[dbo].[GetItemsBySubCategoryForGuest]


@SubCategoryId INT

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
		
		Categories.Name AS Category,

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
		 
		0 AS Distance 

FROM	Users, Items, Categories
WHERE	Users.Id = Items.User_Id  
		AND Items.Category_Id = Categories.Id  AND Categories.Id = @SubCategoryId	





GO
/****** Object:  StoredProcedure [dbo].[GetItemsByUser]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetItemsByUser]

@UserId int

AS

SELECT	*
FROM	Items
WhERE	User_Id = @UserId
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByUserAndMainCategory]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemsByUserAndSubCategory]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetItemsByUserAndSubCategory]

@UserID INT,
@SubCategoryId INT

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
		
		Categories.Name AS Category,

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
		AND Items.Category_Id = Categories.Id  AND Categories.Id = @SubCategoryId		

GO
/****** Object:  StoredProcedure [dbo].[GetMessagesByTwoUsers]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetMessagesByTwoUsers]

@User1Id int,
@User2Id int

AS

SELECT	*
FROM	Chats
WHERE	(Sender = @User1Id AND Reciever = @User2Id) OR (Sender = @User2Id AND Reciever = @User1Id)
ORDER BY	[Date] asc

SELECT * FROM Users 
WHERE	Id = @User1Id OR Id = @User2Id
GO
/****** Object:  StoredProcedure [dbo].[GetMessagesByUserId]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetMessagesByUserId]

@UserId int

AS

SELECT	*
FROM	Chats
WHERE	Sender = @UserId OR Reciever = @UserId
ORDER BY	[Date]


GO
/****** Object:  StoredProcedure [dbo].[GetSwoppers]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetSwopRequestsByTwoUsers]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetSwopRequestsByTwoUsers]

@User1Id int,
@User2Id int

AS

SELECT	*
FROM	SwopRequests
WHERE	(UserFrom_Id = @User1Id AND UserTo_Id = @User2Id) OR (UserFrom_Id = @User2Id AND UserTo_Id = @User1Id)
ORDER BY	[Date]

SELECT	* 
FROM	Users 
WHERE	Id = @User1Id   OR Id = @User2Id


SELECT	*
FROM	Items
WHERE	User_Id = @User1Id OR User_Id = @User2Id

GO
/****** Object:  StoredProcedure [dbo].[GetSwopRequestsByUserId]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[GetSwopRequestsByUserId]

@UserId int

AS

SELECT	*
FROM	SwopRequests
--WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId
WHERE	 UserTo_Id = @UserId
ORDER BY	[Date]


SELECT	* 
FROM	Users 
WHERE	Id = @UserId
OR
Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

OR
Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)


SELECT	*
FROM	Items
WHERE	User_Id = @UserId
OR
User_Id IN (SELECT	UserTo_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

OR
User_Id IN (SELECT	UserFrom_Id 
				FROM	SwopRequests 
				WHERE	UserFrom_Id = @UserId OR UserTo_Id = @UserId)

GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser] 

@Password nvarchar(50),
@Username nvarchar(100)

AS

SELECT	*
FROM	Users
WHERE	[Username] = @Username AND [Password] = @Password

GO
/****** Object:  StoredProcedure [dbo].[GetUserAccount]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetUserAccount]

@UserId INT

AS

SELECT * FROM [dbo].[UsersAccounts]
WHERE	User_Id = @UserId

GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[GetUserById]

@UserId int

AS

SELECT	*
FROM	Users
WHERE	Id = @UserId

GO
/****** Object:  StoredProcedure [dbo].[LastMessageByUser]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[LastMessageByUser]
@UserId  INT

AS

SELECT		TOp(1) *
FROM		Chats 
WHERE		Sender = @UserId OR Reciever = @UserId  
ORDER BY	[Date]	desc
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[Login]

@Username nvarchar(100),
@Password nvarchar(50)

AS

SELECT	* 
FROM	Users
WHERE	Username = @Username AND Password = @Password


GO
/****** Object:  StoredProcedure [dbo].[UpdateCoins]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE	[dbo].[UpdateCoins]

@UserId INT,
@Coins Float

AS

IF NOT  EXISTS(SELECT * FROM UsersAccounts WHERE User_Id = @UserId )
BEGIN

INSERT INTO [dbo].[UsersAccounts]
           ([User_Id]
           ,[Bank]
           ,[AccountNumber]
           ,[Coins])
     VALUES
           (@UserId
           ,''
           ,''
           ,0)



END

UPDATE [dbo].[UsersAccounts]
   SET       
      [Coins] = @Coins
 
 WHERE User_Id = @UserId

GO
/****** Object:  StoredProcedure [dbo].[UpdateItemImage]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProfilePicture]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProfilePicture] 

@UserId int,
@FileName nvarchar(200)

AS

UPDATE [dbo].[Users]          
   SET [PicturePath]   = @FileName 
WHERE	[Id] = @UserId



 
GO
/****** Object:  StoredProcedure [dbo].[UpdateSenderItems]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateSwopRequestStatus]    Script Date: 6/14/2017 1:11:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser] 

@UserId int,
@Name nvarchar(150),
--@Password nvarchar(50),
--@Username nvarchar(100),
--@Email nvarchar(100),
@Phone nvarchar(50),
@About nvarchar(500),
@MoreInfo nvarchar(500),
--@PicturePath nvarchar(200),
@Address nvarchar(500)
--@Longitude nvarchar(20),
--@Latitude nvarchar(20)

AS



UPDATE [dbo].[Users]          
   SET [Name]   = @Name 
     -- ,[Password] = @Password 
    --  ,[Username]  = @Username 
      --,[Email] = @Email 
      ,[Phone] = @Phone 
      ,[About] = @About
      ,[MoreInfo] = @MoreInfo
     -- ,[PicturePath]  = @PicturePath 
      ,[Address]  = @Address 
    --  ,[Longitude]  = @Longitude
     -- ,[Latitude]  = @Latitude
 WHERE [Id] = @UserId

 SELECT *
 FROM	Users
 WHERE	Id = @UserId
GO
/****** Object:  StoredProcedure [dbo].[UserAvailable]    Script Date: 6/14/2017 1:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[UserAvailable]

@Username nvarchar(100)

AS

SELECT	* 
FROM	Users
WHERE	Username = @Username 


GO
