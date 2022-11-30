--A1: Show the number of lessons given per month during a specified year -------------------------------------

SELECT COUNT(*) AS no_lessons FROM
	(SELECT start_time FROM group_lesson 
		UNION ALL 
	SELECT start_time FROM individual_lesson) as times
	WHERE 
		EXTRACT(YEAR FROM start_time::timestamp)=2020 AND 
		EXTRACT(MONTH FROM start_time::timestamp)=03
;

--------------------------------------------------------------------------------------------------------------


--A2: Show how many students there are with no sibling, with one sibling, with two siblings, etc -------------

SELECT COUNT(*) AS no_students ,result.count AS no_siblings FROM (
    SELECT COUNT(*) FROM sibling_student 
    GROUP BY student_id1
) AS result GROUP BY result.count ORDER BY no_siblings DESC;

--------------------------------------------------------------------------------------------------------------


--A3: List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons. ---------------------------




--- Using Views
---------------------------------------------------------------------------------
CREATE VIEW all_lesson_times AS
SELECT start_time, lesson_id FROM group_lesson 
	UNION ALL
SELECT start_time, lesson_id FROM individual_lesson;

CREATE VIEW monthly_lessons AS
SELECT lesson_id, instructor_id FROM all_lesson_times
INNER JOIN lesson AS all_lessons
ON all_lesson_times.lesson_id = all_lessons.id
WHERE EXTRACT(MONTH FROM start_time::timestamp)=03;

SELECT p.name, id_table.count
	FROM (SELECT instructors.person_id, COUNT(*)
		FROM monthly_lessons
		INNER JOIN
		-- Join with instructors based on instruct id
		instructor AS instructors
		ON instructors.id = monthly_lessons.instructor_id 
		-- Group by the instructor ids to get a count of lessons by instructor
		GROUP BY monthly_lessons.instructor_id, instructors.id) as id_table

	-- Join with person to get the names
	INNER JOIN person as p
	ON p.id = id_table.person_id
	-- The amount of lessons in the month should be above a number
	WHERE id_table.count > 0
	-- Sort by the count
	ORDER BY id_table.count DESC;

--- Using nested queries
---------------------------------------------------------------------------------
SELECT p.name, id_table.count
	FROM
		(SELECT instructors.person_id, COUNT(*)
			-- Select all lessons in the current month (03 for testing)
			FROM (SELECT * FROM
					(SELECT lesson_id FROM
						(SELECT start_time, lesson_id FROM group_lesson 
							UNION ALL
						SELECT start_time, lesson_id FROM individual_lesson) as _
						WHERE EXTRACT(MONTH FROM start_time::timestamp)=03) as lesson_ids
					INNER JOIN lesson AS l
					ON lesson_ids.lesson_id = l.id) AS lessons
			INNER JOIN
			-- Join with instructors based on instruct id
			instructor AS instructors
			ON instructors.id = lessons.instructor_id 
			-- Group by the instructor ids to get a count of lessons by instructor
			GROUP BY lessons.instructor_id, instructors.id) as id_table

	-- Join with person to get the names
	INNER JOIN person as p
	ON p.id = id_table.person_id
	-- The amount of lessons in the month should be above a number
	WHERE id_table.count > 0
	-- Sort by the count
	ORDER BY id_table.count DESC;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--A4: List all ensembles held during the next week, sorted by music genre and weekday. For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left -------------------------

-- code

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------