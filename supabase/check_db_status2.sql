SELECT type, sub_type, COUNT(*) AS n
FROM questions
GROUP BY type, sub_type
ORDER BY type, sub_type;

SELECT type, sub_type, COUNT(*) AS n
FROM passages
GROUP BY type, sub_type
ORDER BY type, sub_type;
