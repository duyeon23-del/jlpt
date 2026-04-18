SELECT '=== questions ===' AS section, type, sub_type, COUNT(*) AS n
FROM questions
GROUP BY type, sub_type
UNION ALL
SELECT '=== passages ===', type, sub_type, COUNT(*)
FROM passages
GROUP BY type, sub_type
ORDER BY section, type, sub_type;
