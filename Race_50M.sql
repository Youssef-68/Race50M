-- How many state will represent in race
SELECT count(distinct State) as States_Count FROM [dbo].[ultra50];

-- What was the average time of Men vs Women
SELECT Gender, avg(Total_Minutes) as AVG_Time FROM [dbo].[ultra50]
GROUP BY Gender;

-- What were the youngest and oldest ages in the race
SELECT Gender, min(Age) as Youngest, max(Age) as Oldest FROM [dbo].[ultra50]
GROUP BY Gender;

-- What was the average time for each age
SELECT Age, count(Age) as Repetitions, avg(Total_Minutes) as AVG_Time FROM [dbo].[ultra50]
GROUP BY Age
ORDER BY Repetitions DESC;

-- Top 3 M and F
WITH G_Rank as 
( SELECT RANK() OVER (PARTITION BY Gender ORDER BY Total_Minutes) as G_Rank, Gender, Total_Minutes FROM [dbo].[ultra50])
SELECT * FROM G_RANK
WHERE G_Rank <= 3
ORDER BY Total_Minutes DESC;
