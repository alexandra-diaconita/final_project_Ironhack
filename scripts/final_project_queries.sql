USE final_project;

-- 1. Average final_score_subject_1 per year 

SELECT
    year,
    ROUND(AVG(final_score_subject_1), 2) AS avg_ro_language_score
FROM final_project.grades
WHERE final_score_subject_1 IS NOT NULL
GROUP BY year
ORDER BY year;

-- 2.Top 3 specializations by overall average score

SELECT
    sp.specialization_name,
    ROUND(AVG(g.average), 2) AS avg_final_score
FROM final_project.student s
JOIN final_project.specialization sp
    ON s.specialization_id = sp.specialization_id
JOIN final_project.grades g
    ON s.grades_id = g.grades_id
WHERE g.average IS NOT NULL
GROUP BY sp.specialization_name
ORDER BY avg_final_score DESC
LIMIT 3;

-- 3. Pass rate by specialization

SELECT
    sp.specialization_name,
    COUNT(*) AS total_students,
    SUM(CASE WHEN g.status = 'Promovat' THEN 1 ELSE 0 END) AS passed_students,
    ROUND(
        SUM(CASE WHEN g.status = 'Promovat' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS pass_rate_percent
FROM final_project.student s
JOIN final_project.specialization sp
    ON s.specialization_id = sp.specialization_id
JOIN final_project.grades g
    ON s.grades_id = g.grades_id
GROUP BY sp.specialization_name
ORDER BY pass_rate_percent DESC
LIMIT 5;

-- 4. Number of students who passed after graduation year 

SELECT
    g.year AS exam_year,
    COUNT(*) AS delayed_pass_students
FROM final_project.grades g
JOIN final_project.student s
    ON g.grades_id = s.grades_id
WHERE
    g.status = 'Promovat'
    AND g.year > s.graduation_year
GROUP BY g.year
ORDER BY g.year;

-- 5. The average score per core_subject_2 per year

SELECT
    year AS exam_year,
    sp.core_subject_2 as core_subject_2,
    ROUND(AVG(final_score_subject_2), 2) AS avg_score
FROM final_project.grades as g 
	JOIN final_project.student as s 
    ON g.grades_id = s.grades_id
    JOIN final_project.specialization as sp
    ON s.specialization_id = sp.specialization_id
GROUP BY g.year, sp.core_subject_2
ORDER BY year;

-- 6. Gender performance gap per year

SELECT
    g.year,
    gen.gender_type AS gender,
    ROUND(AVG(g.average), 2) AS avg_score
FROM final_project.grades AS g
JOIN final_project.student AS s
    ON g.grades_id = s.grades_id
JOIN final_project.gender AS gen
    ON s.gender_id = gen.gender_id
GROUP BY g.year, gen.gender_type
ORDER BY g.year, gen.gender_type;

-- 7. Average digital score per year 

SELECT
    year,
    ROUND(AVG(digital_score), 2) AS avg_digital_score
FROM final_project.grades
WHERE digital_score IS NOT NULL
GROUP BY year
ORDER BY year;

-- 8. Top 3 counties in which the students passed the exam with very good grades

SELECT
    c.county_name,
    ROUND(AVG(g.average), 2) AS avg_grade,
    COUNT(*) AS students_count
FROM final_project.grades AS g
JOIN final_project.student AS s
    ON g.grades_id = s.grades_id
JOIN final_project.school AS sc
    ON s.school_id = sc.school_id
JOIN final_project.locality AS l
    ON sc.locality_id = l.locality_id
JOIN final_project.county AS c
    ON l.county_id = c.county_id
WHERE
    g.average IS NOT NULL
GROUP BY
    c.county_id,
    c.county_name
ORDER BY
    avg_grade DESC
LIMIT 3;

-- 9. Top 3 counties where the students haven't passed the exam with good grades

SELECT
    c.county_name,
    ROUND(AVG(g.average), 2) AS avg_grade,
    COUNT(*) AS students_count
FROM final_project.grades AS g
JOIN final_project.student AS s
    ON g.grades_id = s.grades_id
JOIN final_project.school AS sc
    ON s.school_id = sc.school_id
JOIN final_project.locality AS l
    ON sc.locality_id = l.locality_id
JOIN final_project.county AS c
    ON l.county_id = c.county_id
WHERE
    g.average IS NOT NULL
GROUP BY
    c.county_id,
    c.county_name
ORDER BY
    avg_grade ASC
LIMIT 3;

-- 10. Pass rates (%) for each compulsory subject per year 

SELECT
    year,
    ROUND(SUM(status_subject_1 = 'Promovat') / COUNT(*) * 100, 2) AS subject_1_pass_rate,
    ROUND(SUM(status_subject_2 = 'Promovat') / COUNT(*) * 100, 2) AS subject_2_pass_rate,
    ROUND(SUM(status_elective_subject = 'Promovat') / COUNT(*) * 100, 2) AS elective_pass_rate
FROM final_project.grades
GROUP BY year
ORDER BY year;







