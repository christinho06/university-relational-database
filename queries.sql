-- SQL Queries

USE university_db;

-- 1. List all students with their enrolled courses and grades
SELECT s.name AS student, c.title AS course, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.name, c.title;

-- 2. Find average grade per course
SELECT c.title, AVG(e.grade) AS avg_grade, COUNT(e.student_id) AS enrolled
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.title;

-- 3. Find students enrolled in more than one course
SELECT s.name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 1;

-- 4. List courses taught by instructor in Computer Science
SELECT c.title, c.credits, i.name AS instructor
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
WHERE i.department = 'Computer Science';

-- 5. Find top student (highest average grade)
SELECT s.name, AVG(e.grade) AS avg_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
ORDER BY avg_grade DESC
LIMIT 1;

-- 6. List students NOT enrolled in any course
SELECT s.name, s.email
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 7. Update a student grade
UPDATE Enrollments SET grade = 95.0
WHERE student_id = 1 AND course_id = 1;

-- 8. Delete an enrollment
DELETE FROM Enrollments WHERE student_id = 5 AND course_id = 4;