--Show the number of lessons given per month during a specified year.
SELECT COUNT(*) FROM
	(SELECT start_time FROM group_lesson 
		UNION ALL 
	SELECT start_time FROM individual_lesson) as times

	WHERE 
		EXTRACT(YEAR FROM start_time::timestamp)=2020 and 
		EXTRACT(MONTH FROM start_time::timestamp)=03;

--Show how many students there are with no sibling, with one sibling, with two siblings, etc.


--List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons.


--List all ensembles held during the next week, sorted by music genre and weekday. For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.