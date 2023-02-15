-- Create Stored Procedure to check if a cloumn has NULL or not
CREATE PROCEDURE checkNULLS @TableName VARCHAR(50) , @ColumnName VARCHAR(50)
AS
BEGIN 
 DECLARE @query VARCHAR(1000)
 set @query = 'SELECT * FROM '+ @TableName + 'Where' +  @ColumnName + 'IS NULL'
 EXEC (@query)
END
-- Update Null with 0 VALUES
 Update games SET price_original = '0' , price_discounted = '0' Where price_original IS NULL
 Select * From games
 -- Calculate PERCENTAGE of games which suitable for Windows , Mac , and Linux
 Select (Select cast (count(*)as float) From games Where win = 'TRUE') / cast(COUNT(app_id)as float) * 100 As 'Windows Apps' From games 
 Select (Select cast (count(*)as float) From games Where mac = 'TRUE') / cast(COUNT(app_id)as float) * 100 As 'Mac Apps' From games 
 Select (Select cast (count(*)as float) From games Where linux = 'TRUE') / cast(COUNT(app_id)as float) * 100 As 'Linux Apps' From games 

-- Calculate PERCENTAGE of games which suitable for every platform
 Select (Select cast (count(*)as float) From games Where win = 'TRUE' AND mac = 'TRUE' AND linux = 'TRUE') / cast(COUNT(app_id)as float) * 100 As 'Number of games suitable for all platforms' From games 
-- Calculate PERCENTAGE of games which suitable for steam_deck
 Select (Select cast (count(*)as float) From games Where steam_deck = 'TRUE') / cast(COUNT(app_id)as float) * 100 As 'Games which suitable for steam deck' From games 
 -- How many game has a discount?
 Select count(*) As 'Number of games have a discount' From games where discount > 0
 -- How many game has a discount less than 50%
 Select count(*) As 'Number of games have a discount less than 50%' From games where discount < 50
 -- How many game has a discount greater than 50%
 Select count(*) As 'Number of games have a discount greater than 50%' From games where discount > 50
 -- How many game has a discount equal to 50%
 Select count(*) As 'Number of games have a discount is equal to 50%' From games where discount = 50
 -- How many reviews for all Rating type?
 Select rating As 'Raiting' , count(*) As 'Number of reviews'  From games group by rating order by 'Number of reviews'
 -- Which game has a max user reviews?
 Select  title ,  sum(user_reviews) As 'Number of reviews' From games 
 group by title order by 'Number of reviews' DESC

-- Which game has the highest price without discount?
  Select Top 1 title , price_final From games where discount = 0 order by price_final DESC
-- Which game has the highest price after discount?
  Select Top 1 title , price_final From games where discount != 0 order by price_final DESC
-- Which game has the lowest price without discount?
  Select Top 1 title , price_final From games where discount != 0 order by price_final
--  How many free games?
  Select count(*) As 'Number of Free Games' From games where price_final = 0 

-- Find sum of games prices
 Select sum(price_final) As 'Total prices in dollar $' From games 
-- Find average of games prices
 Select avg(price_final) As 'Total prices in dollar $' From games 
-- How many games has price less than 10$?
 Select count(*) As 'Games has price less than 10$' From games where price_final < 10.0
-- Find total discounts on games
Select sum(price_discounted) As 'Total Discounts in dollar$' From games
-- How much steam loss because of discounts?
Select (sum(price_original) - sum(price_final)) As 'Total Loss after discounting' From games

-- Avg number of hours that users consumed for playing games on steam
Select avg(hours) As 'Average Played Hours' From recommendations

-- Total number of hours that users consumed for playing games on steam
Select sum(hours) As 'Total Played Hours' From recommendations

-- Find Percentage of recommandition of our products
Select (select cast(count(*) As float) From recommendations where is_recommended = 1) / cast(count(*)As float) * 100 As 'Recommendation Rate' From recommendations
-- Find Percentage of funny recommandation of our products
Select (select cast(count(*) As float) From recommendations where cast(funny As Int) > 0) / cast(count(*)As float) * 100 As 'Recommendation Rate' From recommendations

-- Find Percentage of helpful recommandation of our products
Select (select cast(count(*) As float) From recommendations where cast(helpful As Int) > 0) / cast(count(*)As float) * 100 As 'Recommendation Rate' From recommendations
