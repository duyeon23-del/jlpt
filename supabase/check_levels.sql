SELECT level, COUNT(*) FROM questions GROUP BY level ORDER BY level;
SELECT difficulty, COUNT(*) FROM question_skill_map GROUP BY difficulty ORDER BY difficulty;
