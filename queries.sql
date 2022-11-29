--Show the number of lessons given per month during a specified year.
SELECT COUNT(*) FROM
	(SELECT start_time FROM group_lesson 
		UNION ALL 
	SELECT start_time FROM individual_lesson) as times
	WHERE 
		EXTRACT(YEAR FROM start_time::timestamp)=2020 and 
		EXTRACT(MONTH FROM start_time::timestamp)=03
;

--Show how many students there are with no sibling, with one sibling, with two siblings, etc.
SELECT COUNT(*) FROM student INNER JOIN sibling_student 
    ON student.id = sibling_student.student_id1  
    OR student.id = sibling_student.student_id2
;

--List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons.

-- Select name and lesson count
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


--List all ensembles held during the next week, sorted by music genre and weekday. For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.