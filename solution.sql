-- Active: 1729142840375@@127.0.0.1@5432@university_db

-- creating db
CREATE DATABASE university_db

-- student table creation
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	email VARCHAR(100) NOT NULL,
	frontend_mark INT,
	backend_mark INT,
	status VARCHAR(10)
)


-- courses table creation 
CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	credits INT NOT NULL
)

-- enrolment table creation
CREATE TABLE enrollment(
	enrollment_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES students (student_id) NOT NULL,
	course_id INT REFERENCES courses (course_id) NOT NULL
)


-- Query 1:
-- insert students table data
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


-- insert courses table data
INSERT INTO courses(course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);


-- insert enrollment table data
INSERT INTO enrollment(student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);


-- Query 2:
SELECT s.student_name FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';


-- Query 3:
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
	SELECT student_id
	FROM students
	ORDER BY (frontend_mark + backend_mark) DESC
	LIMIT 1
)



SELECT * FROM students 