-- Sample Data

USE university_db;

INSERT INTO Instructors (name, department, email) VALUES
('Dr. Alice Martin', 'Computer Science', 'alice@university.edu'),
('Prof. Bob Chen', 'Mathematics', 'bob@university.edu'),
('Dr. Carol White', 'Physics', 'carol@university.edu');

INSERT INTO Courses (title, credits, instructor_id) VALUES
('Introduction to Programming', 3, 1),
('Data Structures', 3, 1),
('Calculus I', 4, 2),
('Linear Algebra', 3, 2),
('Physics I', 4, 3);

INSERT INTO Students (name, email, age, major) VALUES
('Alice Johnson', 'alice.j@student.edu', 20, 'Computer Science'),
('Bob Smith', 'bob.s@student.edu', 22, 'Mathematics'),
('Carol Davis', 'carol.d@student.edu', 19, 'Physics'),
('David Wilson', 'david.w@student.edu', 21, 'Computer Science'),
('Eve Brown', 'eve.b@student.edu', 23, 'Mathematics');

INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 92.5), (1, 2, 88.0),
(2, 3, 95.0), (2, 4, 79.5),
(3, 5, 91.0), (3, 1, 85.0),
(4, 1, 78.0), (4, 2, 82.5),
(5, 3, 88.0), (5, 4, 91.5);