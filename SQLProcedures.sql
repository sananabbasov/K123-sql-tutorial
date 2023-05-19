CREATE DATABASE K123CarAppDb

-- CREATE TABLE  Models(
--     Id INT IDENTITY PRIMARY KEY,
--     ModelName NVARCHAR(250) NOT NULL
-- )

-- CREATE TABLE Users(
--     Id INT IDENTITY PRIMARY KEY,
--     UserName NVARCHAR(250) NOT NULL,
--     Email NVARCHAR(250) NOT NULL,
--     Password NVARCHAR(250) NOT NULL,
--     IsCompany BIT NOT NULL,
-- )

-- CREATE TABLE Cars(
--     Id INT IDENTITY PRIMARY KEY,
--     Brand NVARCHAR(250) NOT NULL,
--     Price FLOAT NOT NULL,
--     ModelId INT FOREIGN KEY REFERENCES Models(Id),
--     IsNew BIT NOT NULL,
--     CreatedYear DATE NOT NULL,
--     Millage INT NOT  NULL,
--     UserId INT FOREIGN KEY REFERENCES Users(Id)
-- )

-- CREATE TABLE Tags (
--     Id INT IDENTITY PRIMARY KEY,
--     TagName NVARCHAR(250) NOT NULL
-- )

-- CREATE TABLE CarTags(
--     Id INT IDENTITY PRIMARY KEY,
--     CarId INT FOREIGN KEY REFERENCES Cars(Id),
--     TagId INT FOREIGN KEY REFERENCES Tags(Id)
-- )


INSERT INTO Models (ModelName) 
VALUES
('Nissan'),('Toyota'),('Hundai'),('Mercedes'),('BMW'),('Tesla'),('TOGG')

SELECT * FROM Models



INSERT INTO Users (UserName,[Password],IsCompany,Email)
VALUES 
('ehmed','Ehmed@123',0,'ehmed@compar.edu.az'),
('qudret','Qudret@123',0,'qudret@compar.edu.az'),
('murad','Murad@123',0,'murad@compar.edu.az')


SELECT * FROM Users


INSERT INTO Tags (TagName)
VALUES 
(N'Yüngül lehimli disklər'),(N'ABS'),(N'Yağış sensoru'),(N'Mərkəzi qapanma'),(N'Park radarı'),(N'Kondisioner'),(N'Ksenon lampalar'),(N'Arxa görüntü kamerası')


SELECT  * FROM Tags



INSERT INTO Cars (Brand,Price,ModelId, IsNew,CreatedYear,Millage,UserId)
VALUES
('Prius', 10000,2,1,'12-12-2019', 0, 1),
('Model S', 70000,6,0,'12-12-2019', 160000, 1),
('X5', 45700,5,0,'12-12-2019', 10000, 1),
('Patrol', 97640,1,1,'12-12-2019', 0, 2),
('Maxima', 21500,1,1,'12-12-2019', 0, 2),
('Accent', 21500,1,1,'12-12-2019', 0, 2)


SELECT * FROM Cars

INSERT INTO CarTags (CarId, TagId)
VALUES  
(1,2),(2,1),(1,4),(1,3),(3,4),(3,2),(4,1)


SELECT Brand, Price, ModelName, UserName, Email FROM Cars
INNER JOIN Models
ON Cars.ModelId = Models.Id
INNER JOIN Users
ON Cars.UserId = Users.Id


SELECT * FROM Cars FULL JOIN Models
ON Cars.ModelId = Models.Id


GO
CREATE PROCEDURE GetCarById @Id INT
AS
SELECT * FROM Cars WHERE Id = @Id
GO


GO
CREATE PROCEDURE GetCarById @Id INT
AS
-- Sql code
GO



-- SELECT * FROM view_name
EXEC GetCarById @Id=1


GO
CREATE PROCEDURE GetHomeData AS
SELECT Brand, Price, ModelName, UserName, Email FROM Cars
INNER JOIN Models
ON Cars.ModelId = Models.Id
INNER JOIN Users
ON Cars.UserId = Users.Id
GO


EXEC GetHomeData


GO
CREATE PROCEDURE GetCarsByModelNameAndPrice
@ModelName NVARCHAR(250), @MinPrice INT, @MaxPrice INT
AS
SELECT Brand, Price, ModelName, UserName, Email FROM Cars
INNER JOIN Models
ON Cars.ModelId = Models.Id
INNER JOIN Users
ON Cars.UserId = Users.Id
WHERE ModelName = @ModelName AND Price BETWEEN  @MinPrice AND  @MaxPrice
GO

EXEC GetCarsByModelNameAndPrice @ModelName = 'Nissan', @MinPrice = 2, @MaxPrice= 40000



SELECT * FROM Tags
SELECT * FROM Cars
SELECT * FROM CarTags
SELECT * FROM Models



SELECT Brand, Price, Millage, ModelName FROM Cars INNER JOIN Models
ON Cars.ModelId = Models.Id

SELECT * FROM Cars LEFT JOIN CarTags 
ON Cars.Id = CarTags.CarId

SELECT * FROM CarTags RIGHT JOIN Tags 
ON Tags.Id = CarTags.CarId

SELECT * FROM Tags FULL JOIN CarTags
ON Tags.Id = CarTags.CarId

SELECT  SUBSTRING(Brand, 1, 3) AS ExtractString, Price FROM Cars 

SELECT  REVERSE(Brand) AS ExtractString, Price FROM Cars 

SELECT  ABS(Price) AS ExtractString, Price FROM Cars 

SELECT  CEILING(Price) AS ExtractString, Price FROM Cars 


-- Write 3 inner join example
-- Write 3 left join example
-- Write 3 right join example
-- Write 1 full join example
-- Create view GetAllProducts
-- Create procedure for get product by color name
-- Create procedure for get product by color and brand name
-- Create procedure for get product by id
-- Create procedure for get product by color, brand, and city name
-- Create procedure for get product by city name
-- Create procedure for get product by color, brand, city name and price