--En yüksek rating değerlendirmeli 'Data Analysis' kurslarında ilk 10?
SELECT title,rating FROM courses
WHERE title ILIKE '%Data Analysis%'
ORDER BY rating DESC
LIMIT 10;

--Max rating değerinde kaç kurs vardır?
SELECT count(rating) FROM courses
WHERE rating = (SELECT MAX (rating) FROM courses);

--En fazla değerlendirilen kurs hangisidir?
SELECT title, num_reviews FROM courses
ORDER BY num_reviews DESC
LIMIT 1;

--En çok değerlendirilen 10 kurs?
SELECT title, num_reviews from courses
ORDER BY num_reviews DESC
LIMIT 10;

--Değerlendirme sayısı en yüksek ve değerlendirmesi ortalamanın üstünde olan kurslar? / EN POPÜLER 10 KURS
SELECT title, rating, num_reviews FROM courses
WHERE rating >= (SELECT avg(rating) FROM courses)
ORDER BY num_reviews DESC
LIMIT 10;


--Kurslardaki ortalama ders sayısı
SELECT avg(num_published_lectures) FROM courses;


--Eğitmenler ile kurslarını listeleyelim
SELECT c.title AS course, i.title AS instructor
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id;


--Her bir eğitmenin kaç eğitim videosu vardır?
SELECT instructors_id,
count(title) FROM courses
GROUP BY instructors_id
ORDER BY count(title) DESC;


--Kursların değerlendirme ortalamaları kaçtır?
SELECT avg(rating) FROM courses;


---Kaç tane data analyst eğitmen var?
SELECT count(job_title) FROM instructors
WHERE job_title ILIKE '%Data Analyst%';


--En fazla değerlendirilen 10 eğitmen / EN POPüLER 10 EĞİTMEN
SELECT i.title, c.num_reviews
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 10;

--En fazla değerlendirilen eğitmenin değerlendirme sıralamalı tüm kursları
SELECT title,rating FROM courses
WHERE instructors_id = (
SELECT i.id
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 1)
ORDER BY rating DESC;


--En fazla değerlendirilen eğitmenin id si
SELECT i.id
FROM courses c
INNER JOIN instructors i
ON i.id = c.instructors_id
ORDER BY num_reviews DESC
LIMIT 1;

--Toplam kaç kurs ve eğitmen var?
SELECT COUNT(DISTINCT instructors_id) AS total_instructors , COUNT(id) AS total_courses
FROM courses;

--En fazla değerlendirilen ve yüksek değer alan veri analizi kursları
SELECT title,num_reviews,rating FROM courses
WHERE title ILIKE '%Data Analysis%' AND rating > 4.5
ORDER BY num_reviews DESC
LIMIT 5;

