-- Run this code to view the data in baby_names
SELECT *
FROM baby_names
LIMIT 5;

-- List the overall top five names in alphabetical order and find out if each name is "Classic" or "Trendy."
SELECT 
    first_name, 
	COUNT(first_name) AS sum,
    CASE 
        WHEN COUNT(first_name) > 50 THEN 'Trendy'
        ELSE 'Classic'
    END AS popularity_type
FROM baby_names
GROUP BY first_name
ORDER BY first_name
LIMIT 5;

-- Use this table for the answer to question 2:
-- What were the top 20 male names overall, and how did the name Paul rank?
SELECT RANK() OVER(ORDER BY SUM(num) DESC) AS name_rank,
	first_name,
    SUM(num)
FROM baby_names
WHERE sex = 'M'
GROUP BY first_name
ORDER BY sum DESC
LIMIT 20;

-- Use this table for the answer to question 3:
-- Which female names appeared in both 1920 and 2020?
SELECT a.first_name,
	a.num + b.num AS total_occurrences
FROM baby_names AS a
JOIN baby_names AS b
  ON a.first_name = b.first_name
     AND a.sex = b.sex
WHERE a.year = 1920
  AND b.year = 2020
  AND a.sex = 'F';
