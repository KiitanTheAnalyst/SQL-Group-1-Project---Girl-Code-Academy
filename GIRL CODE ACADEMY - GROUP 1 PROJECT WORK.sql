CREATE DATABASE Fame_Movies

Question 1: Ranking of movie genres over differrent decades
SELECT[genre],[year]/ 10 * 10 AS 'Decade'
FROM [dbo].[Fames_Movies]
GROUP BY [year] / 10 * 10,[genre]
ORDER BY Decade

Question 2: The overall rating for each movie genre
SELECT[genre],AVG([score]) AS 'Average Rating'
FROM[dbo].[Fames_Movies]
GROUP BY [genre]

Question 3: Retrieve all records from the table
SELECT*
FROM[dbo].[Fames_Movies]

Question 4: Find the highest grossing movie
SELECT TOP 1 [gross],[name]
FROM [dbo].[Fames_Movies]
ORDER BY [gross] DESC

Question 5: Find the top 5 movie with the highest IMDb user rating
SELECT TOP 5[score] ,[name]
FROM[dbo].[Fames_Movies]
ORDER BY [score] DESC

Question 6: Calculate the total revenue generated from all movies
SELECT SUM ([gross]) AS 'Total Revenue',[name]
FROM[dbo].[Fames_Movies]
GROUP BY [name]
ORDER BY [Total Revenue] DESC

Question 7: Find the movie with the most user votes
SELECT TOP 1 [votes],[name]
FROM [dbo].[Fames_Movies]
ORDER BY [votes] DESC

Question 8: Calculate the total runtime of all movie
SELECT SUM([runtime]) AS 'Sum Total of Runtime'
FROM[dbo].[Fames_Movies]

Question 9: Find the top 5 movie genres with the highest average gross revenue
SELECT TOP 5[genre], AVG([gross]) AS 'Average Gross'
FROM[dbo].[Fames_Movies]
GROUP BY [genre]
ORDER BY 'Average Gross' DESC

Question 10: Calculate the average IMDb user ratings for movies released in each country
SELECT DISTINCT [country],AVG ([score]) AS 'Average User Ratings'
FROM[dbo].[Fames_Movies]
GROUP BY [country]

Question 11: Retrieve movies with a budget greater than the average budget across all movies
SELECT[budget],[name]
FROM[dbo].[Fames_Movies]
WHERE[budget] > (SELECT AVG([budget]) FROM [dbo].[Fames_Movies])
ORDER BY [budget]

Question 12:Find the movie with the highest gross revenue in each country
WITH RankedMovies AS (
    SELECT
        [country],
        [name],
        [gross],
        ROW_NUMBER() OVER (PARTITION BY [country] ORDER BY [gross] DESC) AS Rank
    FROM [dbo].[Fames_Movies]
)
SELECT [country], [name],[gross]
FROM RankedMovies
WHERE Rank = 1
ORDER BY [gross] DESC

Question 13:Calculate the percentage of total revenue for each movie genre
SELECT [genre],(SUM ([gross])/(SELECT SUM ([gross]) FROM [dbo].[Fames_Movies]))* 100 AS 'Revenue Percentage'
FROM[dbo].[Fames_Movies]
GROUP BY [genre]

Question 14:Retrieve movies released by directors who have more than 3 movies in the dataset
SELECT [director], COUNT(*) AS 'Movie Count'
FROM [dbo].[Fames_Movies]
GROUP BY [director]
HAVING COUNT(*) > 3
ORDER BY [Movie Count]

Question 15:Calculate the average number of user votes for movies with a rating of "PG-13"
SELECT AVG ([votes]) AS 'Average No Of User Votes',[name],[rating]
FROM[dbo].[Fames_Movies]
WHERE[rating]= 'PG-13'
GROUP BY [rating],[name]
ORDER BY [Average No Of User Votes] DESC

Question 16:Find the most common main actor/actress(star) across all movies
SELECT TOP 1 [star], COUNT(*) AS 'Movie Count'
FROM[dbo].[Fames_Movies]
GROUP BY [star]
ORDER BY 'Movie Count' DESC

Question 17:Calculate the number of movies released each year and sort them in descending order
SELECT [year],COUNT(*)AS'Number of Movies Released'
FROM[dbo].[Fames_Movies]
GROUP BY[year]
ORDER BY [Number of Movies Released]DESC

Question 18:Retrieve movies with a rating of 'R' and aruntime of more than 120 minutes
SELECT[name],[rating],[runtime]
FROM[dbo].[Fames_Movies]
WHERE [rating]='R' AND [runtime]>120 

