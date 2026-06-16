-- University Relational Database Schema (3NF)

CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- Students table
CREATE TABLE Students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  age INT NOT NULL CHECK (age > 17),
  major VARCHAR(100)
);

-- Instructors table
CREATE TABLE Instructors (
  instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  department VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE
);

-- Courses table
CREATE TABLE Courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  credits INT NOT NULL CHECK (credits > 0),
  instructor_id INT,
  FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ON DELETE SET NULL
);

-- Enrollments table (junction table, 3NF)
CREATE TABLE Enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  grade DECIMAL(4,2) CHECK (grade >= 0 AND grade <= 100),
  enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
  UNIQUE (student_id, course_id)
);