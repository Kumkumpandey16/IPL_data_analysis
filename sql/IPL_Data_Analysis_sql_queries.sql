/*=========================================================
                IPL DATA ANALYSIS PROJECT
===========================================================

Author      : Kumkum Pandey
Tool        : SQL Server Management Studio 22
Database    : IPL_Data_Analysis
Table       : dbo.clean_ipl_data

=========================================================*/

USE IPL_Data_Analysis;
GO

/*=========================================================
Query 1 : Display First 10 Records
=========================================================*/

SELECT TOP 10 *
FROM dbo.clean_ipl_data;


/*=========================================================
Query 2 : Total Number of Records
=========================================================*/

SELECT COUNT(*) AS Total_Records
FROM dbo.clean_ipl_data;


/*=========================================================
Query 3 : Total Number of Matches
=========================================================*/

SELECT COUNT(DISTINCT mid) AS Total_Matches
FROM dbo.clean_ipl_data;


/*=========================================================
Query 4 : Total Number of Venues
=========================================================*/

SELECT COUNT(DISTINCT venue) AS Total_Venues
FROM dbo.clean_ipl_data;


/*=========================================================
Query 5 : List All Venues
=========================================================*/

SELECT DISTINCT venue
FROM dbo.clean_ipl_data
ORDER BY venue;


/*=========================================================
Query 6 : Total Batting Teams
=========================================================*/

SELECT COUNT(DISTINCT bat_team) AS Total_Batting_Teams
FROM dbo.clean_ipl_data;


/*=========================================================
Query 7 : List All Batting Teams
=========================================================*/

SELECT DISTINCT bat_team
FROM dbo.clean_ipl_data
ORDER BY bat_team;


/*=========================================================
Query 8 : Total Bowling Teams
=========================================================*/

SELECT COUNT(DISTINCT bowl_team) AS Total_Bowling_Teams
FROM dbo.clean_ipl_data;


/*=========================================================
Query 9 : List All Bowling Teams
=========================================================*/

SELECT DISTINCT bowl_team
FROM dbo.clean_ipl_data
ORDER BY bowl_team;


/*=========================================================
Query 10 : Total Number of Batsmen
=========================================================*/

SELECT COUNT(DISTINCT batsman) AS Total_Batsmen
FROM dbo.clean_ipl_data;


/*=========================================================
Query 11 : Total Number of Bowlers
=========================================================*/

SELECT COUNT(DISTINCT bowler) AS Total_Bowlers
FROM dbo.clean_ipl_data;


/*=========================================================
Query 12 : IPL Date Range
=========================================================*/

SELECT
MIN([date]) AS First_Match_Date,
MAX([date]) AS Last_Match_Date
FROM dbo.clean_ipl_data;


/*=========================================================
Query 13 : Highest Team Total
=========================================================*/

SELECT MAX(total) AS Highest_Total
FROM dbo.clean_ipl_data;


/*=========================================================
Query 14 : Lowest Team Total
=========================================================*/

SELECT MIN(total) AS Lowest_Total
FROM dbo.clean_ipl_data;


/*=========================================================
Query 15 : Average Predicted Total
=========================================================*/

SELECT
ROUND(AVG(CAST(total AS FLOAT)),2) AS Average_Total
FROM dbo.clean_ipl_data;
/*=========================================================
Query 16 : Highest Runs Scored During an Over
=========================================================*/

SELECT MAX(runs) AS Highest_Runs
FROM dbo.clean_ipl_data;


/*=========================================================
Query 17 : Average Runs During an Over
=========================================================*/

SELECT
ROUND(AVG(CAST(runs AS FLOAT)),2) AS Average_Runs
FROM dbo.clean_ipl_data;


/*=========================================================
Query 18 : Highest Wickets Fallen
=========================================================*/

SELECT MAX(wickets) AS Highest_Wickets
FROM dbo.clean_ipl_data;


/*=========================================================
Query 19 : Average Wickets Fallen
=========================================================*/

SELECT
ROUND(AVG(CAST(wickets AS FLOAT)),2) AS Average_Wickets
FROM dbo.clean_ipl_data;


/*=========================================================
Query 20 : Matches Played at Each Venue
=========================================================*/

SELECT
venue,
COUNT(DISTINCT mid) AS Matches_Played
FROM dbo.clean_ipl_data
GROUP BY venue
ORDER BY Matches_Played DESC;


/*=========================================================
Query 21 : Number of Records for Each Batting Team
=========================================================*/

SELECT
bat_team,
COUNT(*) AS Total_Records
FROM dbo.clean_ipl_data
GROUP BY bat_team
ORDER BY Total_Records DESC;


/*=========================================================
Query 22 : Number of Records for Each Bowling Team
=========================================================*/

SELECT
bowl_team,
COUNT(*) AS Total_Records
FROM dbo.clean_ipl_data
GROUP BY bowl_team
ORDER BY Total_Records DESC;


/*=========================================================
Query 23 : Top 10 Batsmen by Ball Appearances
=========================================================*/

SELECT TOP 10
batsman,
COUNT(*) AS Balls_Faced
FROM dbo.clean_ipl_data
GROUP BY batsman
ORDER BY Balls_Faced DESC;


/*=========================================================
Query 24 : Top 10 Bowlers by Ball Appearances
=========================================================*/

SELECT TOP 10
bowler,
COUNT(*) AS Balls_Bowled
FROM dbo.clean_ipl_data
GROUP BY bowler
ORDER BY Balls_Bowled DESC;


/*=========================================================
Query 25 : Average Predicted Total by Batting Team
=========================================================*/

SELECT
bat_team,
ROUND(AVG(CAST(total AS FLOAT)),2) AS Average_Total
FROM dbo.clean_ipl_data
GROUP BY bat_team
ORDER BY Average_Total DESC;


/*=========================================================
Query 26 : Average Predicted Total by Venue
=========================================================*/

SELECT
venue,
ROUND(AVG(CAST(total AS FLOAT)),2) AS Average_Total
FROM dbo.clean_ipl_data
GROUP BY venue
ORDER BY Average_Total DESC;


/*=========================================================
Query 27 : Top 10 Highest Predicted Totals
=========================================================*/

SELECT TOP 10
mid,
bat_team,
bowl_team,
venue,
total
FROM dbo.clean_ipl_data
ORDER BY total DESC;


/*=========================================================
Query 28 : Top 10 Highest Runs in Last 5 Overs
=========================================================*/

SELECT TOP 10
mid,
bat_team,
runs_last_5
FROM dbo.clean_ipl_data
ORDER BY runs_last_5 DESC;


/*=========================================================
Query 29 : Top 10 Highest Wickets in Last 5 Overs
=========================================================*/

SELECT TOP 10
mid,
bowl_team,
wickets_last_5
FROM dbo.clean_ipl_data
ORDER BY wickets_last_5 DESC;


/*=========================================================
Query 30 : Highest Predicted Total for Every Batting Team
=========================================================*/

SELECT
bat_team,
MAX(total) AS Highest_Total
FROM dbo.clean_ipl_data
GROUP BY bat_team
ORDER BY Highest_Total DESC;