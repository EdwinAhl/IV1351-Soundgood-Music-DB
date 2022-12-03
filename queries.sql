--A1: Show the number of lessons given per month during a specified year -------------------------------------

-- All lessons
SELECT COUNT(*) AS no_lessons FROM
	(SELECT start_time FROM group_lesson 
		UNION ALL 
	SELECT start_time FROM individual_lesson) as times
	WHERE 
		EXTRACT(YEAR FROM start_time::timestamp)=2020 AND 
		EXTRACT(MONTH FROM start_time::timestamp)=03
;

-- All ensambles
CREATE OR REPLACE VIEW ensambles AS
SELECT lesson_id, start_time FROM ensamble INNER JOIN group_lesson USING(lesson_id);

-- All group lessons
CREATE OR REPLACE VIEW group_lessons AS
SELECT lesson_id, start_time FROM group_lesson EXCEPT SELECT * FROM ensambles;

-- All individual lessons
CREATE OR REPLACE VIEW individual_lessons AS
SELECT lesson_id, start_time FROM individual_lesson;

--- Print as 3 rows 
SELECT type, COUNT(*) FROM 
	(SELECT *, 'Ensamble' as type FROM ensambles
		UNION ALL
	SELECT *, 'Group' as type FROM group_lessons
		UNION ALL 
	SELECT *, 'Individual' as type FROM individual_lessons) as all_lessons
	WHERE 
		EXTRACT(YEAR FROM start_time::timestamp)=2020 AND 
		EXTRACT(MONTH FROM start_time::timestamp)=03
	GROUP BY type;
;

--------------------------------------------------------------------------------------------------------------


--A2: Show how many students there are with no sibling, with one sibling, with two siblings, etc -------------

-- Create view with the students who have siblings
CREATE OR REPLACE VIEW student_sibling_count AS
SELECT COUNT(*) AS no_students, count AS no_siblings FROM (
    SELECT COUNT(*) FROM sibling_student 
    GROUP BY student_id1
) AS result
GROUP BY count;

-- Join the view and calculate the amount of students with no siblings
SELECT COUNT(*) - (SELECT SUM(no_students) FROM student_sibling_count) AS no_students,
0 AS no_siblings 
FROM student
UNION ALL 
SELECT * FROM student_sibling_count
ORDER BY no_siblings DESC;

--------------------------------------------------------------------------------------------------------------


--A3: List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons. ---------------------------

--- Using Views
---------------------------------------------------------------------------------

-- Creates one view with all the lesson times, from all types 
CREATE OR REPLACE VIEW all_lesson_times AS
SELECT start_time, lesson_id FROM group_lesson 
	UNION ALL
SELECT start_time, lesson_id FROM individual_lesson;

-- Creates a view of the lessons done and from which instructor during a specified month
CREATE OR REPLACE VIEW monthly_lessons AS
SELECT lesson_id, instructor_id FROM all_lesson_times
INNER JOIN lesson AS all_lessons
ON all_lesson_times.lesson_id = all_lessons.id
WHERE EXTRACT(MONTH FROM start_time::timestamp)=03
AND EXTRACT(YEAR FROM start_time::timestamp)=2020;

-- Joins the monthly lessons with the instructor names
-- To count how many lessons are done by which instructors during a specified month.
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


--A4: List all ensembles held during the next week, sorted by music genre and weekday. For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left ---------------------

-- Create a small table with all ensambles with attendance
CREATE OR REPLACE VIEW ensambles_attendance AS
SELECT COUNT(*), lesson_id, genre FROM ensamble 
JOIN student_lesson USING(lesson_id)
GROUP BY lesson_id;

-- Get remaining slots as 'No slots' or the remaining number, easily modifiable.
CREATE OR REPLACE FUNCTION remaining_slots(max_students INT, count bigint)
returns VARCHAR(500)
language plpgsql AS
$$
DECLARE
   remaining_slots integer;
BEGIN
       remaining_slots = max_students - count;

    IF remaining_slots <= 0 THEN
        return 'No slots';
    END IF;

    return remaining_slots;
END;
$$;

-- Ensambles
SELECT * FROM (
	SELECT * FROM ensambles_attendance
		UNION ALL
	-- Need to also include all those ensambles with no attendance
	SELECT 0 as count, lesson_id, genre FROM ensamble 
		-- Remove the ones where we already have attendance
		EXCEPT SELECT 0, lesson_id, genre FROM ensambles_attendance) AS ensambles_info
    -- Join to get group info
    JOIN group_lesson USING (lesson_id)
    
    -- Between the start of next week and the week after that
    WHERE start_time BETWEEN 
    	DATE_TRUNC('week', CURRENT_TIMESTAMP) + interval '1 week'
    AND 
    	DATE_TRUNC('week', CURRENT_TIMESTAMP) + interval '2 week'
    ORDER BY genre DESC, EXTRACT(Day FROM start_time::timestamp);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------