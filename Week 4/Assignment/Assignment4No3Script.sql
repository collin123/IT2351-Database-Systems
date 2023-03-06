-- Created by Collin Staisak for IT2351, Spring 2023
-- query to show different types of datetime object operations and CASTS
SELECT date_added, 
CAST(date_added AS DATE) AS "Date Only", -- cast to DATE object to show only year month day
DATE_FORMAT(date_added, "%Y-%m") AS "Year-Month", -- Use dateformat to extract just the year and month (The assignment says CAST but I could not find anywhere how to do this using a CAST and mysql errors are telling me to just use date_format
CAST(date_added AS TIME) AS "Time Only" -- cast the datetime object to just a time object
FROM products