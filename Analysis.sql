--Top 10 rated data analysis courses
SELECT title,rating FROM courses
WHERE title ILIKE '%Data Analysis%'
ORDER BY rating DESC
LIMIT 10;

--How many courses with the maximum rating
SELECT count(rating) FROM courses
WHERE rating = (SELECT MAX (rating) FROM courses);

--Most reviewed course
SELECT title, num_reviews FROM courses
ORDER BY num_reviews DESC
LIMIT 1;

--The ten most reviewed courses?
SELECT title, num_reviews from courses
ORDER BY num_reviews DESC
LIMIT 10;

--Courses with the highest number of reviews and above average ratings
SELECT title, rating, num_reviews FROM courses
WHERE rating >= (SELECT avg(rating) FROM courses)
ORDER BY num_reviews DESC
LIMIT 10;


--Average number of lessons of the courses
SELECT avg(num_published_lectures) FROM courses;


--List courses with tutorials
SELECT c.title AS course, i.title AS instructor
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id;


--How many courses do the instructors have?
SELECT instructors_id,
count(title) FROM courses
GROUP BY instructors_id
ORDER BY count(title) DESC;


--Average rating of courses
SELECT avg(rating) FROM courses;


---How many data analyst instructors are there?
SELECT count(job_title) FROM instructors
WHERE job_title ILIKE '%Data Analyst%';


--The ten most viewed instructors
SELECT i.title, c.num_reviews
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 10;

--Most reviewed instructor's courses? (Sorted by rating)
SELECT title,rating FROM courses
WHERE instructors_id = (
SELECT i.id
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 1)
ORDER BY rating DESC;


--The id of the most rated instructor
SELECT i.id
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 1;

--Total number of courses and instructors
SELECT COUNT(DISTINCT instructors_id) AS total_instructors , COUNT(id) AS total_courses
FROM courses;

--Most reviewed data analysis courses with a rating greater than 4.5
SELECT title,num_reviews,rating FROM courses
WHERE title ILIKE '%Data Analysis%' AND rating > 4.5
ORDER BY num_reviews DESC
LIMIT 5;

