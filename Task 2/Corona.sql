USE corona;
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
		SELECT * FROM corona_virus WHERE Deaths IS NULL;
-- Q2. If NULL values are present, update them with zeros for all columns. 
		-- NOT NULL SO SKIP
-- Q3. check total number of rows
		SELECT COUNT(*) AS Total_rows FROM corona_virus;
-- Q4. Check what is start_date and end_date
		SELECT MIN(Date) AS Start_date, MAX(Date) AS End_date FROM corona_virus;
-- Q5. Number of month present in dataset
		SELECT DISTINCT month(Date) AS Total_Months FROM corona_virus;
-- Q6. Find monthly average for confirmed, deaths, recovered
	SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    YEAR(Date), MONTH(Date);

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
-- CONFIRMED
SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    Confirmed,
    COUNT(*) AS frequency
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date), MONTH(Date), Confirmed
ORDER BY 
    frequency DESC;
-- DEATHS
SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    Deaths,
    COUNT(*) AS frequency
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date), MONTH(Date), Deaths
ORDER BY 
    frequency DESC;

-- RECOVERED
SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    Recovered,
    COUNT(*) AS frequency
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date), MONTH(Date), Recovered
ORDER BY 
    frequency DESC;

-- Q8. Find minimum values for confirmed, deaths, recovered per year
		SELECT 
    YEAR(Date) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date)
ORDER BY 
    year;

-- Q9. Find maximum values of confirmed, deaths, recovered per year
	SELECT 
    YEAR(Date) AS year,
    MAX(Confirmed) AS min_confirmed,
    MAX(Deaths) AS min_deaths,
    MAX(Recovered) AS min_recovered
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    YEAR(Date)
ORDER BY 
    year;
-- Q10. The total number of case of confirmed, deaths, recovered each month
	SELECT 
    month(Date) AS month,
    SUM(Confirmed) AS min_confirmed,
    SUM(Deaths) AS min_deaths,
    SUM(Recovered) AS min_recovered
FROM 
    corona_virus
WHERE 
    Date IS NOT NULL
GROUP BY 
    month(Date)
ORDER BY 
    month(Date);

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT YEAR(Date) AS YEAR,
month (Date) AS month,
SUM(Confirmed) AS Total_Case,
AVG(Confirmed) AS Average,
variance(Confirmed) AS Variance,
stddev(Confirmed) AS standard_deviation
FROM corona_virus
GROUP BY YEAR(Date),month(Date)
ORDER BY YEAR(Date), month(Date)

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT YEAR(Date) AS YEAR,
    MONTH(Date) AS month,
    SUM(Deaths) AS Total_Deaths,
    AVG(Deaths) AS Average_Deaths,
    VARIANCE(Deaths) AS Variance_Deaths,
    STDDEV(Deaths) AS Standard_Deviation_Deaths
FROM 
    corona_virus
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    YEAR(Date), MONTH(Date);


-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    YEAR(Date) AS YEAR,
    MONTH(Date) AS month,
    SUM(Recovered) AS Total_Recovered,
    AVG(Recovered) AS Average_Recovered,
    VARIANCE(Recovered) AS Variance_Recovered,
    STDDEV(Recovered) AS Standard_Deviation_Recovered
FROM 
    corona_virus
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    YEAR(Date), MONTH(Date);


-- Q14. Find Country having highest number of the Confirmed case
SELECT Country_Region, MAX(Confirmed) AS Highest FROM corona_virus
GROUP BY Country_Region
ORDER BY Highest DESC
LIMIT 1;

-- Q15. Find Country having lowest number of the death case
SELECT Country_Region, MIN(Deaths) AS Lowest_Deaths FROM corona_virus
GROUP BY Country_Region
ORDER BY Lowest_Deaths ;
-- You can use Limit 1 to show only one Country or Region.

-- Q16. Find top 5 countries having highest recovered case
SELECT Country_Region, MAX(Recovered) AS Highest_Recovered FROM corona_virus
GROUP BY Country_Region
ORDER BY Highest_Recovered DESC
LIMIT 5;
