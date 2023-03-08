---En yüksek rating değerlendirmeli 'Data Analysis' kurslarında ilk 10?
SELECT title,rating FROM courses
WHERE title ILIKE '%Data Analysis%'
ORDER BY rating DESC
LIMIT 10;

---Max rating değerinde kaç kurs vardır?
SELECT count(rating) FROM courses
WHERE rating = (SELECT MAX (rating) FROM courses);

---En fazla değerlendirilen kurs hangisidir?
SELECT title, num_reviews FROM courses
ORDER BY num_reviews DESC
LIMIT 1;

---En çok değerlendirilen 10 kurs?
SELECT title, num_reviews from courses
ORDER BY num_reviews DESC
LIMIT 10;

---Rating ve değerlendirme sayısı en yüksek olan kurslar
SELECT title, rating, num_reviews FROM courses;


---Kurslardaki ortalama ders sayısı
SELECT avg(num_published_lectures) FROM courses;


---Kursları eğitmenleri ile kurslarını listeleyelim
SELECT c.title AS course, i.title AS instructor
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id;

---Her bir eğitmenin kaç eğitim videosu vardır?
SELECT instructors_id,
count(title) FROM courses
GROUP BY instructors_id
ORDER BY count(title) DESC;

